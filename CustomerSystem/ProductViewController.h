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

@interface ProductViewController : UIViewController

@property (nonatomic,retain) NSDictionary *productBasicInfo;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblTipInfo;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewArr;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@property (strong, nonatomic) IBOutlet UIView *bgContainer;

@property (nonatomic,retain) ProductBasicInfoView *basicInfoView;
@property (nonatomic,retain) ProductMaterialView *materialView;
@property (nonatomic,retain) UIWebView *energeView;

- (IBAction)changeView:(id)sender;

@end
