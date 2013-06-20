//
//  ProductViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-6-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductBasicInfoView.h"
#import "ProductMaterialView.h"
#import "ProductEnergyView.h"
#import "REMenu.h"
#import "ChoiceDateView.h"

@interface ProductViewController : UIViewController

@property (nonatomic,retain) NSDictionary *productBasicInfo;
@property (nonatomic,retain) QueryDate *querydate;
@property (nonatomic,retain) NSString *date;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblTipInfo;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewArr;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@property (strong, nonatomic) IBOutlet UIView *bgContainer;
@property (strong, nonatomic) IBOutlet UIView *viewRightBox;

@property (nonatomic,retain) ProductBasicInfoView *basicInfoView;//tag 1201
@property (nonatomic,retain) ProductMaterialView *materialView;//tag 1202
@property (nonatomic,retain) ProductEnergyView *energyView;//tag 1203
@property (strong, nonatomic) REMenu *menu;
- (IBAction)changeView:(id)sender;

@end
