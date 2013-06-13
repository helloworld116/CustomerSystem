//
//  ConditionViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-21.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ConditionViewController.h"

@interface ConditionViewController ()

@end

@implementation ConditionViewController

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
    self.dropDownList = [[DropDownList alloc] initWithFrame:CGRectMake(104, 20, 196, 30)];
//    [self.dropDownList setShowList:YES];
    self.startDate.text = @"2013-05-01";
    self.endDate.text = @"2013-05-31";
    [self.view addSubview:self.dropDownList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDropDownList:nil];
    [self setStartDate:nil];
    [self setEndDate:nil];
    [super viewDidUnload];
}
@end
