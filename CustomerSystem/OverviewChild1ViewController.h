//
//  OverviewChild1ViewController.h
//  CustomerSystem
//
//  Created by 文正光 on 13-6-18.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductOverviewViewController2.h"

@interface OverviewChild1ViewController : UIViewController

@property(nonatomic,retain) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UILabel *totalCost;
@property (strong, nonatomic) IBOutlet UILabel *totalOutput;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewRightArrow;

@property (nonatomic,retain) ProductOverviewViewController2 *containerViewController;
- (IBAction)expandOverview:(id)sender;
@end
