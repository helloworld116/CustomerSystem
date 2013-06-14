//
//  EquipmentDetailViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-4.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentDetailViewController.h"
#import "EquipmentStopRecordViewController.h"

@interface EquipmentDetailViewController ()

@end

@implementation EquipmentDetailViewController

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
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7-purple-back-button.png"]];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"7-purple-bar-button"] style:UIBarButtonSystemItemUndo target:self action:@selector(stopRecord:)];
    
//    self.title = [NSString stringWithFormat:@"%@详情",[self.equipment objectForKey:@"name"]];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"停机记录" style:UIBarButtonItemStyleBordered target:self action:@selector(stopRecord:)];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"equipment_expand_bg.png"]];
//    self.view.backgroundColor = [UIColor colorWithRed:228 green:231 blue:235 alpha:1];
////
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height = 55;
    self.view.frame = viewFrame;
    
    self.lblSN.text = [self.equipment objectForKey:@"sn"];
    self.lblSetflow.text = [NSString stringWithFormat:@"%.1f",[[self.equipment objectForKey:@"settingFlowRate"] doubleValue]];
    self.lblMomentflow.text = [NSString stringWithFormat:@"%.1f",[[self.equipment objectForKey:@"instantFlowRate"] doubleValue]];
    self.lblMonthlyAccumulation.text = [NSString stringWithFormat:@"%.1f",[[self.equipment objectForKey:@"partialOutput"] doubleValue]];
    self.lblMonthlyStopNum.text = [NSString stringWithFormat:@"%d",[[self.equipment objectForKey:@"stopCountMonthly"] intValue]];
    self.lblMonthlyStopTime.text = [Tool secondsToHour:[[self.equipment objectForKey:@"stopDurationMonthly"] longValue]];
    self.lblContinuousTime.text = [Tool secondsToHour:[[self.equipment objectForKey:@"runDuration"] longValue]];
}

-(void) stopRecord:(id)sender{
    EquipmentStopRecordViewController *stopRecordViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"stopRecordViewController"];
    [self.navigationController pushViewController:stopRecordViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLblSN:nil];
    [self setLblSetflow:nil];
    [self setLblMomentflow:nil];
    [self setLblMonthlyAccumulation:nil];
    [self setLblMonthlyStopNum:nil];
    [self setLblMonthlyStopTime:nil];
    [self setLblContinuousTime:nil];
    [super viewDidUnload];
}
@end
