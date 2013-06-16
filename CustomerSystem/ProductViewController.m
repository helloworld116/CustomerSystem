//
//  ProductViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-6-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kDuration 0.7   // 动画持续时间(秒)

@interface ProductViewController ()

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

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    UIBarButtonItem*backItem=[[UIBarButtonItem alloc] init];
//    backItem.title=@"fh";
//    [backItem setBackButtonBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];//更改背景图片
//    self.navigationItem.backBarButtonItem=backItem;

//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(0.0, 0.0, 53.0, 41.0);
//    [backButton setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
//    [backButton setImage:[UIImage imageNamed:@"backButton_selected.png"] forState:UIControlStateSelected];
//    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    temporaryBarButtonItem.title = @"fb";
//    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
//    self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
    
    self.bgContainer.layer.cornerRadius = 15;
    self.bgContainer.layer.masksToBounds = YES;
    self.title = [self.productBasicInfo objectForKey:@"productName"];
    
    self.basicInfoView = (ProductBasicInfoView *)[[[NSBundle mainBundle] loadNibNamed:@"ProductBasicInfoView" owner:self options:nil] objectAtIndex:0];
    self.basicInfoView.lblTotalCost.text = [[self.productBasicInfo objectForKey:@"totalCost"] stringValue];
    self.basicInfoView.lblUnitCost.text = [[self.productBasicInfo objectForKey:@"unitCost"] stringValue];;
    self.basicInfoView.lblTotalOutput.text = [[self.productBasicInfo objectForKey:@"output"] stringValue];;
    self.basicInfoView.lblCostPercent.text = [[self.productBasicInfo objectForKey:@"costPercent"] stringValue];;
    self.basicInfoView.lblOutputHuanbiIncrement.text = [[self.productBasicInfo objectForKey:@"outputHuanbiIncrement"] stringValue];;
    self.basicInfoView.lblOutputHuanbiRate.text = [[self.productBasicInfo objectForKey:@"outputHuanbiRate"] stringValue];;
    self.basicInfoView.lblOutputTongbiIncrement.text = [[self.productBasicInfo objectForKey:@"outputTongbiIncrement"] stringValue];;
    self.basicInfoView.lblOutputTongbiRate.text = [[self.productBasicInfo objectForKey:@"outputTongbiRate"] stringValue];;
    self.basicInfoView.lblCostHuanbiIncrement.text = [[self.productBasicInfo objectForKey:@"costHuanbiIncrement"] stringValue];;
    self.basicInfoView.lblCostHuanbiRate.text = [[self.productBasicInfo objectForKey:@"costHuanbiRate"] stringValue];;
    self.basicInfoView.lblCostTongbiIncrement.text = [[self.productBasicInfo objectForKey:@"costTongbiIncrement"] stringValue];;
    self.basicInfoView.lblCostTongbiRate.text = [[self.productBasicInfo objectForKey:@"costTongbiRate"] stringValue];;
    self.scrollViewContainer.contentSize = self.basicInfoView.frame.size;
    [self.scrollViewContainer addSubview:self.basicInfoView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)basicInfoView{
//    UIView *basicInfoView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 310, 350)];
//
//    CGFloat height = 30;
//    CGFloat viewHeight = 20;
//    UIView *cell1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0*height, basicInfoView.frame.size.width, height)];
//    CGFloat leftIndent = 20;
//    UILabel *lblDate = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 100, viewHeight)];
//    lblDate.text = [self.productBasicInfo objectForKey:@""];
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.frame = CGRectMake(120, 5, 100, viewHeight);
//    UILabel *lblOfBasic = [[UILabel alloc] initWithFrame:CGRectMake(120, 5, 80, viewHeight)];
//    lblOfBasic.text = @"基本信息";
//    UIImageView *arrowImgView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 5, 20, viewHeight)];
//    arrowImgView.image = [UIImage imageNamed:@"arr2.png"];
//    [cell1 addSubview:lblDate];
//    [cell1 addSubview:rightBtn];
//    [cell1 addSubview:arrowImgView];
//    
//    UIView *cell2 = [[UIView alloc] initWithFrame:CGRectMake(0, 1*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag2 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag2.text = @"成本总额：";
//    UILabel *lblValue2 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue2.text = [NSString stringWithFormat:@"%.2f",[[self.productBasicInfo objectForKey:@"totalCost"] doubleValue]];
//    [cell2 addSubview:lblTag2];
//    [cell2 addSubview:lblValue2];
//    
//    
//    UIView *cell3 = [[UIView alloc] initWithFrame:CGRectMake(0, 2*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag3 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag2.text = @"单位成本：";
//    UILabel *lblValue3 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue3.text = [NSString stringWithFormat:@"%.2f",[[self.productBasicInfo objectForKey:@"unitCost"] doubleValue]];
//    [cell3 addSubview:lblTag3];
//    [cell3 addSubview:lblValue3];
//    
//    UIView *cell4 = [[UIView alloc] initWithFrame:CGRectMake(0, 3*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag4 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag4.text = @"总产量：";
//    UILabel *lblValue4 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue4.text = [NSString stringWithFormat:@"%.2f",[[self.productBasicInfo objectForKey:@"output"] doubleValue]];
//    [cell4 addSubview:lblTag4];
//    [cell4 addSubview:lblValue4];
//    
//    UIView *cell5 = [[UIView alloc] initWithFrame:CGRectMake(0, 4*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag5 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag5.text = @"成本占比：";
//    UILabel *lblValue5 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue5.text = [NSString stringWithFormat:@"%.2f%@",[[self.productBasicInfo objectForKey:@"costPercent"] doubleValue],@"%"];
//    [cell5 addSubview:lblTag5];
//    [cell5 addSubview:lblValue5];
//    
//    UIView *cell6 = [[UIView alloc] initWithFrame:CGRectMake(0, 5*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag6 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag6.text = @"环比增量：";
//    UILabel *lblValue6 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue6.text = [self.productBasicInfo objectForKey:@""];
//    [cell6 addSubview:lblTag6];
//    [cell6 addSubview:lblValue6];
//    
//    UIView *cell7 = [[UIView alloc] initWithFrame:CGRectMake(0, 6*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag7 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag7.text = @"环比增长率：";
//    UILabel *lblValue7 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue7.text = [NSString stringWithFormat:@"%.2f%@",[[self.productBasicInfo objectForKey:@"costHuanbiRate"] doubleValue],@"%"];
//    [cell7 addSubview:lblTag7];
//    [cell7 addSubview:lblValue7];
//    
//    UIView *cell8 = [[UIView alloc] initWithFrame:CGRectMake(0, 7*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag8 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag8.text = @"同比增量：";
//    UILabel *lblValue8 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue8.text = [self.productBasicInfo objectForKey:@""];
//    [cell8 addSubview:lblTag8];
//    [cell8 addSubview:lblValue8];
//    
//    UIView *cell9 = [[UIView alloc] initWithFrame:CGRectMake(0, 8*height, basicInfoView.frame.size.width, height)];
//    UILabel *lblTag9 = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, 5, 80, viewHeight)];
//    lblTag9.text = @"同比增长率：";
//    UILabel *lblValue9 = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, viewHeight)];
//    lblValue9.text = [NSString stringWithFormat:@"%.2f%@",[[self.productBasicInfo objectForKey:@"outputTongbiRate"] doubleValue],@"%"];
//    [cell9 addSubview:lblTag9];
//    [cell9 addSubview:lblValue9];
//    
//    [basicInfoView addSubview:cell1];
//    [basicInfoView addSubview:cell2];
//    [basicInfoView addSubview:cell3];
//    [basicInfoView addSubview:cell4];
//    [basicInfoView addSubview:cell5];
//    [basicInfoView addSubview:cell6];
//    [basicInfoView addSubview:cell7];
//    [basicInfoView addSubview:cell8];
//    [basicInfoView addSubview:cell9];
//    
//    [self.view addSubview:basicInfoView];
//}



//#pragma mark -------------UITableViewDatasource-------------
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [[self.productBasicInfo allKeys] count];
//}
//
//#pragma mark -------------UITableViewDelegate-------------
//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        if (IS_Pad) {
//            return 120.f;
//        }else{
//            return 30.f;
//        }
//    }else{
//        if (IS_Pad) {
//            return 120.f;
//        }else{
//            return 92.f;
//        }
//    }
//}

- (void)viewDidUnload {
    [self setLblDate:nil];
    [self setLblTipInfo:nil];
    [self setImgViewArr:nil];
    [self setScrollViewContainer:nil];
    [self setBgContainer:nil];
    [self setBasicInfoView:nil];
    [super viewDidUnload];
}
- (IBAction)changeView:(id)sender {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"oglFlip";
    animation.subtype = kCATransitionFromLeft;
    if (self.materialView==nil) {
        self.materialView = [[ProductMaterialView alloc] initWithFrame:self.scrollViewContainer.bounds];
        [(UIScrollView *)[[self.materialView subviews] objectAtIndex:0] setBounces:NO];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ProductCostItem" ofType:@"html"];
        [self.materialView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
        [self.scrollViewContainer addSubview:self.materialView];
    }else{
        [self.scrollViewContainer bringSubviewToFront:self.materialView];
    }
    [[self.scrollViewContainer layer] addAnimation:animation forKey:@"animation"];
}
@end
