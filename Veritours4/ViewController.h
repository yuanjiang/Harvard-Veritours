//
//  ViewController.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/25/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sights.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (weak, nonatomic) IBOutlet UIButton *startWalkthrough;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property Sights *detailItem;

@end
