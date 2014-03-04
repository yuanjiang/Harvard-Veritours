//
//  MapAnnotation.h
//  Veritours4
//
//  Created by Yuan Jiang on 1/22/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) NSInteger jsonIndex;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString *)subtitle jsonIndex: (NSInteger) jsonIndex;

@end
