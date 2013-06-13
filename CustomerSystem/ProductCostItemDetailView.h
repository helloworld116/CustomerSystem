//
//  ProductCostItemDetailView.h
//  CustomerSystem
//
//  Created by wzg on 13-5-20.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCostItemDetailView : UIView
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *totalCost;
@property (strong, nonatomic) IBOutlet UILabel *totalLost;
@property (strong, nonatomic) IBOutlet UILabel *percent;
@property (strong, nonatomic) IBOutlet UILabel *chainGrowth;//环比增量
@property (strong, nonatomic) IBOutlet UILabel *chainGrowthRate;//环比增长率
@property (strong, nonatomic) IBOutlet UILabel *yearOnYearGrowthRate;
@property (strong, nonatomic) IBOutlet UILabel *yearOnYearGrowth;
@end
