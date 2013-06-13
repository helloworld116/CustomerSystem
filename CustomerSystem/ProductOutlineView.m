//
//  ProductOutlineView.m
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductOutlineView.h"

#define kFontNormal [UIFont systemFontOfSize:21.f]
#define kFontSmall [UIFont systemFontOfSize:18.f]
#define kFontBigBold [UIFont systemFontOfSize:25.f]
#define kFontBoldSmall [UIFont boldSystemFontOfSize:18.f]
#define kBlackColor [UIColor blackColor]
#define kRedColor [UIColor redColor]
#define kMarginLeft 10.f
#define kMarginTop 5.f
#define kHeight 30.f

@interface ProductOutlineView()
@property (nonatomic,retain) NSDictionary *outline;
@end

@implementation ProductOutlineView

- (id)initWithFrame:(CGRect)frame withOutline:(NSDictionary *)outline
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.outline = outline;
        [self addSubview];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)removeSubviews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)addSubview{
    //第一行
    UILabel *lblDate = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kMarginTop, 310, kHeight)];
    lblDate.text = [self.outline objectForKey:@"date"];
    lblDate.textAlignment = UITextAlignmentLeft;
    lblDate.textColor = kBlackColor;
    lblDate.font = kFontNormal;
    [self addSubview:lblDate];
    //第二行
    NSString *str1 = @"生产成本总额:";
    CGSize size1 = [str1 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kHeight, size1.width, kHeight)];
    lbl1.text = str1;
    lbl1.textAlignment = UITextAlignmentLeft;
    lbl1.textColor = kBlackColor;
    lbl1.font = kFontSmall;
    [self addSubview:lbl1];
    
    NSString *str2 = [self.outline objectForKey:@"cost"];
    CGSize size2 = [str2 sizeWithFont:kFontBigBold forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size1.width, kHeight, size2.width, kHeight)];
    lbl2.text = str2;
    lbl2.textAlignment = UITextAlignmentLeft;
    lbl2.textColor = kRedColor;
    lbl2.font = kFontBigBold;
    [self addSubview:lbl2];
    
    NSString *str3 = @"万元";
    CGSize size3 = [str3 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size1.width+size2.width, kHeight, size3.width, kHeight)];
    lbl3.text = str3;
    lbl3.textAlignment = UITextAlignmentLeft;
    lbl3.textColor = kBlackColor;
    lbl3.font = kFontSmall;
    [self addSubview:lbl3];
    //第3行
    NSString *str4 = @"环比增加";
    CGSize size4 = [str4 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kHeight*2, size4.width, kHeight)];
    lbl4.text = str4;
    lbl4.textAlignment = UITextAlignmentLeft;
    lbl4.textColor = kBlackColor;
    lbl4.font = kFontSmall;
    [self addSubview:lbl4];
    
    NSString *str5 = [self.outline objectForKey:@"hb1"];
    CGSize size5 = [str5 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size4.width, kHeight*2, size5.width, kHeight)];
    lbl5.text = str5;
    lbl5.textAlignment = UITextAlignmentLeft;
    lbl5.textColor = kBlackColor;
    lbl5.font = kFontBoldSmall;
    [self addSubview:lbl5];

    NSString *str6 = @"万元,环比增长率:";
    CGSize size6 = [str6 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size4.width+size5.width, kHeight*2, size6.width, kHeight)];
    lbl6.text = str6;
    lbl6.textAlignment = UITextAlignmentLeft;
    lbl6.textColor = kBlackColor;
    lbl6.font = kFontSmall;
    [self addSubview:lbl6];
    
    NSString *str7 = [self.outline objectForKey:@"hbl1"];
    CGSize size7 = [str7 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size4.width+size5.width+size6.width, kHeight*2, size7.width, kHeight)];
    lbl7.text = str7;
    lbl7.textAlignment = UITextAlignmentLeft;
    lbl7.textColor = kBlackColor;
    lbl7.font = kFontBoldSmall;
    [self addSubview:lbl7];
    //第4行
    NSString *str4_1 = @"同比增加";
    CGSize size4_1 = [str4_1 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl4_1 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kHeight*3, size4_1.width, kHeight)];
    lbl4_1.text = str4_1;
    lbl4_1.textAlignment = UITextAlignmentLeft;
    lbl4_1.textColor = kBlackColor;
    lbl4_1.font = kFontSmall;
    [self addSubview:lbl4_1];
    
    NSString *str4_2 = [self.outline objectForKey:@"tb1"];
    CGSize size4_2 = [str4_2 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl4_2 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size4_1.width, kHeight*3, size4_2.width, kHeight)];
    lbl4_2.text = str4_2;
    lbl4_2.textAlignment = UITextAlignmentLeft;
    lbl4_2.textColor = kBlackColor;
    lbl4_2.font = kFontBoldSmall;
    [self addSubview:lbl4_2];
    
    NSString *str4_3 = @"万元,同比增长率:";
    CGSize size4_3 = [str4_3 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl4_3 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size4_1.width+size4_2.width, kHeight*3, size4_3.width, kHeight)];
    lbl4_3.text = str4_3;
    lbl4_3.textAlignment = UITextAlignmentLeft;
    lbl4_3.textColor = kBlackColor;
    lbl4_3.font = kFontSmall;
    [self addSubview:lbl4_3];
    
    NSString *str4_4 = [self.outline objectForKey:@"tbl1"];
    CGSize size4_4 = [str4_4 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl4_4 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size4_1.width+size4_2.width+size4_3.width, kHeight*3, size4_4.width, kHeight)];
    lbl4_4.text = str4_4;
    lbl4_4.textAlignment = UITextAlignmentLeft;
    lbl4_4.textColor = kBlackColor;
    lbl4_4.font = kFontBoldSmall;
    [self addSubview:lbl4_4];

    //第5行
    NSString *str5_1 = @"总产量:";
    CGSize size5_1 = [str5_1 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl5_1 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kHeight*4, size5_1.width, kHeight)];
    lbl5_1.text = str5_1;
    lbl5_1.textAlignment = UITextAlignmentLeft;
    lbl5_1.textColor = kBlackColor;
    lbl5_1.font = kFontSmall;
    [self addSubview:lbl5_1];
    
    NSString *str5_2 = [self.outline objectForKey:@"zcl"];
    CGSize size5_2 = [str5_2 sizeWithFont:kFontBigBold forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl5_2 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size5_1.width, kHeight*4, size5_2.width, kHeight)];
    lbl5_2.text = str5_2;
    lbl5_2.textAlignment = UITextAlignmentLeft;
    lbl5_2.textColor = kRedColor;
    lbl5_2.font = kFontBigBold;
    [self addSubview:lbl5_2];
    
    NSString *str5_3 = @"吨";
    CGSize size5_3 = [str5_3 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl5_3 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size5_1.width+size5_2.width, kHeight*4, size5_3.width, kHeight)];
    lbl5_3.text = str5_3;
    lbl5_3.textAlignment = UITextAlignmentLeft;
    lbl5_3.textColor = kBlackColor;
    lbl5_3.font = kFontSmall;
    [self addSubview:lbl5_3];
    
    //第6行
    NSString *str6_1 = @"同比增加";
    CGSize size6_1 = [str6_1 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl6_1 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kHeight*5, size6_1.width, kHeight)];
    lbl6_1.text = str6_1;
    lbl6_1.textAlignment = UITextAlignmentLeft;
    lbl6_1.textColor = kBlackColor;
    lbl6_1.font = kFontSmall;
    [self addSubview:lbl6_1];
    
    NSString *str6_2 = [self.outline objectForKey:@"hb2"];
    CGSize size6_2 = [str6_2 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl6_2 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size6_1.width, kHeight*5, size6_2.width, kHeight)];
    lbl6_2.text = str6_2;
    lbl6_2.textAlignment = UITextAlignmentLeft;
    lbl6_2.textColor = kBlackColor;
    lbl6_2.font = kFontBoldSmall;
    [self addSubview:lbl6_2];
    
    NSString *str6_3 = @"吨,环比增长率:";
    CGSize size6_3 = [str6_3 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl6_3 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size6_1.width+size6_2.width, kHeight*5, size6_3.width, kHeight)];
    lbl6_3.text = str6_3;
    lbl6_3.textAlignment = UITextAlignmentLeft;
    lbl6_3.textColor = kBlackColor;
    lbl6_3.font = kFontSmall;
    [self addSubview:lbl6_3];
    
    NSString *str6_4 = [self.outline objectForKey:@"hbl2"];
    CGSize size6_4 = [str6_4 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl6_4 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size6_1.width+size6_2.width+size6_3.width, kHeight*5, size6_4.width, kHeight)];
    lbl6_4.text = str6_4;
    lbl6_4.textAlignment = UITextAlignmentLeft;
    lbl6_4.textColor = kBlackColor;
    lbl6_4.font = kFontBoldSmall;
    [self addSubview:lbl6_4];

    //第7行
    NSString *str7_1 = @"同比增加";
    CGSize size7_1 = [str7_1 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl7_1 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft, kHeight*6, size7_1.width, kHeight)];
    lbl7_1.text = str7_1;
    lbl7_1.textAlignment = UITextAlignmentLeft;
    lbl7_1.textColor = kBlackColor;
    lbl7_1.font = kFontSmall;
    [self addSubview:lbl7_1];
    
    NSString *str7_2 = [self.outline objectForKey:@"tb2"];
    CGSize size7_2 = [str7_2 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl7_2 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size7_1.width, kHeight*6, size7_2.width, kHeight)];
    lbl7_2.text = str7_2;
    lbl7_2.textAlignment = UITextAlignmentLeft;
    lbl7_2.textColor = kBlackColor;
    lbl7_2.font = kFontBoldSmall;
    [self addSubview:lbl7_2];
    
    NSString *str7_3 = @"吨,同比增长率:";
    CGSize size7_3 = [str7_3 sizeWithFont:kFontSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl7_3 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size7_1.width+size7_2.width, kHeight*6, size7_3.width, kHeight)];
    lbl7_3.text = str7_3;
    lbl7_3.textAlignment = UITextAlignmentLeft;
    lbl7_3.textColor = kBlackColor;
    lbl7_3.font = kFontSmall;
    [self addSubview:lbl7_3];
    
    NSString *str7_4 = [self.outline objectForKey:@"tbl2"];
    CGSize size7_4 = [str7_4 sizeWithFont:kFontBoldSmall forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeTailTruncation];
    UILabel *lbl7_4 = [[UILabel alloc] initWithFrame:CGRectMake(kMarginLeft+size7_1.width+size7_2.width+size7_3.width, kHeight*6, size7_4.width, kHeight)];
    lbl7_4.text = str7_4;
    lbl7_4.textAlignment = UITextAlignmentLeft;
    lbl7_4.textColor = kBlackColor;
    lbl7_4.font = kFontBoldSmall;
    [self addSubview:lbl7_4];
    
}

- (void)refreshWithOutLine:(NSDictionary *)outline{
    
}
@end
