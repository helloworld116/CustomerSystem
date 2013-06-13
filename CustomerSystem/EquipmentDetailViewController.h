//
//  EquipmentDetailViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-5-4.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipmentDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblSN;//编码
@property (strong, nonatomic) IBOutlet UILabel *lblSetflow;//设定流量
@property (strong, nonatomic) IBOutlet UILabel *lblMomentflow;//瞬时流量
@property (strong, nonatomic) IBOutlet UILabel *lblMonthlyAccumulation;//月积累量
@property (strong, nonatomic) IBOutlet UILabel *lblMonthlyStopNum;//月停机次数
@property (strong, nonatomic) IBOutlet UILabel *lblMonthlyStopTime;//月停机时长
@property (strong, nonatomic) IBOutlet UILabel *lblContinuousTime;//连续运行时长

@property (nonatomic,retain) NSDictionary *equipment;
@end
