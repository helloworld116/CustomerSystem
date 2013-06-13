//
//  EquipmentStopRecordCell.h
//  CustomerSystem
//
//  Created by wzg on 13-5-4.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipmentStopRecordCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblReason;
@property (strong, nonatomic) IBOutlet UILabel *lblContinuousTime;
@property (strong, nonatomic) IBOutlet UILabel *lblStopTime;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewStatus;
@property (strong, nonatomic) IBOutlet UILabel *lblRestoreTime;

@end
