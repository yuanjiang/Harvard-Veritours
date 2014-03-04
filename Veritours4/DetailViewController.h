//
//  DetailViewController.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/19/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sights.h"

@class Sights;
@interface DetailViewController : UIViewController



@property (strong, nonatomic) Sights *detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionView;

@property (weak, nonatomic) IBOutlet UINavigationItem *nav;

@property NSUInteger pageIndex;

@end
