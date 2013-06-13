//
//  ProductTableView.h
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) NSArray *products;

- (id)initWithFrame:(CGRect)frame withProducts:(NSArray *)products;
@end
