//
//  ConditionViewController.h
//  CustomerSystem
//
//  Created by wzg on 13-5-21.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownList.h"

@interface ConditionViewController : UIViewController
@property (strong, nonatomic) DropDownList *dropDownList;
@property (strong, nonatomic) IBOutlet UILabel *startDate;
@property (strong, nonatomic) IBOutlet UILabel *endDate;

@end
