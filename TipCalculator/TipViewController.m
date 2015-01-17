//
//  TipViewController.m
//  TipCalculator
//
//  Created by Xu He on 1/15/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (strong, nonatomic) IBOutlet UIView *mainViewer;

- (IBAction)onTap:(id)sender;
-(void)updateValues;
-(void)onSettingsButton;
-(void)viewWillAppear:(BOOL)animated;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Tip Calculator";
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:10 forKey:@"1st"];
        [defaults setInteger:15 forKey:@"2nd"];
        [defaults setInteger:20 forKey:@"3rd"];
        [defaults setInteger:0 forKey:@"themeIndex"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    int firstPercentage=[defaults integerForKey:@"1st"];
    int secondPercentage=[defaults integerForKey:@"2nd"];
    int thridPercentage=[defaults integerForKey:@"3rd"];
    int themIndex=[defaults integerForKey:@"themeIndex"];
    [self.tipControl setTitle: [NSString stringWithFormat:@"%d", firstPercentage] forSegmentAtIndex:0];
    [self.tipControl setTitle: [NSString stringWithFormat:@"%d", secondPercentage] forSegmentAtIndex:1];
    [self.tipControl setTitle: [NSString stringWithFormat:@"%d", thridPercentage] forSegmentAtIndex:2];
    if (themIndex == 0) {
        self.mainViewer.backgroundColor=[UIColor whiteColor];
    }else{
        self.mainViewer.backgroundColor=[UIColor greenColor];
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    int firstPercentage=[[self.tipControl titleForSegmentAtIndex:0] integerValue];
    int secondPercentage=[[self.tipControl titleForSegmentAtIndex:1] integerValue];
    int thridPercentage=[[self.tipControl titleForSegmentAtIndex:2] integerValue];
    float firststPer=(float)firstPercentage/100;
    float secondPer=(float)secondPercentage/100;
    float thridPer=(float)thridPercentage/100;
//    NSLog(@"$%0.2f", firststPer);
    
    NSArray *tipValues=@[@(firststPer), @(secondPer),@(thridPer)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    
    float totalAmount = tipAmount+billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

-(void)onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


@end
