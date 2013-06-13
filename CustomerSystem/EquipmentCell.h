//
//  EquipmentCell.h
//  CustomerSystem
//
//  Created by wzg on 13-4-27.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipmentCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblSN;
@property (strong, nonatomic) IBOutlet UIImageView *imgState;
@property long equipmentId;
- (IBAction)stopRecords:(id)sender;

@end
