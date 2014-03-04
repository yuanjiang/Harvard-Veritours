//
//  Data.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/21/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "Data.h"
#import "Sights.h"

@implementation Data

+(NSMutableArray *) makeSights{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coordinates" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
   
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];

    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"Top Site"]){
        NSString * title = [row objectForKey:@"Place"];
        NSString * intro = [row objectForKey:@"Introduction"];
       // NSString * history = [row objectForKey:@"History"];
       // NSString * facts = [row objectForKey:@"Fun Facts"];
        NSString * thumbnail = [row objectForKey:@"Thumbnail"];
        NSString * fullimage = [row objectForKey:@"Full Image"];
       Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
        
        [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}

+(NSMutableArray *) makeDorms{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coordinates" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"Student Dormitory"]){
            NSString * title = [row objectForKey:@"Place"];
            NSString * intro = [row objectForKey:@"Introduction"];
            // NSString * history = [row objectForKey:@"History"];
            // NSString * facts = [row objectForKey:@"Fun Facts"];
            NSString * thumbnail = [row objectForKey:@"Thumbnail"];
            NSString * fullimage = [row objectForKey:@"Full Image"];
            Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
            
            [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}


+(NSMutableArray *) makeBuildings{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coordinates" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"Campus Building"]){
            NSString * title = [row objectForKey:@"Place"];
            NSString * intro = [row objectForKey:@"Introduction"];
            // NSString * history = [row objectForKey:@"History"];
            // NSString * facts = [row objectForKey:@"Fun Facts"];
            NSString * thumbnail = [row objectForKey:@"Thumbnail"];
            NSString * fullimage = [row objectForKey:@"Full Image"];
            Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
            
            [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}

+(NSMutableArray *) makeAmerican{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"food" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"American"]){
            NSString * title = [row objectForKey:@"Restaurant"];
            NSString * intro = [row objectForKey:@"Description"];
            NSString * thumbnail = [row objectForKey:@"Thumbnail"];
            NSString * fullimage = [row objectForKey:@"Full Image"];
            Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
            
            [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}

+(NSMutableArray *) makeAsian{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"food" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"Asian"]){
            NSString * title = [row objectForKey:@"Restaurant"];
            NSString * intro = [row objectForKey:@"Description"];
            NSString * thumbnail = [row objectForKey:@"Thumbnail"];
            NSString * fullimage = [row objectForKey:@"Full Image"];
            Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
            
            [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}
+(NSMutableArray *) makeMexican{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"food" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"Mexican"]){
            NSString * title = [row objectForKey:@"Restaurant"];
            NSString * intro = [row objectForKey:@"Description"];
            NSString * thumbnail = [row objectForKey:@"Thumbnail"];
            NSString * fullimage = [row objectForKey:@"Full Image"];
            Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
            
            [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}
+(NSMutableArray *) makeDesserts{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"food" ofType:@"json"];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    
    NSArray *root = [[NSArray alloc] init];
    root = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    int index = 0;
    NSMutableArray *sites = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (NSDictionary *row in root) {
        NSString * category = [row objectForKey:@"Category"];
        if ([category isEqual:@"Desserts"]){
            NSString * title = [row objectForKey:@"Restaurant"];
            NSString * intro = [row objectForKey:@"Description"];
            NSString * thumbnail = [row objectForKey:@"Thumbnail"];
            NSString * fullimage = [row objectForKey:@"Full Image"];
            Sights *site = [[Sights alloc] initWithTitle:title description:intro thumbImage: [UIImage imageNamed:thumbnail] fullImage:[UIImage imageNamed:fullimage] ];
            
            [sites insertObject:site atIndex:index];
            index++;
        }
    }
    return sites;
    
}




@end
