//
//  MapViewController.m
//  Veritours4
//
//  Created by Yuan Jiang on 1/20/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "MapViewController.h"
#import "Sights.h"
#import "MapAnnotation.h"
#import "MapOverlay.h"
#import "SuggestedViewController.h"
#import "DetailViewController.h"
#import "ViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize time;
@synthesize fileName;
@synthesize indexOfPicked;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.indexOfPicked = 0;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coordinates" ofType:@"json"];
    //   Retrieve local JSON file called example.json
    NSError *error = nil; // This so that we can access the error if something goes wrong
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    //     Load the file into an NSData object called JSONData
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    /* NSString * title = @"Harvard";
     float latitude = 42.37453662;
     float longitude =-71.11738667;
     NSString * subtitle = @"hi";*/
    
    //keeps track of item's index in json file so we can pass data to the DetailView Controller
    int index = 0;
    // add pin to each coordinate on map
    for (NSDictionary *row in root) {
        NSString * title = [row objectForKey:@"Place"];
        NSNumber * latitude = [row objectForKey:@"Latitude"];
        NSNumber * longitude = [row objectForKey:@"Longitude"];
        NSString * subtitle = [row objectForKey:@"Description"];
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = latitude.doubleValue;
        coordinate.longitude = longitude.doubleValue;
        MapAnnotation *annotation = [[MapAnnotation alloc] initWithCoordinate:coordinate title:title subtitle:subtitle jsonIndex:index];
        [self.mapView addAnnotation:annotation];
        index++;
    }

    
    self.mapView.pitchEnabled = YES;
    self.mapView.showsBuildings = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.zoomEnabled = YES;
    self.mapView.scrollEnabled = YES;
    self.mapView.zoomEnabled = YES;

       self.mapView.delegate = self;
    
    switch (time){
        case 1:
        {
            fileName = @"30minutes";
            NSString *thePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
            NSArray *pointsArray = [NSArray arrayWithContentsOfFile:thePath];
            
            NSInteger pointsCount = pointsArray.count;
            
            CLLocationCoordinate2D pointsToUse[pointsCount];
            
            for(int i = 0; i < pointsCount; i++) {
                CGPoint p = CGPointFromString(pointsArray[i]);
                pointsToUse[i] = CLLocationCoordinate2DMake(p.x,p.y);
            }
            
            MKPolyline *myPolyline = [MKPolyline polylineWithCoordinates:pointsToUse count:pointsCount];
            
            [self.mapView addOverlay:myPolyline];

            break;
        }
           
        case 2:
        {
            fileName = @"1hour";
            break;
        }
        case 3:
        {
            fileName = @"90minutes";
            break;
        }
        case 4:
        {
            fileName = @"2hours";
            break;
        }
        case 5:
        {
            fileName = @"3hours";
            break;
        }
    }
    
        //only draws a route if we passed in a time from suggested view
        if (time != 0)
        {
        NSString *thePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSArray *pointsArray = [NSArray arrayWithContentsOfFile:thePath];
            
        NSInteger pointsCount = pointsArray.count;
            
        CLLocationCoordinate2D pointsToUse[pointsCount];
            
        for(int i = 0; i < pointsCount; i++) {
            CGPoint p = CGPointFromString(pointsArray[i]);
            pointsToUse[i] = CLLocationCoordinate2DMake(p.x,p.y);
        }
            
        MKPolyline *myPolyline = [MKPolyline polylineWithCoordinates:pointsToUse count:pointsCount];
            
        [self.mapView addOverlay:myPolyline];
        }
    
    
}

-(IBAction)openCamera:(id)sender
{
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://camera "];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}


//- (void)addPinstoMap{
  // }

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_mapView setShowsBuildings:YES];
    //1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 42.37453661916961;
    zoomLocation.longitude= -71.11738666892052;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 400, 400);
    [self.mapView setRegion:viewRegion animated:YES];
}

/*- (void)viewDidAppear:(BOOL)animated
{
    //Sights *sights = [[Sights alloc] init];
    //Sights *poi =
    CLLocationCoordinate2D poiCoordinates;
    float latitude = 38.22470;
    float longitude = -60.7031;
    poiCoordinates.latitude = latitude;
    poiCoordinates.longitude = longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poiCoordinates, 750, 750);
    [self.mapView setRegion:viewRegion animated:YES];
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//6
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    //7
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //8
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        //9
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorRed;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
        
    }else {
        annotationView.annotation = annotation;
    }
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightButton;
    
    //annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}


/*- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:MapOverlay.class]) {
        
        MapOverlay *overlayView = [[MapOverlay alloc] initWithOverlay:overlay];
        
        return overlayView;
    } else if ([overlay isKindOfClass:MKPolyline.class]) {
        MKPolylineView *lineView = [[MKPolylineView alloc] initWithOverlay:overlay];
        lineView.strokeColor = [UIColor blueColor];
        
        return lineView;
    }
    
    return nil;
}*/

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay {
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineView* aView = [[MKPolylineView alloc]initWithPolyline:(MKPolyline*)overlay] ;
        aView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        aView.lineWidth = 10;
        return aView;
    }
    return nil;
}

/*- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MapAnnotation";
    if ([annotation isKindOfClass:[MapAnnotation class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.tintColor = MKPinAnnotationColorRed;

            }
        else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}*/

- (void)mapView:(MapViewController *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
    MapAnnotation *pin = (MapAnnotation*)view.annotation;
    indexOfPicked = pin.jsonIndex;
    
    [self performSegueWithIdentifier:@"mapDetailSegue" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coordinates" ofType:@"json"];
    //   Retrieve local JSON file called example.json
    NSError *error = nil; // This so that we can access the error if something goes wrong
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    //     Load the file into an NSDatax object called JSONData
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    NSDictionary *row = [root objectAtIndex:indexOfPicked];
    NSString * title = [row objectForKey:@"Place"];
    NSString * description = [row objectForKey:@"Introduction"];
    NSString *thumbImage = [row objectForKey:@"Thumbnail"];
    NSString *fullImage = [row objectForKey:@"Full Image"];
    Sights *picked = [[Sights alloc] initWithTitle:title description:description thumbImage: [UIImage imageNamed:thumbImage] fullImage:[UIImage imageNamed:fullImage] ];
    ViewController* vc = (ViewController*)segue.destinationViewController;
    vc.detailItem = picked;
    

}
@end
