//
//  sightsTabViewController.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/20/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "sightsTabViewController.h"
#import "sightsViewController.h"
#import "Data.h"

@interface sightsTabViewController ()

@end

@implementation sightsTabViewController
@synthesize sights;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //sets Title
    self.title = @"Sites";
    sightsViewController *topsights = [self.viewControllers objectAtIndex:0];
    topsights.sights = sights;
    topsights.tabBarItem.title = @"Landmarks";
    topsights.tabBarItem.image = [UIImage imageNamed: @"marker.png"];
    
    //2nd tab
    sightsViewController *student = [self.viewControllers objectAtIndex:1];
    NSMutableArray *dorms = [Data makeDorms];
    student.sights = dorms;
    student.tabBarItem.title = @"Upperclass Houses";
    student.tabBarItem.image = [UIImage imageNamed: @"dorm.png"];
    
        
       //4th tab
    sightsViewController *campus = [self.viewControllers objectAtIndex:2];
    NSMutableArray *buildings = [Data makeBuildings];
    campus.sights = buildings;
    campus.tabBarItem.title = @"Campus Buildings";
    campus.tabBarItem.image = [UIImage imageNamed: @"building.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
