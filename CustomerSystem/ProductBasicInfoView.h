//
//  ProductBasicInfoView.h
//  CustomerSystem
//
//  Created by 文正光 on 13-6-16.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductBasicInfoView : UIView
@property (strong, nonatomic) IBOutlet UILabel *lblTotalCost;
@property (strong, nonatomic) IBOutlet UILabel *lblUnitCost;
@property (strong, nonatomic) IBOutlet UILabel *lblTotalOutput;
@property (strong, nonatomic) IBOutlet UILabel *lblCostPercent;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputHuanbiIncrement;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputHuanbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputTongbiIncrement;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputTongbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblCostHuanbiIncrement;
@property (strong, nonatomic) IBOutlet UILabel *lblCostHuanbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblCostTongbiIncrement;
@property (strong, nonatomic) IBOutlet UILabel *lblCostTongbiRate;
@end
