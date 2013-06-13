//
//  ProductOverviewViewController2.m
//  CustomerSystem
//
//  Created by wzg on 13-6-13.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductOverviewViewController2.h"

@interface ProductOverviewViewController2 ()

@end

@implementation ProductOverviewViewController2

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setOverviewTableView:nil];
    [self setProductListTableView:nil];
    [super viewDidUnload];
}
@end
