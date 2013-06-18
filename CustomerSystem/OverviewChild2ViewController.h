//
//  OverviewChild2ViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-6-18.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverviewChild2ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblCostHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblCostHuanbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblCostTongbi;
@property (strong, nonatomic) IBOutlet UILabel *lblCostTongbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputHuanbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputTongbi;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputTongbiRate;


@property (strong, nonatomic) IBOutlet UILabel *lblTagCostHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblTagCostTongbi;
@property (strong, nonatomic) IBOutlet UILabel *lblTagOutputHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblTagOutputTongbi;

@property (nonatomic,retain) NSDictionary *overview;
@end
