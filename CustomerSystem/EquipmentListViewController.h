//
//  EquipmentListViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-4-25.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFolderTableView.h"

@interface EquipmentListViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIFolderTableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImgView;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end
