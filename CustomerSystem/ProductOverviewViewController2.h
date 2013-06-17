//
//  ProductOverviewViewController2.h
//  CustomerSystem
//
//  Created by wzg on 13-6-13.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFolderTableView.h"
#import "FactoryCostItemView.h"
#import "REMenu.h"

@interface ProductOverviewViewController2 : UIViewController
@property (strong, nonatomic) IBOutlet UIView *viewBgContainer;
@property (strong, nonatomic) IBOutlet UIView *viewContainer;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewLeftArrow;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewRightArrow;
@property (strong, nonatomic) IBOutlet UITableView *productsTableView;//tag 1101
@property (strong, nonatomic) IBOutlet UIView *viewRightBox;
@property (strong, nonatomic) FactoryCostItemView *costItemView;//tag 1102
@property (strong, nonatomic) REMenu *menu;

- (IBAction)changeDate:(id)sender;
- (IBAction)expandOverview:(id)sender;
@end
