//
//  ProductViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-20.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductOutlineView.h"
#import "PopoverView.h"
#import "TSActionSheet.h"
#import "ProductCostItemDetailView.h"
#import <QuartzCore/QuartzCore.h>

@interface ProductViewController ()<PopoverViewDelegate,UIWebViewDelegate>

@end

@implementation ProductViewController

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
    NSDictionary *productOutline = [NSDictionary dictionaryWithObjectsAndKeys:@"2013年1月份",@"date",@"883.57",@"cost",@"18",@"hb1",@"7%",@"hbl1",@"53",@"tb1",@"8.1%",@"tbl1",@"220000",@"zcl",@"88",@"hb2",@"3.4%",@"hbl2",@"53",@"tb2",@"8.2%",@"tbl2",nil];
    ProductOutlineView *outlineView = [[ProductOutlineView alloc] initWithFrame:self.overviewView.bounds withOutline:productOutline];
    [self.overviewView addSubview:outlineView];
    [self.view bringSubviewToFront:self.overviewView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"总览概述" style:UIBarButtonItemStyleBordered target:self action:@selector(changeView:forEvent:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setOverviewView:nil];
    [self setMaterialsView:nil];
    [self setEnergyView:nil];
    [super viewDidUnload];
}

- (void)back{
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionFade];
    [animation setSubtype: kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
//    [[self viewController].navigationController pushViewController:viewController animated:NO];
    [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

-(void)changeView:(id)sender forEvent:(UIEvent*)event {
//    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 20)];
//    label1.backgroundColor = [UIColor clearColor];
//    label1.textAlignment = UITextAlignmentCenter;
//    label1.text = @"总览概述";
//    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 60, 20)];
//    label2.backgroundColor = [UIColor clearColor];
//    label2.textAlignment = UITextAlignmentCenter;
//    label2.text = @"能源损耗";
//    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 60, 20)];
//    label3.backgroundColor = [UIColor clearColor];
//    label3.textAlignment = UITextAlignmentCenter;
//    label3.text = @"原材料损耗";
//    [PopoverView showPopoverAtPoint:CGPointMake(kScreenWidth-20, -10) inView:self.view withViewArray:[NSArray arrayWithObjects:label1,label2,label3,nil] delegate:self];
    TSActionSheet *actionSheet = [[TSActionSheet alloc] initWithTitle:@"筛选设备"];
    actionSheet.frame = CGRectMake(0, 0, 100, 100);
    //    actionSheet.popoverBaseColor = [UIColor grayColor];
    //    actionSheet.backgroundColor = [UIColor grayColor];
    //    [actionSheet destructiveButtonWithTitle:@"所有" block:^{
    //        debugLog(@"所有");
    //    }];
    [actionSheet addButtonWithTitle:@"总览概述" block:^{
        debugLog(@"总览概述");
        [self.view performSelector:@selector(bringSubviewToFront:) withObject:self.overviewView afterDelay:0.5f];
        self.navigationItem.rightBarButtonItem.title = @"总览概述";
    }];
    [actionSheet addButtonWithTitle:@"能源损耗" block:^{
        debugLog(@"能源损耗");
        if ([self.materialsView subviews].count==0) {
            UIWebView *webview = [[UIWebView alloc] initWithFrame:self.materialsView.bounds];
            [(UIScrollView *)[[webview subviews] objectAtIndex:0] setBounces:NO];
            webview.delegate = self;
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Materials" ofType:@"html"];
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
            [self.materialsView addSubview:webview];
        }
        [self.view performSelector:@selector(bringSubviewToFront:) withObject:self.materialsView afterDelay:0.5f];
        self.navigationItem.rightBarButtonItem.title = @"能源损耗";
    }];
    [actionSheet addButtonWithTitle:@"原材料损耗" block:^{
        debugLog(@"原材料损耗");
        if ([self.energyView subviews].count==0) {
            UIWebView *webview = [[UIWebView alloc] initWithFrame:self.energyView.bounds];
            [(UIScrollView *)[[webview subviews] objectAtIndex:0] setBounces:NO];
            webview.delegate = self;
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Energy" ofType:@"html"];
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
            [self.energyView addSubview:webview];
        }
        [self.view performSelector:@selector(bringSubviewToFront:) withObject:self.energyView afterDelay:0.5f];
        self.navigationItem.rightBarButtonItem.title = @"原材料损耗";
    }];
    //    [actionSheet cancelButtonWithTitle:@"取消" block:nil];
    actionSheet.cornerRadius = 5;
    [actionSheet showWithTouch:event];
}


#pragma mark - PopoverViewDelegate Methods

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index {
    if (index==0) {
        [self.view performSelector:@selector(bringSubviewToFront:) withObject:self.overviewView afterDelay:0.5f];
        self.navigationItem.rightBarButtonItem.title = @"总览概述";
    }else if (index==1) {
        if ([self.materialsView subviews].count==0) {
            UIWebView *webview = [[UIWebView alloc] initWithFrame:self.materialsView.bounds];
            [(UIScrollView *)[[webview subviews] objectAtIndex:0] setBounces:NO];
            webview.delegate = self;
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Materials" ofType:@"html"];
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
            [self.materialsView addSubview:webview];
        }
        [self.view performSelector:@selector(bringSubviewToFront:) withObject:self.materialsView afterDelay:0.5f];
        self.navigationItem.rightBarButtonItem.title = @"能源损耗";
    } else if (index==2) {
        if ([self.energyView subviews].count==0) {
            UIWebView *webview = [[UIWebView alloc] initWithFrame:self.energyView.bounds];
            [(UIScrollView *)[[webview subviews] objectAtIndex:0] setBounces:NO];
            webview.delegate = self;
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Energy" ofType:@"html"];
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
            [self.energyView addSubview:webview];
        }
        [self.view performSelector:@selector(bringSubviewToFront:) withObject:self.energyView afterDelay:0.5f];
        self.navigationItem.rightBarButtonItem.title = @"原材料损耗";
    }
    //Dismiss the PopoverView after 0.5 seconds
    [popoverView performSelector:@selector(dismiss) withObject:nil afterDelay:0.5f];
}

- (void)popoverViewDidDismiss:(PopoverView *)popoverView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark begin webviewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if(([[components objectAtIndex:0] isEqualToString:@"sector"]&&[[components objectAtIndex:1] isEqualToString:@"false"])||([[components objectAtIndex:0] isEqualToString:@"legend"])){
        [self showCostItemDetail];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
#pragma mark end webviewDelegate

-(void) showCostItemDetail{
//    if ([self.productDetailView subviews].count==0) {
//        NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ProductCostItemDetailView"
//                                                        owner:self options:nil];
//        ProductCostItemDetailView * detailView = (ProductCostItemDetailView *)[bundle objectAtIndex:0];
//        [self.productDetailView addSubview:detailView];
//    }
//    
//    CATransition *animation = [CATransition animation];
//    animation.delegate = self;
//    animation.duration = kDuration;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = @"oglFlip";
//    animation.subtype = kCATransitionFromLeft;
//    NSUInteger container = [[self.view subviews] indexOfObject:self.containerView];
//    NSUInteger detail = [[self.view subviews] indexOfObject:self.productDetailView];
//    [self.view exchangeSubviewAtIndex:container withSubviewAtIndex:detail];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(show)];
//    
//    [[self.view layer] addAnimation:animation forKey:@"animation"];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"sector" message:@"test message"
                              delegate:self cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
//        [self performSelector:@selector(showCostItemDetail) withObject:nil afterDelay:0.5];
}
@end
