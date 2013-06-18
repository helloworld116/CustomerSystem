//
//  OverviewChild1ViewController.m
//  CustomerSystem
//
//  Created by 文正光 on 13-6-18.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "OverviewChild1ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "JWFolders2.h"
#import "OverviewChild2ViewController.h"

@interface OverviewChild1ViewController ()
@property (nonatomic,retain) OverviewChild2ViewController *childViewController;
@end

@implementation OverviewChild1ViewController

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
    //设置边框
//    self.view.layer.shadowOffset = CGSizeMake(1, 1);
//    self.view.layer.shadowOpacity = 1;
//    self.view.layer.shadowColor = [UIColor colorWithRed:166.0/255 green:187.0/255 blue:200.0/255 alpha:1.0].CGColor;
    self.view.layer.borderWidth = 1;
    self.view.layer.borderColor = [UIColor colorWithRed:220.0/255 green:221.0/255 blue:221.0/255 alpha:1.0].CGColor;
    self.totalCost.text = @"总成本：23463万元";
    self.totalOutput.text = @"总产量：7880230吨";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTotalCost:nil];
    [self setTotalOutput:nil];
    [self setImgViewRightArrow:nil];
    [super viewDidUnload];
}

- (IBAction)expandOverview:(id)sender {
     self.childViewController = [[OverviewChild2ViewController alloc] initWithNibName:NSStringFromClass([OverviewChild2ViewController class]) bundle:nil];
    CGPoint openPoint = CGPointMake(0,79); //arbitrary point,x不起作用，y是展开的起始点
    //展开
    [JWFolders2 openFolderWithContentView:self.childViewController.view position:openPoint containerView:self.containerViewController.viewBgContainer sender:self direction:1];
    
}
@end
