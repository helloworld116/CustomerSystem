//
//  PriceAssaint2ViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-14.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "PriceAssaint2ViewController.h"

#define kBtnStartTag 1000
#define kLblStartTag kBtnStartTag+100

#define kTitleNormalColor [UIColor grayColor]
#define kTitleHighlightColor [UIColor redColor]

@interface PriceAssaint2ViewController ()<UIWebViewDelegate>
@property int currentSelectBtnTag;
@property (nonatomic,retain) NSDictionary *currentProduct;//当前webview加载数据的product对象
@property (nonatomic,retain) NSArray *products;
@property (nonatomic,retain) NSMutableArray *webviewHasLoaded;
@property (nonatomic,retain) ASIFormDataRequest *request;
@end

@implementation PriceAssaint2ViewController

- (void)testProducts{
    self.products = [[NSArray alloc] initWithObjects:@"要闻",@"微闻",@"娱乐",@"体育",@"IT",@"财经",@"视频",@"直播",@"军事",nil];
//    self.products = [[NSArray alloc] initWithObjects:@"要闻微闻微闻娱乐",@"微闻",@"娱乐",@"体育",@"IT",@"财经",@"视频",@"直播",@"军事",nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)productList
{
    float titleWidth = 0;
    self.currentSelectBtnTag = 0;
    for (int i=0;i<self.products.count;i++) {
        NSString *product = [[self.products objectAtIndex:i] objectForKey:@"productName"];
        CGSize size = [product sizeWithFont:[UIFont systemFontOfSize:18]forWidth:CGFLOAT_MAX lineBreakMode:NSLineBreakByWordWrapping];
        CGRect rect = CGRectMake(titleWidth+5, 5, size.width+10, 20);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = rect;
        btn.tag = i + kBtnStartTag;
        [btn addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleScrollView addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:rect];
        label.tag = i + kLblStartTag;
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = kTitleNormalColor;
        label.text = product;
        [self.titleScrollView addSubview:label];
        titleWidth += (size.width+10);
    }
    //右边间距增大
    titleWidth += 10;
    //set self.titleScrollView
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.contentSize = CGSizeMake(titleWidth, self.titleScrollView.frame.size.height);
    
    //set self.contentScrollView
    self.contentScrollView.contentOffset = CGPointMake(0, 20);
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.frame.size.width*self.products.count, self.contentScrollView.bounds.size.height);
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
    
    //设置默认
    [self showIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [SVProgressHUD showWithStatus:@"正在加载..."];
    self.request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:kProductRecommendPrice]];
    [self.request setPostValue:kSharedApp.accessToken forKey:@"accessToken"];
    [self.request setPostValue:kSharedApp.factoryId forKey:@"factoryId"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleScrollView:nil];
    [self setContentScrollView:nil];
    [super viewDidUnload];
}

-(void) clickTitle:(id)sender{
    UIButton *btn = (UIButton *)sender;
    int index = btn.tag - kBtnStartTag;//index代表数据索引
    [self showIndex:index];
}

-(void) showIndex:(NSUInteger)index{
    [self highlightAtIndex:index];
    [self contentAtIndex:index];
}

-(void) highlightAtIndex:(NSUInteger)index{;
    UILabel *label = (UILabel *)[self.view viewWithTag:(index+kLblStartTag)];//btn和lbl的tag差100
    //高亮文字
    label.textColor = kTitleHighlightColor;
    if (self.currentSelectBtnTag!=0&&self.currentSelectBtnTag!=label.tag) {
       UILabel *beginSelected = (UILabel *)[self.view viewWithTag:self.currentSelectBtnTag];
        beginSelected.textColor = kTitleNormalColor;
    }
    self.currentSelectBtnTag = label.tag;
}

-(void) contentAtIndex:(NSUInteger)index{
    self.contentScrollView.contentOffset = CGPointMake(index*self.contentScrollView.bounds.size.width, 0);
    UIWebView *webView = nil;
    if ([@"NO" isEqualToString:[self.webviewHasLoaded objectAtIndex:index]]) {
        self.currentProduct = [self.products objectAtIndex:index];
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(index*self.contentScrollView.bounds.size.width, 0, self.contentScrollView.bounds.size.width, self.contentScrollView.bounds.size.height)];
        [(UIScrollView *)[[webView subviews] objectAtIndex:0] setBounces:NO];//禁用上下拖拽
        webView.delegate = self;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"PriceAssaint" ofType:@"html"];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
        [self.contentScrollView addSubview:webView];
        [self.webviewHasLoaded replaceObjectAtIndex:index withObject:@"YES"];
    }
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int contentOffsetX = (int)scrollView.contentOffset.x;
    int width = (int)scrollView.frame.size.width;
    if (contentOffsetX%width==0) {
        [self showIndex:contentOffsetX/width];
    }
}

#pragma mark -------------ASIHTTPRequestDelegate-------------

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    //    NSString *responseString = [request responseString];
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        [SVProgressHUD dismissWithSuccess:@"解析成功"];
        self.products = [NSArray arrayWithArray:[[dict objectForKey:@"data"] objectForKey:@"products"]];
        self.webviewHasLoaded = [[NSMutableArray alloc] initWithCapacity:self.products.count];
        for (int i=0; i<self.products.count; i++) {
            [self.webviewHasLoaded addObject:@"NO"];
        }
        [self productList];
    }else{
        [SVProgressHUD dismissWithError:@"解析失败"];
        debugLog(@"");
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    //    NSError *error = [request error];
}

#pragma mark begin webviewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    NSString *requestString = [[request URL] absoluteString];
//    NSArray *components = [requestString componentsSeparatedByString:@":"];
//    if(([[components objectAtIndex:0] isEqualToString:@"sector"]&&[[components objectAtIndex:1] isEqualToString:@"false"])||([[components objectAtIndex:0] isEqualToString:@"legend"])){
//        return NO;
//    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *data = @"[{ids:1,name:\"UC浏览器\",value:40.0,color:\"#4572a7\"},{ids:2,name:\"QQ浏览器\",value:37.1,color:\"#aa4643\"},{ids:3,name:\"欧朋浏览器\",value:13.8,color:\"#89a54e\"},{ids:4,name:\"百度浏览器\",value:1.6,color:\"#80699b\"},{ids:5,name:\"海豚浏览器\",value:1.4,color:\"#92a8cd\"},{ids:6,name:\"天天浏览器\",value:1.2,color:\"#db843d\"},{ids:7,name:\"其他\",value:4.9,color:\"#a47d7c\"}]";
//    function drawLineChart(todayPrice,dates,advicePrices,realPrices)
    NSString *todayPrice = [self.currentProduct objectForKey:@"advicePrice"];//今日推荐售价
    NSArray *prices = [self.currentProduct objectForKey:@"chardata"];
    NSMutableArray *advicePrice = [NSMutableArray arrayWithCapacity:prices.count];
    NSMutableArray *realPrice = [NSMutableArray arrayWithCapacity:prices.count];
    for (NSDictionary *dict in prices) {
        [advicePrice addObject:[dict objectForKey:@"advicePrice"]];
        [realPrice addObject:[dict objectForKey:@"price"]];
        [dict objectForKey:@"time"];
    }
    NSString *js = [@"drawLineChart(" stringByAppendingFormat:@"'%@','%@'%@",data,todayPrice,@")"];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)err{
    
}
#pragma mark end webviewDelegate
@end