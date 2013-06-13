//
//  ProductOverviewViewController2.h
//  CustomerSystem
//
//  Created by wzg on 13-6-13.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFolderTableView.h"

@interface ProductOverviewViewController2 : UIViewController
@property (strong, nonatomic) IBOutlet UIFolderTableView *overviewTableView;
@property (strong, nonatomic) IBOutlet UITableView *productListTableView;

@end
