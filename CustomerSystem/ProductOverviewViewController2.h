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

@property (strong, nonatomic) IBOutlet UIView *expandHiddenView;

//child1
@property (strong, nonatomic) IBOutlet UILabel *totalCost;
@property (strong, nonatomic) IBOutlet UILabel *totalOutput;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewChildRightArrow;

//child2
@property (strong, nonatomic) IBOutlet UILabel *lblCostHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblCostHuanbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblCostTongbi;
@property (strong, nonatomic) IBOutlet UILabel *lblCostTongbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputHuanbiRate;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputTongbi;
@property (strong, nonatomic) IBOutlet UILabel *lblOutputTongbiRate;


@property (strong, nonatomic) IBOutlet UILabel *lblTagCostHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblTagCostTongbi;
@property (strong, nonatomic) IBOutlet UILabel *lblTagOutputHuanbi;
@property (strong, nonatomic) IBOutlet UILabel *lblTagOutputTongbi;

- (IBAction)changeDate:(id)sender;
- (IBAction)expandOverview:(id)sender;
- (IBAction)expandChildOverview:(id)sender;
@end
