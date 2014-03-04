//
//  SuggestedViewController.m
//  Veritours4
//
//  Created by Shannon Lytle on 1/22/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "SuggestedViewController.h"
#import "MapViewController.h"

@interface SuggestedViewController ()

@end

@implementation SuggestedViewController
@synthesize times;
@synthesize pickedTime;

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
    
    //[[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
	// Do any additional setup after loading the view.
    times = [NSArray arrayWithObjects:@"30 minutes", @"1 hour", @"1.5 hours",@"2 hours", @"3+ hours", nil];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    [self.picker reloadAllComponents];
    self.pickedTime = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UIPicker Functions
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [times count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [times objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    
    NSLog(@"Selected Row %d", row);
    switch(row)
    {
            
        case 0:
            pickedTime = 1;
            break;
        case 1:
            pickedTime = 2;
            break;
        case 2:
            pickedTime = 3;
            break;
        case 3:
            pickedTime = 4;
            break;
        case 4:
            pickedTime = 5;
            break;
        case 5:
            pickedTime = 6;
            }
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MapViewController* vc = (MapViewController*)segue.destinationViewController;
    vc.time = pickedTime;
}

-(void) buttonPressed :(id)sender{
    [self performSegueWithIdentifier:@"loadRoute" sender:self];
}




@end
