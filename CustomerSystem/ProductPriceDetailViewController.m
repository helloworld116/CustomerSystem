//
//  ProductPriceDetailViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-8.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductPriceDetailViewController.h"
#import "PCLineChartView.h"
#import "JSONKit.h"

@interface ProductPriceDetailViewController ()
@property (retain,nonatomic) PCLineChartView *lineChartView;
@end

@implementation ProductPriceDetailViewController

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
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height = 300;
    self.view.frame = viewFrame;
    
//    [self.view setBackgroundColor:[UIColor lightGrayColor]];
////    [self.titleLabel setText:@"Line Chart"];
//    
//    self.lineChartView = [[PCLineChartView alloc] initWithFrame:CGRectMake(0,0,[self.view bounds].size.width,200)];
//    [self.lineChartView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
//    //		lineChartView.minValue = -40;
//    //		lineChartView.maxValue = 100;
//    self.lineChartView.minValue = 0;
//    self.lineChartView.maxValue = 100;
//    [self.view addSubview:self.lineChartView];
//    
//    NSString *sampleFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample_linechart_data.json"];
//    NSString *jsonString = [NSString stringWithContentsOfFile:sampleFile encoding:NSUTF8StringEncoding error:nil];
//    
//    NSDictionary *sampleInfo = [jsonString objectFromJSONString];
//    
//    NSMutableArray *components = [NSMutableArray array];
//    for (int i=0; i<[[sampleInfo objectForKey:@"data"] count]; i++)
//    {
//        NSDictionary *point = [[sampleInfo objectForKey:@"data"] objectAtIndex:i];
//        PCLineChartViewComponent *component = [[PCLineChartViewComponent alloc] init];
//        [component setTitle:[point objectForKey:@"title"]];
//        [component setPoints:[point objectForKey:@"data"]];
//        [component setShouldLabelValues:YES];
//        
//        if (i==0)
//        {
//            [component setColour:PCColorYellow];
//        }
//        else if (i==1)
//        {
//            [component setColour:PCColorGreen];
//        }
//        else if (i==2)
//        {
//            [component setColour:PCColorOrange];
//        }
//        else if (i==3)
//        {
//            [component setColour:PCColorRed];
//        }
//        else if (i==4)
//        {
//            [component setColour:PCColorBlue];
//        }
//        
//        [components addObject:component];
//    }
//    [self.lineChartView setComponents:components];
//    [self.lineChartView setXLabels:[sampleInfo objectForKey:@"x_labels"]];

//    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:webview];
//    [webview loadHTMLString:nil baseURL:[NSURL URLWithString:@"http://192.168.1.110:8080/dynamicmeasurement/servlet/DisplayChart?filename=jfreechart-2988761006448322015.png"]];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(500, 300);
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 500, 300)];
    imgView.image = [UIImage imageNamed:@"DisplayChart.png"];
    [scrollView addSubview:imgView];
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
