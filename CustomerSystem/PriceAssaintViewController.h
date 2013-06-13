//
//  PriceAssaintViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-5-8.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFolderTableView.h"
#import "PriceAssaintCell.h"
#import "ProductPriceDetailViewController.h"

@interface PriceAssaintViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIFolderTableView *productPriceTableview;

@end
