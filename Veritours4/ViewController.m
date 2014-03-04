//
//  ViewController.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/25/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize detailItem;
@synthesize pageTitles;
@synthesize pageImages;

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
    pageTitles = @[detailItem.description, @"SUP", @"OMG"];
    pageImages = @[detailItem.thumbImage, detailItem.fullImage, detailItem.thumbImage];
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageviewcontroller"];
    self.pageViewController.dataSource = self;
    
    DetailViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((DetailViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((DetailViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (DetailViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DetailViewController *detailviewcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"detailviewcontroller"];
    detailviewcontroller.detailItem = self.detailItem;
    detailviewcontroller.imageView.image = self.pageImages[index];
    detailviewcontroller.descriptionView.text = self.pageTitles[index];
    detailviewcontroller.pageIndex = index;
    
    return detailviewcontroller;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
