//
//  CollectionViewController.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/20/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailViewController.h"
#import "sightsViewController.h"
#import "homescreenIcon.h"
#import "MapViewController.h"

@interface CollectionViewController (){
    NSArray *iconPhotos;
}

@end

@implementation CollectionViewController
@synthesize sights = _sights;
@synthesize mapView = _mapView;
@synthesize iconText;

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
	// Do any additional setup after loading the view.
    iconPhotos = [NSArray arrayWithObjects: @"camera.png", @"map.png", @"routes.png",  @"food.png", nil];
    iconText =[NSArray arrayWithObjects: @"Sites", @"Map", @"Suggested Routes", @"Food", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return iconPhotos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collectionCell";
    
    homescreenIcon *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.cellImageView.image = [UIImage imageNamed:[iconPhotos objectAtIndex: indexPath.row]];
    //iconImageView.image = [UIImage imageNamed:[iconPhotos objectAtIndex:indexPath.row]];
    //UILabel *iconTextView = (UILabel *)[cell viewWithTag: 50];
    cell.cellTextView.text = [iconText objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"segueSights" sender:self];
            break;
        case 1: [self performSegueWithIdentifier:@"segueMap" sender:self];
            break;
        case 2: [self performSegueWithIdentifier:@"segueOther" sender:self];
            break;
        case 3: [self performSegueWithIdentifier:@"eat" sender:self];
            break;
        default: break;
    
    }}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueSights"]){
        sightsViewController* vc = (sightsViewController*)segue.destinationViewController;
        vc.sights = _sights;
    }
    else if ([segue.identifier isEqualToString:@"segueMap"]){
        MapViewController * mapvc = (MapViewController*)segue.destinationViewController;
        mapvc.mapView = _mapView;
        mapvc.time = 0;
    }
    
    else if ([segue.identifier isEqualToString:@"eat"]){
        sightsViewController* vc = (sightsViewController*)segue.destinationViewController;
        vc.sights = _sights;
    }
}



    

@end
