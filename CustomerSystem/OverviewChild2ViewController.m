//
//  OverviewChild2ViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-6-18.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "OverviewChild2ViewController.h"

@interface OverviewChild2ViewController ()

@end

@implementation OverviewChild2ViewController

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
    double costHuanbiIncrement = [[self.overview objectForKey:@"costHuanbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagCostHuanbi.text = @"成本环比减少：";
        self.lblCostHuanbi.text = [NSString stringWithFormat:@"%.2f",fabs(costHuanbiIncrement)];
    }else{
        self.lblCostHuanbi.text = [NSString stringWithFormat:@"%.2f",costHuanbiIncrement];
    }
    double costTongbiIncrement = [[self.overview objectForKey:@"costTongbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagCostTongbi.text = @"成本同比减少：";
        self.lblCostTongbi.text = [NSString stringWithFormat:@"%.2f",fabs(costTongbiIncrement)];
    }else{
        self.lblCostTongbi.text = [NSString stringWithFormat:@"%.2f",costTongbiIncrement];
    }
    double outputHuanbiIncrement = [[self.overview objectForKey:@"outputHuanbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagOutputHuanbi.text = @"产量环比减少：";
        self.lblOutputHuanbi.text = [NSString stringWithFormat:@"%.2f",fabs(outputHuanbiIncrement)];
    }else{
        self.lblOutputHuanbi.text = [NSString stringWithFormat:@"%.2f",outputHuanbiIncrement];
    }
    double outputTongbiIncrement = [[self.overview objectForKey:@"outputTongbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagOutputTongbi.text = @"产量同比减少：";
        self.lblOutputTongbi.text = [NSString stringWithFormat:@"%.2f",fabs(outputTongbiIncrement)];
    }else{
        self.lblOutputTongbi.text = [NSString stringWithFormat:@"%.2f",outputTongbiIncrement];
    }
    self.lblCostHuanbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"costHuanbiRate"] doubleValue],@"%"];
    self.lblCostTongbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"costTongbiRate"] doubleValue],@"%"];
    self.lblOutputHuanbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"outputHuanbiRate"] doubleValue],@"%"];
    self.lblOutputTongbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"outputTongbiRate"] doubleValue],@"%"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    self.lblCostHuanbi=nil;
    self.lblCostHuanbiRate=nil;
    self.lblCostTongbi=nil;
    self.lblCostTongbiRate=nil;
    self.lblOutputHuanbi=nil;
    self.lblOutputHuanbiRate=nil;
    self.lblOutputTongbi=nil;
    self.lblOutputTongbiRate=nil;
    self.lblTagCostHuanbi=nil;
    self.lblTagCostTongbi=nil;
    self.lblTagOutputHuanbi=nil;
    self.lblTagOutputTongbi=nil;
    [super viewDidUnload];
}
@end
