//
//  CollectionViewController.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/20/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CollectionViewController : UICollectionViewController

@property (nonatomic, strong)NSMutableArray *sights;
@property (nonatomic, strong)MKMapView *mapView;
@property (nonatomic, weak) NSArray *iconText;

@end
