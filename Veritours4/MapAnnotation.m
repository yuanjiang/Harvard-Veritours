//
//  MapAnnotation.m
//  Veritours4
//
//  Created by Yuan Jiang on 1/22/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString*)subtitle jsonIndex:(NSInteger)jsonIndex
{
    if((self = [super init]))
    {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
        self.jsonIndex = jsonIndex;
    }
    return self;
}

@end
