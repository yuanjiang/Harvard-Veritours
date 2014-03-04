//
//  FoodTabViewController.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/25/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "FoodTabViewController.h"
#import "Sights.h"
#import "sightsViewController.h"
#import "Data.h"

@interface FoodTabViewController ()

@end

@implementation FoodTabViewController
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
    self.title = @"Food";
    sightsViewController *food1 = [self.viewControllers objectAtIndex:0];
    NSMutableArray *american = [Data makeAmerican];
    food1.sights = american;
    food1.tabBarItem.title = @"Fast Food";
    food1.tabBarItem.image = [UIImage imageNamed: @"american.png"];
    

    
    //2nd tab
    sightsViewController *food2 = [self.viewControllers objectAtIndex:1];
    NSMutableArray *asian = [Data makeAsian];
    food2.sights = asian;
    food2.tabBarItem.title = @"Asian";
    food2.tabBarItem.image = [UIImage imageNamed: @"chinese.png"];
    
    //3rd tab
    sightsViewController *food3 = [self.viewControllers objectAtIndex:2];
    NSMutableArray *mexican = [Data makeMexican];
    food3.sights = mexican;
    food3.tabBarItem.title = @"Mexican";
    food3.tabBarItem.image = [UIImage imageNamed: @"mexican.png"];
    
    //4th tab
    sightsViewController *food4 = [self.viewControllers objectAtIndex:3];
    NSMutableArray *desserts = [Data makeDesserts];
    food4.sights = desserts;
    food4.tabBarItem.title = @"Desserts";
    food4.tabBarItem.image = [UIImage imageNamed: @"desserts.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
