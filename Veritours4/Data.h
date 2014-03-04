//
//  Data.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/21/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sights.h"

@interface Data : NSObject

+(NSMutableArray *) makeSights;
+(NSMutableArray *) makeDorms;
+(NSMutableArray *) makeBuildings;
+(NSMutableArray *) makeAmerican;
+(NSMutableArray *) makeAsian;
+(NSMutableArray *) makeMexican;
+(NSMutableArray *) makeDesserts;

@end
