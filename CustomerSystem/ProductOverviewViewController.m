//
//  ProductOverviewViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductOverviewViewController.h"
#import "ProductOutlineView.h"
#import "ProductTableView.h"
#import <QuartzCore/QuartzCore.h>
#import "ConditionViewController.h"

#define kHeaderViewBackgroundColor [UIColor whiteColor]
#define kDuration 0.7   // 动画持续时间(秒)
#define kLeftBarButtonItemDefault [[UIBarButtonItem alloc] initWithTitle:@"过滤" style:UIBarButtonItemStyleBordered target:self action:@selector(changeTime)]
#define kLeftBarButtonItemBack [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(show)]

@interface ProductOverviewViewController ()<UIWebViewDelegate,UIScrollViewDelegate,EGORefreshTableHeaderDelegate>
@property (nonatomic,retain) ProductOutlineView *outlineView;
@property (nonatomic,retain) ProductTableView *productTableView;
@property (nonatomic,retain) UIWebView *webview;
@property (nonatomic,retain) EGORefreshTableHeaderView *refreshHeaderView1,*refreshHeaderView2,*refreshHeaderView3;
@property BOOL isRefreshing1,isRefreshing2,isisRefreshing3;
@end

@implementation ProductOverviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = kLeftBarButtonItemDefault;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7-purple-menu-bar.png"]];
    //set self.scrollView
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height);
    self.scrollView.delegate = self;
    self.segment.tintColor = [UIColor grayColor];
    [self.segment addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self showInScreen:0];
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int contentOffsetX = (int)scrollView.contentOffset.x;
    int width = (int)scrollView.frame.size.width;
    int x = -1;
    if (contentOffsetX%width==0) {
        x = contentOffsetX/width ;
        self.segment.selectedSegmentIndex = x;
        [self showInScreen:x];
    }
}

-(void) segmentedControlChangedValue:(id)sender{
    int selectIndex = [sender selectedSegmentIndex];
    self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width*selectIndex, 0);
    [self showInScreen:selectIndex];
}

-(void) showInScreen:(NSInteger) index {
    CGRect rect = self.scrollView.bounds;
    switch (index) {
        case 0:
            if (self.outlineView==nil) {
                self.refreshHeaderView1 = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0,  -REFRESHINGVIEW_HEIGHT, kScreenWidth,REFRESHINGVIEW_HEIGHT)];
                self.refreshHeaderView1.tag = 1201;
                self.refreshHeaderView1.backgroundColor = kHeaderViewBackgroundColor;
                self.refreshHeaderView1.delegate = self;
                [self.refreshHeaderView1 refreshLastUpdatedDate];
                [self.scrollView addSubview:self.refreshHeaderView1];
                
                rect.origin.x = self.scrollView.frame.size.width*0;
                NSDictionary *productOutline = [NSDictionary dictionaryWithObjectsAndKeys:@"2013年1月份",@"date",@"883.57",@"cost",@"18",@"hb1",@"7%",@"hbl1",@"53",@"tb1",@"8.1%",@"tbl1",@"220000",@"zcl",@"88",@"hb2",@"3.4%",@"hbl2",@"53",@"tb2",@"8.2%",@"tbl2",nil];
                self.outlineView = [[ProductOutlineView alloc] initWithFrame:rect withOutline:productOutline];
                [self.scrollView addSubview:self.outlineView];
                self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*0, 0);
            }
            break;
        case 1:
            if (self.productTableView==nil) {
                self.refreshHeaderView2 = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(kScreenWidth,  -REFRESHINGVIEW_HEIGHT, kScreenWidth,REFRESHINGVIEW_HEIGHT)];
                self.refreshHeaderView2.tag = 1202;
                self.refreshHeaderView2.backgroundColor = kHeaderViewBackgroundColor;
                self.refreshHeaderView2.delegate = self;
                [self.refreshHeaderView2 refreshLastUpdatedDate];
                [self.scrollView addSubview:self.refreshHeaderView2];
                
                rect.origin.x = self.scrollView.frame.size.width*1;
                NSArray *products = [self testProducts];
                self.productTableView = [[ProductTableView alloc] initWithFrame:rect withProducts:products];
                [self.scrollView addSubview:self.productTableView];
            }
            break;
        case 2:
            if (self.webview==nil) {
                rect.origin.x = self.scrollView.frame.size.width*2;
                self.webview = [[UIWebView alloc] initWithFrame:rect];
                [(UIScrollView *)[[self.webview subviews] objectAtIndex:0] setBounces:NO];
                self.webview.delegate = self;
                NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ProductCostItem" ofType:@"html"];
                [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
                [self.scrollView addSubview:self.webview];
            }
            break;
        default:
            break;
    }
    
}

-(NSArray *) testProducts{
    NSArray *arrary = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"PS32.5",@"name",@"183.57万元",@"zcb",@"50000吨",@"zcl",@"131.4元/吨",@"dwcb", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"PS32.5",@"name",@"183.57万元",@"zcb",@"50000吨",@"zcl",@"131.4元/吨",@"dwcb", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"PS32.5",@"name",@"183.57万元",@"zcb",@"50000吨",@"zcl",@"131.4元/吨",@"dwcb", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"PS32.5",@"name",@"183.57万元",@"zcb",@"50000吨",@"zcl",@"131.4元/吨",@"dwcb", nil],nil];
    return arrary;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSegment:nil];
    [self setScrollView:nil];
    [self setContainerView:nil];
    [self setProductDetailView:nil];
    [super viewDidUnload];
}


#pragma mark -------------EGORefreshTableHeaderDelegate-------------
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    if (view.tag == 1201) {
        self.isRefreshing1 = YES;
        [self performSelector:@selector(updateOutline) withObject:nil afterDelay:3.0f];
    }
    if(view.tag == 1202){
        self.isRefreshing2 = YES;
        [self performSelector:@selector(doneLoadingTableViewData) withObject:self afterDelay:3.0f];  //make a delay to show loading process for a while
    }
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    if (view.tag == 1201) {
        return self.isRefreshing1;
    }else if (view.tag == 1202){
        return self.isRefreshing1;
    }else if(view.tag == 1203){
        return self.isRefreshing1;
    }
    return NO;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    return [NSDate date];
}


#pragma mark 重新加载表格数据
- (void)doneLoadingTableViewData{
//    if (self.isRefreshing)
//    {
//        self.isRefreshing = NO;
//        [self.refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
//        [self.equipments removeAllObjects];
//    }
//    //todo 从网络加载数据
//    [self equipmentsData:self.currentPage];
//    [self.tableView reloadData];
}

- (void)updateOutline{
    NSLog(@"updateOutline");
}

#pragma mark begin webviewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if(([[components objectAtIndex:0] isEqualToString:@"sector"]&&[[components objectAtIndex:1] isEqualToString:@"false"])||([[components objectAtIndex:0] isEqualToString:@"legend"])){
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"sector" message:[components objectAtIndex:2]
//                              delegate:self cancelButtonTitle:nil
//                              otherButtonTitles:@"OK", nil];
//        [alert show];
//        [self performSelector:@selector(showCostItemDetail) withObject:nil afterDelay:0.5];
        [self showCostItemDetail];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *data = @"[{ids:1,name:\"UC浏览器\",value:40.0,color:\"#4572a7\"},{ids:2,name:\"QQ浏览器\",value:37.1,color:\"#aa4643\"},{ids:3,name:\"欧朋浏览器\",value:13.8,color:\"#89a54e\"},{ids:4,name:\"百度浏览器\",value:1.6,color:\"#80699b\"},{ids:5,name:\"海豚浏览器\",value:1.4,color:\"#92a8cd\"},{ids:6,name:\"天天浏览器\",value:1.2,color:\"#db843d\"},{ids:7,name:\"其他\",value:4.9,color:\"#a47d7c\"}]";
    NSString *title=@"2013年";
    NSString *js = [@"drawPie(" stringByAppendingFormat:@"'%@','%@'%@",data,title,@")"];
    [self.webview stringByEvaluatingJavaScriptFromString:js];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)err{
    
}
#pragma mark end webviewDelegate

-(void) showCostItemDetail{
    if ([self.productDetailView subviews].count==0) {
        NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ProductCostItemDetailView"
                                                        owner:self options:nil];
        ProductCostItemDetailView * detailView = (ProductCostItemDetailView *)[bundle objectAtIndex:0];
        detailView.name.text = @"原材料成本";
        detailView.totalCost.text = @"441.79万元";
        detailView.totalLost.text = @"18742吨";
        detailView.percent.text = @"50.45%";
        detailView.chainGrowth.text = @"-6吨";
        detailView.chainGrowthRate.text = @"-8%";
        detailView.yearOnYearGrowth.text = @"-20吨";
        detailView.yearOnYearGrowthRate.text =@"-9%";
        [self.productDetailView addSubview:detailView];
    }
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"oglFlip";
    animation.subtype = kCATransitionFromLeft;
    NSUInteger container = [[self.view subviews] indexOfObject:self.containerView];
    NSUInteger detail = [[self.view subviews] indexOfObject:self.productDetailView];
    [self.view exchangeSubviewAtIndex:container withSubviewAtIndex:detail];
    self.navigationItem.leftBarButtonItem = kLeftBarButtonItemBack;
    [[self.view layer] addAnimation:animation forKey:@"animation"];
}

-(void) show{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"oglFlip";
    animation.subtype = kCATransitionFromRight;
    NSUInteger container = [[self.view subviews] indexOfObject:self.containerView];
    NSUInteger detail = [[self.view subviews] indexOfObject:self.productDetailView];
    [self.view exchangeSubviewAtIndex:detail withSubviewAtIndex:container];
    self.navigationItem.leftBarButtonItem = kLeftBarButtonItemDefault;
    [[self.view layer] addAnimation:animation forKey:@"animation"];
}

-(void) changeTime{
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionPush];
    [animation setSubtype: kCATransitionFromLeft];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    ConditionViewController *conditionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"conditionViewController"];
    [self.navigationController pushViewController:conditionViewController animated:NO];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}
@end
