//
//  sightsViewController.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/19/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@class DetailViewController;

@interface sightsViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *sights;
@property (strong, nonatomic) DetailViewController *detailViewController;

@end
