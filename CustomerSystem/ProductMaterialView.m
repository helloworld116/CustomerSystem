//
//  ProductMaterialView.m
//  CustomerSystem
//
//  Created by 文正光 on 13-6-16.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductMaterialView.h"
#import "RNBlurModalView.h"

@implementation ProductMaterialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.scalesPageToFit =IS_RETINA;
        self.delegate = self;
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


#pragma mark begin webviewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if(([[components objectAtIndex:0] isEqualToString:@"sector"]&&[[components objectAtIndex:1] isEqualToString:@"false"])||([[components objectAtIndex:0] isEqualToString:@"legend"])){
            debugLog(@"the dict is %@",[self.materials objectAtIndex:[[components objectAtIndex:2] intValue]]);
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            view.backgroundColor = [UIColor redColor];
            view.layer.cornerRadius = 5.f;
            view.layer.borderColor = [UIColor blackColor].CGColor;
            view.layer.borderWidth = 5.f;
            RNBlurModalView *modal = [[RNBlurModalView alloc] initWithViewController:[self viewController] view:view];
            [modal show];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<self.materials.count; i++) {
        NSDictionary *dict = [self.materials objectAtIndex:i];
        NSMutableDictionary *newDict = [[NSMutableDictionary alloc] initWithCapacity:0];
        [newDict setValue:[dict objectForKey:@"material"] forKey:@"name"];
        [newDict setValue:[NSNumber numberWithDouble:[[dict objectForKey:@"usagePercent"] doubleValue]*100] forKey:@"value"];
        [newDict setValue:[colorList objectAtIndex:i] forKey:@"color"];
        [newDict setValue:[NSNumber numberWithInt:i] forKey:@"ids"];
        [arr addObject:newDict];
    }
    NSString *data = [Tool objectToString:arr];
//    NSString *data = @"[{ids:1,name:\"UC浏览器\",value:40.0,color:\"#4572a7\"},{ids:2,name:\"QQ浏览器\",value:37.1,color:\"#aa4643\"},{ids:3,name:\"欧朋浏览器\",value:13.8,color:\"#89a54e\"},{ids:4,name:\"百度浏览器\",value:1.6,color:\"#80699b\"},{ids:5,name:\"海豚浏览器\",value:1.4,color:\"#92a8cd\"},{ids:6,name:\"天天浏览器\",value:1.2,color:\"#db843d\"},{ids:7,name:\"其他\",value:4.9,color:\"#a47d7c\"}]";
    NSString *title=@"2013年";
    NSString *js = [@"drawPie(" stringByAppendingFormat:@"'%@','%@'%@",data,title,@")"];
    debugLog(@"product material send to html data is :%@",js);
    [self stringByEvaluatingJavaScriptFromString:js];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
#pragma mark end webviewDelegate

//UIView获取所属的UIViewController范例
-(UIViewController *)viewController{
    for (UIView *next = [self superview]; next; next = [next superview]) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
