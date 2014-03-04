//
//  MapViewController.h
//  Veritours4
//
//  Created by Yuan Jiang on 1/20/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property int time;
@property (weak, nonatomic) NSString *fileName;
@property (nonatomic, assign) NSInteger indexOfPicked;

-(IBAction)openCamera:(id)sender;

//- (void)addPinstoMap;
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;

@end