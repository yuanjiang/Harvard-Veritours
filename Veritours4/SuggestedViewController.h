//
//  SuggestedViewController.h
//  Veritours4
//
//  Created by Shannon Lytle on 1/22/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestedViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property int pickedTime;

@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (nonatomic, strong) NSArray *times;
-(void) buttonPressed :(id)sender;

@end
