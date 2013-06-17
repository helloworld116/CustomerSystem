//
//  FactoryCostItemView.m
//  CustomerSystem
//
//  Created by wzg on 13-6-17.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "FactoryCostItemView.h"

@implementation FactoryCostItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
        //        [self showCostItemDetail];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<self.costItems.count; i++) {
        NSDictionary *dict = [self.costItems objectAtIndex:i];
        NSMutableDictionary *newDict = [[NSMutableDictionary alloc] initWithCapacity:0];
        [newDict setValue:[dict objectForKey:@"itemName"] forKey:@"name"];
        [newDict setValue:[NSNumber numberWithDouble:[[dict objectForKey:@"percent"] doubleValue]*100] forKey:@"value"];
        [newDict setValue:[colorList objectAtIndex:i] forKey:@"color"];
        [arr addObject:newDict];
    }
    NSString *data = [Tool objectToString:arr];
//    NSString *data = @"[{ids:1,name:\"UC浏览器\",value:40.0,color:\"#4572a7\"},{ids:2,name:\"QQ浏览器\",value:37.1,color:\"#aa4643\"},{ids:3,name:\"欧朋浏览器\",value:13.8,color:\"#89a54e\"},{ids:4,name:\"百度浏览器\",value:1.6,color:\"#80699b\"},{ids:5,name:\"海豚浏览器\",value:1.4,color:\"#92a8cd\"},{ids:6,name:\"天天浏览器\",value:1.2,color:\"#db843d\"},{ids:7,name:\"其他\",value:4.9,color:\"#a47d7c\"}]";
    NSString *title=@"2013年";
    NSString *js = [@"drawPie(" stringByAppendingFormat:@"'%@','%@'%@",data,title,@")"];
    [self stringByEvaluatingJavaScriptFromString:js];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
#pragma mark end webviewDelegate

@end
