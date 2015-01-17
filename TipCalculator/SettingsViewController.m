//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Xu He on 1/16/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstFiled;
@property (weak, nonatomic) IBOutlet UITextField *secondField;
@property (weak, nonatomic) IBOutlet UITextField *thirdField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickSaveButton:(id)sender {
    int firstPercentage=[self.firstFiled.text integerValue];
    int secondPercentage=[self.secondField.text integerValue];
    int thirdPercentage=[self.thirdField.text integerValue];
//    NSLog(@"%d", secondPercentage);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (firstPercentage!=0) {
        [defaults setInteger:firstPercentage forKey:@"1st"];
    }
    if (secondPercentage!=0) {
        [defaults setInteger:secondPercentage forKey:@"2nd"];
    }
    if (thirdPercentage!=0) {
        [defaults setInteger:thirdPercentage forKey:@"3rd"];
    }
    
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
@end
