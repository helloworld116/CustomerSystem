//
//  EquipmentViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-6-8.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentViewController.h"

@interface EquipmentViewController ()

@end

@implementation EquipmentViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"设备列表";
//    f3f5f7
    self.tableView.backgroundColor = [UIColor colorWithRed:243 green:245 blue:247 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setHeaderImgView:nil];
    [self setTableView:nil];
    [self setBgImgView:nil];
    [super viewDidUnload];
}
@end
