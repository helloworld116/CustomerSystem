//
//  EquipmentStopRecordViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-5-4.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipmentStopRecordViewController : UIViewController
@property long equipmentId;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
