//
//  UINavigationBar+CustomImage.m
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "UINavigationBar+CustomImage.h"

@implementation UINavigationBar (CustomImage)

-(void)drawRect:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"7-purple-menu-bar.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end
