//
//  ProductOutlineView.h
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductOutlineView : UIScrollView

- (id)initWithFrame:(CGRect)frame withOutline:(NSDictionary *)outline;

- (void)refreshWithOutLine:(NSDictionary *)outline;
@end
