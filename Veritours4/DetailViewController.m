//
//  DetailViewController.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/19/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "DetailViewController.h"
#import "Sights.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController
@synthesize pageIndex;



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
    
    switch (pageIndex) {
        case 0:
            self.descriptionView.text = self.detailItem.description;
            self.imageView.image = self.detailItem.fullImage;
            break;
        case 1:
            self.descriptionView.text = @"FUCK THIS SHIT";
            self.imageView.image = self.detailItem.thumbImage;
            break;
        case 2:
            self.descriptionView.text = @"I CANT BELIEVE THIS WORKS";
            self.imageView.image = self.detailItem.fullImage;
            break;
        default:
            self.descriptionView.text = self.detailItem.description;
            self.imageView.image = self.detailItem.fullImage;
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.nav.title = self.detailItem.title;
        self.descriptionView.text = self.detailItem.description;
        self.imageView.image = self.detailItem.fullImage;
        
    }
}
@end
