//
//  ProductCell.h
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *lblTagName;
@property (strong, nonatomic) IBOutlet UILabel *lblTagCost;
@property (strong, nonatomic) IBOutlet UILabel *lblTagTotalOutput;
@property (strong, nonatomic) IBOutlet UILabel *lblTagUnitCost;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblCost;
@property (strong, nonatomic) IBOutlet UILabel *lblOutput;
@property (strong, nonatomic) IBOutlet UILabel *lblUnitCost;
@end
