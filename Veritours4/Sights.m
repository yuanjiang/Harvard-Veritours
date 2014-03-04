//
//  Sights.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/19/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "Sights.h"

@implementation Sights

@synthesize title = _title;
@synthesize description = _description;

-(id)initWithTitle:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage fullImage:(UIImage*)fullImage {
    if ((self = [super init])) {
        self.title = title;
        self.description = description;
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}


@end

