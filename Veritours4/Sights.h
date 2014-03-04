//
//  Sights.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/19/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sights : NSObject

@property(strong) NSString *title;
@property(strong) NSString *description;
@property(strong) UIImage *thumbImage;
@property(strong) UIImage *fullImage;

-(id)initWithTitle: (NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbimage fullImage:(UIImage*)fullImage;

@end
