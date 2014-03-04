//
//  MapOverlay.h
//  Veritours4
//
//  Created by Yuan Jiang on 1/22/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MapOverlay : MKOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay;

@end
