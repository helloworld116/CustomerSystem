//
//  ProductOverviewViewController2.m
//  CustomerSystem
//
//  Created by wzg on 13-6-13.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductOverviewViewController2.h"
#import "ProductCell.h"
#import "ProductViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ChoiceDateView.h"

#define kDuration 0.7   // 动画持续时间(秒)
//生产总览
//{\"error\":0,\"message\":null,\"data\":{\"overview\":{\"costHuanbiIncrement\":34656,\"outputTongbiIncrement\":5066,\"totalCost\":623589,\"totalOutput\":60000,\"outputTongbiRate\":0.28,\"outputHuanbiRate\":0.21,\"costTongbiIncrement\":54123,\"costTongbiRate\":0.24,\"costHuanbiRate\":0.13,\"outputHuanbiIncrement\":3452},\"products\":[{\"totalCost\":323589,\"outputTongbiRate\":0.28,\"outputHuanbiRate\":0.21,\"costTongbiRate\":0.24,\"costPercent\":0.5,\"id\":1,\"costHuanbiIncrement\":34656,\"outputTongbiIncrement\":5066,\"unitCost\":232,\"costTongbiIncrement\":54123,\"output\":30000,\"costHuanbiRate\":0.13,\"productName\":\"P.O42.5普通硅酸盐水泥\",\"outputHuanbiIncrement\":3452},{\"totalCost\":300000,\"outputTongbiRate\":0.28,\"outputHuanbiRate\":0.21,\"costTongbiRate\":0.24,\"costPercent\":0.5,\"id\":2,\"costHuanbiIncrement\":34656,\"outputTongbiIncrement\":5066,\"unitCost\":232,\"costTongbiIncrement\":54123,\"output\":30000,\"costHuanbiRate\":0.13,\"productName\":\"P.C32.5复合硅酸盐水泥\",\"outputHuanbiIncrement\":3452}],\"costItems\":[{\"costHuanbiIncrement\":24656,\"itemName\":\"原材料\",\"percent\":0.75,\"quantityUnit\":\"T\",\"costTongbiIncrement\":14123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"useQuantity\":\"48267\",\"cost\":\"523589l\"},{\"costHuanbiIncrement\":24656,\"itemName\":\"电耗\",\"percent\":0.15,\"quantityUnit\":\"KWH\",\"costTongbiIncrement\":14123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"useQuantity\":\"38267\",\"cost\":\"523589l\"},{\"costHuanbiIncrement\":4656,\"itemName\":\"固定成本\",\"percent\":0.05,\"costTongbiIncrement\":4123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"cost\":\"23589l\"},{\"costHuanbiIncrement\":4656,\"itemName\":\"管理成本\",\"percent\":0.05,\"costTongbiIncrement\":4123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"cost\":\"43589l\"}]}}
//产品详情
//{\"error\":0,\"message\":null,\"data\":{\"materialUsageHistory\":[{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":1840},{\"time\":1369411200000,\"quantity\":1930},{\"time\":1369584000000,\"quantity\":1898},{\"time\":1369756800000,\"quantity\":1931},{\"time\":1369929600000,\"quantity\":1877},{\"time\":1370102400000,\"quantity\":1926},{\"time\":1370275200000,\"quantity\":1898},{\"time\":1370448000000,\"quantity\":1842},{\"time\":1370620800000,\"quantity\":1846},{\"time\":1370793600000,\"quantity\":1881},{\"time\":1370966400000,\"quantity\":1861},{\"time\":1371139200000,\"quantity\":1846},{\"time\":1371312000000,\"quantity\":1921},{\"time\":1371484800000,\"quantity\":1931},{\"time\":1371657600000,\"quantity\":1890}],\"material\":\"熟料\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":883},{\"time\":1369411200000,\"quantity\":859},{\"time\":1369584000000,\"quantity\":844},{\"time\":1369756800000,\"quantity\":867},{\"time\":1369929600000,\"quantity\":845},{\"time\":1370102400000,\"quantity\":871},{\"time\":1370275200000,\"quantity\":867},{\"time\":1370448000000,\"quantity\":877},{\"time\":1370620800000,\"quantity\":840},{\"time\":1370793600000,\"quantity\":868},{\"time\":1370966400000,\"quantity\":846},{\"time\":1371139200000,\"quantity\":862},{\"time\":1371312000000,\"quantity\":846},{\"time\":1371484800000,\"quantity\":871},{\"time\":1371657600000,\"quantity\":878}],\"material\":\"石膏\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":646},{\"time\":1369411200000,\"quantity\":659},{\"time\":1369584000000,\"quantity\":637},{\"time\":1369756800000,\"quantity\":641},{\"time\":1369929600000,\"quantity\":637},{\"time\":1370102400000,\"quantity\":663},{\"time\":1370275200000,\"quantity\":637},{\"time\":1370448000000,\"quantity\":663},{\"time\":1370620800000,\"quantity\":658},{\"time\":1370793600000,\"quantity\":642},{\"time\":1370966400000,\"quantity\":634},{\"time\":1371139200000,\"quantity\":658},{\"time\":1371312000000,\"quantity\":660},{\"time\":1371484800000,\"quantity\":646},{\"time\":1371657600000,\"quantity\":653}],\"material\":\"矿渣\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":446},{\"time\":1369411200000,\"quantity\":454},{\"time\":1369584000000,\"quantity\":460},{\"time\":1369756800000,\"quantity\":436},{\"time\":1369929600000,\"quantity\":450},{\"time\":1370102400000,\"quantity\":461},{\"time\":1370275200000,\"quantity\":435},{\"time\":1370448000000,\"quantity\":440},{\"time\":1370620800000,\"quantity\":450},{\"time\":1370793600000,\"quantity\":440},{\"time\":1370966400000,\"quantity\":459},{\"time\":1371139200000,\"quantity\":442},{\"time\":1371312000000,\"quantity\":452},{\"time\":1371484800000,\"quantity\":461},{\"time\":1371657600000,\"quantity\":436}],\"material\":\"粉煤灰\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":740},{\"time\":1369411200000,\"quantity\":752},{\"time\":1369584000000,\"quantity\":745},{\"time\":1369756800000,\"quantity\":735},{\"time\":1369929600000,\"quantity\":736},{\"time\":1370102400000,\"quantity\":734},{\"time\":1370275200000,\"quantity\":738},{\"time\":1370448000000,\"quantity\":752},{\"time\":1370620800000,\"quantity\":740},{\"time\":1370793600000,\"quantity\":751},{\"time\":1370966400000,\"quantity\":746},{\"time\":1371139200000,\"quantity\":748},{\"time\":1371312000000,\"quantity\":742},{\"time\":1371484800000,\"quantity\":745},{\"time\":1371657600000,\"quantity\":753}],\"material\":\"炉渣\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":147},{\"time\":1369411200000,\"quantity\":162},{\"time\":1369584000000,\"quantity\":147},{\"time\":1369756800000,\"quantity\":150},{\"time\":1369929600000,\"quantity\":158},{\"time\":1370102400000,\"quantity\":153},{\"time\":1370275200000,\"quantity\":155},{\"time\":1370448000000,\"quantity\":135},{\"time\":1370620800000,\"quantity\":135},{\"time\":1370793600000,\"quantity\":159},{\"time\":1370966400000,\"quantity\":153},{\"time\":1371139200000,\"quantity\":162},{\"time\":1371312000000,\"quantity\":143},{\"time\":1371484800000,\"quantity\":138},{\"time\":1371657600000,\"quantity\":163}],\"material\":\"助磨剂\"}],\"materialUsage\":[{\"usagePercent\":0.67,\"totalCost\":435638,\"unitCost\":185,\"unitQuantity\":0.8,\"quantity\":32267,\"material\":\"熟料\"},{\"usagePercent\":0.08,\"totalCost\":25638,\"unitCost\":85,\"unitQuantity\":0.08,\"quantity\":8688,\"material\":\"石膏\"},{\"usagePercent\":0.06,\"totalCost\":15638,\"unitCost\":65,\"unitQuantity\":0.04,\"quantity\":2896,\"material\":\"矿渣\"},{\"usagePercent\":0.1,\"totalCost\":18638,\"unitCost\":45,\"unitQuantity\":0.08,\"quantity\":4827,\"material\":\"粉煤灰\"},{\"usagePercent\":0.05,\"totalCost\":15638,\"unitCost\":66,\"unitQuantity\":0.04,\"quantity\":2413,\"material\":\"炉渣\"},{\"usagePercent\":0.05,\"totalCost\":15638,\"unitCost\":66,\"unitQuantity\":0.04,\"quantity\":2413,\"material\":\"炉渣\"},{\"usagePercent\":0.04,\"totalCost\":35638,\"unitCost\":123,\"unitQuantity\":0.04,\"quantity\":1931,\"material\":\"助磨剂\"}],\"energeUsage\":[{\"usagePercent\":1,\"totalCost\":234232,\"unitQuantity\":2344,\"item\":\"电耗\",\"quantity\":3453434}]}}
@interface ProductOverviewViewController2 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) NSMutableArray *products;
@property (nonatomic,retain) NSDictionary *overview;
@property (nonatomic,retain) NSMutableArray *costItems;
@property (nonatomic,retain) ASIFormDataRequest *request;
@property (nonatomic,retain) UIView *frontView;//用于指示当前哪个view在前端显示
@property (nonatomic,retain) UILabel *lblTitle;//navigationBar标题
@property (nonatomic,retain) UIImageView *imgViewTitleArrow;//navigationBar箭头
@property (nonatomic,retain) UIImageView *leftArrowView;
@property (nonatomic,retain) ChoiceDateView *dateView;
@property (nonatomic,retain) QueryDate *querydate;

@property BOOL isOverviewViewExpand;
@property BOOL isOverviewDetailViewExpand;
@end

@implementation ProductOverviewViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) sendRequest{
    [SVProgressHUD showWithStatus:@"正在加载..."];
    self.request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:kProductOverview]];
    [self.request setPostValue:kSharedApp.accessToken forKey:@"accessToken"];
    [self.request setPostValue:kSharedApp.factoryId forKey:@"factoryId"];
    int periodUnit = 3;
    if (self.querydate.quarterly==0&&self.querydate.month==0) {
        periodUnit = 3;
    }else if (self.querydate.quarterly!=0&&self.querydate.month==0){
        periodUnit = 2;
    }else if (self.querydate.quarterly==0&&self.querydate.month!=0){
        periodUnit = 1;
    }
    [self.request setPostValue:[NSNumber numberWithInt:periodUnit] forKey:@"periodUnit"];//(0：天  1:月  2:季度  3:年)
    [self.request setPostValue:[NSNumber numberWithInt:self.querydate.year] forKey:@"year"];
    [self.request setPostValue:[NSNumber numberWithInt:self.querydate.quarterly] forKey:@"quarter"];
    [self.request setPostValue:[NSNumber numberWithInt:self.querydate.month] forKey:@"month"];
    [self.request setPostValue:[NSNumber numberWithInt:0] forKey:@"day"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //set titleView
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(115, 10, 90, 24)];
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, titleView.frame.size.height)];
    self.lblTitle.backgroundColor = [UIColor clearColor];
    self.lblTitle.textAlignment = UITextAlignmentCenter;
    self.lblTitle.textColor = [UIColor whiteColor];
    self.lblTitle.adjustsFontSizeToFitWidth=YES;
    self.lblTitle.font = [UIFont boldSystemFontOfSize:19.f];
    self.lblTitle.text = @"产品列表";
    self.imgViewTitleArrow = [[UIImageView alloc] initWithFrame:CGRectMake(85, 10, 5, 4)];
    self.imgViewTitleArrow.image = [UIImage imageNamed:@"arr2.png"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = titleView.bounds;
    [titleView addSubview:self.lblTitle];
    [titleView addSubview:self.imgViewTitleArrow];
    [titleView addSubview:btn];
    self.navigationItem.titleView = titleView;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    //set container background
    self.viewBgContainer.layer.cornerRadius = 15;
    self.viewBgContainer.layer.masksToBounds = YES;
    //set right box view
    self.viewRightBox.layer.shadowOffset = CGSizeMake(1, 1);
    self.viewRightBox.layer.shadowOpacity = 1;
    self.viewRightBox.layer.shadowColor = [UIColor colorWithRed:166.0/255 green:187.0/255 blue:200.0/255 alpha:1.0].CGColor;
    self.viewRightBox.layer.borderWidth = 1;
    self.viewRightBox.layer.borderColor = [UIColor colorWithRed:75.0/255 green:102.0/255 blue:121.0/255 alpha:1.0].CGColor;
    //init local var
    self.products = [[NSMutableArray alloc] init];
    self.costItems = [[NSMutableArray alloc] init];
    self.productsTableView.delegate = self;
    self.productsTableView.dataSource = self;
    self.productsTableView.tag = 1101;
    self.frontView = self.productsTableView;
    [self.viewContainer bringSubviewToFront:self.productsTableView];//默认tableview显示在最上面
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    bgView.frame = self.view.bounds;
    [self.view insertSubview:bgView atIndex:0];
    
    self.productsTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_bg.png"]];
    //日期选择视图
    self.dateView = [[ChoiceDateView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 255)];
    [self.dateView addObserver:self forKeyPath:@"querydate" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //send request(默认查询当前月份)
    //获取当前时间
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit ;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    int year = [dateComponent year];
    int month = [dateComponent month];
    self.lblDate.text = [NSString stringWithFormat:@"%d年%d月",year,month];
    self.querydate = [[QueryDate alloc] initWithYear:year quarterly:0 month:month];
    [self sendRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImgViewLeftArrow:nil];
    [self setViewBgContainer:nil];
    [self setLblDate:nil];
    [self setImgViewRightArrow:nil];
    [self setProductsTableView:nil];
    [self setViewContainer:nil];
    [self setViewRightBox:nil];
    [self setExpandHiddenView:nil];
    
    [self setExpandHiddenView:nil];
    [self setTotalCost:nil];
    [self setTotalOutput:nil];
    [self setImgViewRightArrow:nil];
    
    self.lblCostHuanbi=nil;
    self.lblCostHuanbiRate=nil;
    self.lblCostTongbi=nil;
    self.lblCostTongbiRate=nil;
    self.lblOutputHuanbi=nil;
    self.lblOutputHuanbiRate=nil;
    self.lblOutputTongbi=nil;
    self.lblOutputTongbiRate=nil;
    self.lblTagCostHuanbi=nil;
    self.lblTagCostTongbi=nil;
    self.lblTagOutputHuanbi=nil;
    self.lblTagOutputTongbi=nil;
    
    self.dateView = nil;
    [self removeObserver:self.dateView forKeyPath:@"querydate"];
    [super viewDidUnload];
}

-(void)setHiddenViewValue{
    self.totalCost.text = [NSString stringWithFormat:@"%.2f",[[self.overview objectForKey:@"totalCost"] doubleValue]];
    self.totalOutput.text = [NSString stringWithFormat:@"%.2f",[[self.overview objectForKey:@"totalOutput"] doubleValue]];
    double costHuanbiIncrement = [[self.overview objectForKey:@"costHuanbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagCostHuanbi.text = @"成本环比减少：";
        self.lblCostHuanbi.text = [NSString stringWithFormat:@"%.2f",fabs(costHuanbiIncrement)];
    }else{
        self.lblCostHuanbi.text = [NSString stringWithFormat:@"%.2f",costHuanbiIncrement];
    }
    double costTongbiIncrement = [[self.overview objectForKey:@"costTongbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagCostTongbi.text = @"成本同比减少：";
        self.lblCostTongbi.text = [NSString stringWithFormat:@"%.2f",fabs(costTongbiIncrement)];
    }else{
        self.lblCostTongbi.text = [NSString stringWithFormat:@"%.2f",costTongbiIncrement];
    }
    double outputHuanbiIncrement = [[self.overview objectForKey:@"outputHuanbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagOutputHuanbi.text = @"产量环比减少：";
        self.lblOutputHuanbi.text = [NSString stringWithFormat:@"%.2f",fabs(outputHuanbiIncrement)];
    }else{
        self.lblOutputHuanbi.text = [NSString stringWithFormat:@"%.2f",outputHuanbiIncrement];
    }
    double outputTongbiIncrement = [[self.overview objectForKey:@"outputTongbiIncrement"] doubleValue];
    if (costHuanbiIncrement<0) {
        self.lblTagOutputTongbi.text = @"产量同比减少：";
        self.lblOutputTongbi.text = [NSString stringWithFormat:@"%.2f",fabs(outputTongbiIncrement)];
    }else{
        self.lblOutputTongbi.text = [NSString stringWithFormat:@"%.2f",outputTongbiIncrement];
    }
    self.lblCostHuanbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"costHuanbiRate"] doubleValue],@"%"];
    self.lblCostTongbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"costTongbiRate"] doubleValue],@"%"];
    self.lblOutputHuanbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"outputHuanbiRate"] doubleValue],@"%"];
    self.lblOutputTongbiRate.text = [NSString stringWithFormat:@"%.2f%@",100*[[self.overview objectForKey:@"outputTongbiRate"] doubleValue],@"%"];
}

#pragma mark -------------ASIHTTPRequestDelegate-------------

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        [SVProgressHUD showSuccessWithStatus: @"解析成功"];
        NSDictionary *data = [dict objectForKey:@"data"];
        //先清空
        [self.costItems removeAllObjects];
        [self.products removeAllObjects];
        //在加载新数据
        self.overview = [data objectForKey:@"overview"];
        [self.costItems addObjectsFromArray:[data objectForKey:@"costItems"]];
        [self.products addObjectsFromArray:[data objectForKey:@"products"]];
        [self setHiddenViewValue];
        [self.productsTableView reloadData];
        if (self.costItemView) {
            [self.costItemView reload];
        }
    }else{
        [SVProgressHUD showErrorWithStatus:@"解析失败"];
        debugLog(@"");
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    //    NSError *error = [request error];
    [SVProgressHUD showErrorWithStatus:@"网络错误"];
}


//#pragma mark -------------UITableViewDatasource-------------
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"overview"];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top.png"]];
//        self.leftArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arr3.png"]];
//        self.leftArrowView.frame = CGRectMake(15, 8, 14, 14);
//        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(230, 5, 73, 20)];
//        rightView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"box.png"]];
//        UILabel *lblDate = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 60, 20)];
//        lblDate.font = [UIFont systemFontOfSize:11.f];
//        lblDate.backgroundColor = [UIColor clearColor];
//        lblDate.textColor = [UIColor whiteColor];
//        lblDate.text = @"2013年5月";
//        UIImageView *rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arr2.png"]];
//        rightArrowView.frame = CGRectMake(63, 8, 5, 4);
//        [rightView addSubview:lblDate];
//        [rightView addSubview:rightArrowView];
//        
//        [cell addSubview:self.leftArrowView];
//        [cell addSubview:rightView];
//        return cell;
//    }else{
//        ProductCell *productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil] objectAtIndex:0];
//        productCell.backgroundColor = [UIColor clearColor];
//        productCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        NSDictionary *product = [self.products objectAtIndex:indexPath.row];
//        productCell.imgView.image = [UIImage imageNamed:@"shuini.png"];
//        productCell.lblName.text = [product objectForKey:@"productName"];
//        productCell.lblCost.text = [NSString stringWithFormat:@"%.2f",[[product objectForKey:@"totalCost"] doubleValue]];
//        productCell.lblOutput.text = [NSString stringWithFormat:@"%.2f",[[product objectForKey:@"output"]doubleValue]];
//        return productCell;
//    }
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section==0) {
//        return 1;
//    }else{
//        return self.products.count;
//    }
//}
//
//- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
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
//            ProductCell *productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil] objectAtIndex:0];
//            return productCell.frame.size.height;
//        }
//    }
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        //旋转代码
//        CGAffineTransform transform = self.leftArrowView.transform;
//        transform = CGAffineTransformRotate(transform, (M_PI / 2.0)); 
//        self.leftArrowView.transform = transform;
////    EquipmentDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"equipmentDetailViewController"];
////    detailViewController.equipment = [self.equipments objectAtIndex:indexPath.row];
////    self.tableView.scrollEnabled = NO;
////    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
////    [folderTableView openFolderAtIndexPath:indexPath WithContentView:detailViewController.view
////                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
////                                     // opening actions
////                                 }
////                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
////                                    // closing actions
////                                }
////                           completionBlock:^{
////                               // completed actions
////                               self.tableView.scrollEnabled = YES;
////                           }];
//    }else{
////    EquipmentDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"equipmentDetailViewController"];
////    detailViewController.hidesBottomBarWhenPushed = YES;
////    detailViewController.equipment = [self.equipments objectAtIndex:indexPath.row];
////    [self.navigationController pushViewController:detailViewController animated:YES];
//        ProductViewController *productViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"productViewController"];
//        productViewController.productBasicInfo = [self.products objectAtIndex:indexPath.row];
//        [self.navigationController pushViewController:productViewController animated:YES];
//    }
//}

#pragma mark -------------UITableViewDatasource-------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *productCell = nil;
    if (IS_Pad) {
        productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell_iPad" owner:self options:nil] objectAtIndex:0];
    }else{
        productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil] objectAtIndex:0];
    }
    productCell.backgroundColor = [UIColor clearColor];
    productCell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *product = [self.products objectAtIndex:indexPath.row];
    productCell.imgView.image = [UIImage imageNamed:@"shuini.png"];
    productCell.lblName.text = [product objectForKey:@"productName"];
    productCell.lblCost.text = [NSString stringWithFormat:@"%.2f",[[product objectForKey:@"totalCost"] doubleValue]];
    productCell.lblOutput.text = [NSString stringWithFormat:@"%.2f",[[product objectForKey:@"output"]doubleValue]];
    return productCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}

#pragma mark -------------UITableViewDelegate-------------
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *productCell = nil;
    if (IS_Pad) {
        productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell_iPad" owner:self options:nil] objectAtIndex:0];
    }else{
        productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil] objectAtIndex:0];
    }
    return productCell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductViewController *productViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"productViewController"];
    productViewController.hidesBottomBarWhenPushed = YES;
    productViewController.date = self.lblDate.text;
    productViewController.querydate = self.querydate;
    productViewController.productBasicInfo = [self.products objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:productViewController animated:YES];
}

- (IBAction)changeDate:(id)sender {
    [self.dateView show];
}

- (IBAction)expandOverview:(id)sender {
//    self.childViewController = [[OverviewChild1ViewController alloc] initWithNibName:NSStringFromClass([OverviewChild1ViewController class]) bundle:nil];
//    self.childViewController.containerViewController = self;
//    CGPoint openPoint = CGPointMake(0,29); //arbitrary point,x不起作用，y是展开的起始点
//    //展开
//    [JWFolders openFolderWithContentView:self.childViewController.view position:openPoint containerView:self.viewBgContainer sender:self direction:1];
    CGRect rect;
    //旋转箭头指向
    CGAffineTransform transform = self.imgViewLeftArrow.transform;
    if (self.isOverviewViewExpand&&self.frontView.frame.origin.y>0) {
        transform = CGAffineTransformRotate(transform, (-M_PI/2));
        self.isOverviewViewExpand = NO;
        rect = CGRectMake(self.frontView.frame.origin.x, 0, self.frontView.frame.size.width, self.frontView.frame.size.height);
        if (self.isOverviewDetailViewExpand) {
            self.isOverviewDetailViewExpand = NO;
            CGAffineTransform transform = self.imgViewChildRightArrow.transform;
            transform = CGAffineTransformRotate(transform, (-M_PI/2));
            self.imgViewChildRightArrow.transform = transform;
        }
    }else{
        transform = CGAffineTransformRotate(transform, (M_PI/2));
        self.isOverviewViewExpand = YES;
        rect = CGRectMake(self.frontView.frame.origin.x, self.frontView.frame.origin.y+49, self.frontView.frame.size.width, self.productsTableView.frame.size.height);
    }
    [UIView beginAnimations:@"UpDown" context:nil];
    [UIView setAnimationDuration:kDuration];
    self.imgViewLeftArrow.transform = transform;
    self.frontView.frame = rect;
    [UIView commitAnimations];
}

- (IBAction)expandChildOverview:(id)sender{
    CGRect rect;
    CGAffineTransform transform = self.imgViewChildRightArrow.transform;
    if (self.isOverviewDetailViewExpand&&self.frontView.frame.origin.y>49) {
        self.isOverviewDetailViewExpand = NO;
        transform = CGAffineTransformRotate(transform, (-M_PI/2));
        rect = CGRectMake(self.frontView.frame.origin.x, 49, self.frontView.frame.size.width, self.frontView.frame.size.height);
    }else{
        transform = CGAffineTransformRotate(transform, (M_PI/2));
        self.isOverviewDetailViewExpand = YES;
        rect =CGRectMake(self.frontView.frame.origin.x, self.frontView.frame.origin.y+122, self.productsTableView.frame.size.width, self.productsTableView.frame.size.height);
    }
    [UIView beginAnimations:@"UpDown" context:nil];
    [UIView setAnimationDuration:kDuration];
    self.imgViewChildRightArrow.transform = transform;
    self.frontView.frame = rect;
    [UIView commitAnimations];
}

//隐藏的view缩回
-(void)hiddenExpandView{
    if (self.isOverviewViewExpand) {
        self.isOverviewViewExpand = NO;
        CGAffineTransform transform = self.imgViewLeftArrow.transform;
        transform = CGAffineTransformRotate(transform, (-M_PI/2));
        self.imgViewLeftArrow.transform = transform;
    }
    if (self.isOverviewDetailViewExpand) {
        self.isOverviewDetailViewExpand = NO;
        CGAffineTransform transform = self.imgViewChildRightArrow.transform;
        transform = CGAffineTransformRotate(transform, (-M_PI/2));
        self.imgViewChildRightArrow.transform = transform;
    }
    [UIView beginAnimations:@"UpDown" context:nil];
    [UIView setAnimationDuration:kDuration];
    self.frontView.frame = CGRectMake(self.productsTableView.frame.origin.x, 0, self.productsTableView.frame.size.width, self.productsTableView.frame.size.height);
    [UIView commitAnimations];
}

- (void)changeView:(id)sender{
    [self hiddenExpandView];
    //旋转箭头指向
    CGAffineTransform transform = self.imgViewTitleArrow.transform;
    transform = CGAffineTransformRotate(transform, (M_PI));
    self.imgViewTitleArrow.transform = transform;
    if (_menu.isOpen)
        return [_menu close];
    REMenuItem *productList = [[REMenuItem alloc] initWithTitle:@"产品列表"
                                                    subtitle:nil
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          //旋转箭头指向
                                                          CGAffineTransform transform = self.imgViewTitleArrow.transform;
                                                          transform = CGAffineTransformRotate(transform, M_PI);
                                                          self.imgViewTitleArrow.transform = transform;
                                                          self.lblTitle.text = @"产品列表";
                                                          if (self.frontView!=self.productsTableView) {
                                                              [self showView:self.productsTableView];
                                                          }
                                                      }];
    REMenuItem *costItem = [[REMenuItem alloc] initWithTitle:@"成本构成"
                                                       subtitle:nil
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             //旋转箭头指向
                                                             CGAffineTransform transform = self.imgViewTitleArrow.transform;
                                                             transform = CGAffineTransformRotate(transform, M_PI);
                                                             self.imgViewTitleArrow.transform = transform;
                                                             self.lblTitle.text = @"成本构成";
                                                             if (self.frontView!=self.costItemView) {
                                                                 if (self.costItemView==nil) {
                                                                     self.costItemView = [[FactoryCostItemView alloc] initWithFrame:self.productsTableView.bounds];
                                                                     self.costItemView.costItems = self.costItems;
                                                                     self.costItemView.tag = 1102;
                                                                     [(UIScrollView *)[[self.costItemView subviews] objectAtIndex:0] setBounces:NO];
                                                                     NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ProductCostItem" ofType:@"html"];
                                                                     [self.costItemView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
                                                                     [self.viewContainer addSubview:self.costItemView];
                                                                 }
                                                                 [self showView:self.costItemView];
                                                             }
                                                        }];
    _menu = [[REMenu alloc] initWithItems:@[productList, costItem]];
    _menu.cornerRadius = 4;
    _menu.shadowColor = [UIColor blackColor];
    _menu.shadowOffset = CGSizeMake(0, 1);
    _menu.shadowOpacity = 1;
    _menu.imageOffset = CGSizeMake(5, -1);
    [_menu showFromNavigationController:self.navigationController];
}

-(void)showView:(UIView *)view{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"oglFlip";
    if (self.frontView.tag>view.tag) {
        animation.subtype = kCATransitionFromLeft;
    }else{
        animation.subtype = kCATransitionFromRight;
    }
    [self.viewContainer bringSubviewToFront:view];
    [self.viewContainer sendSubviewToBack:self.frontView];//将最前端的view显示到最后端，中间的隐藏层不被遮住
    [[self.viewContainer layer] addAnimation:animation forKey:@"animation"];
    self.frontView=view;
}

#pragma mark observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"querydate"]) {
        QueryDate *oldQ = [change objectForKey:@"old"];
        QueryDate *newQ = [change objectForKey:@"new"];
        //改变了查看时间才发请求
        if (oldQ.year!=newQ.year||oldQ.quarterly!=newQ.quarterly||oldQ.month!=newQ.month) {
            QueryDate *querydate = (QueryDate *)[self.dateView valueForKey:@"querydate"];
            NSString *lblDateStr = nil;
            if (querydate.quarterly==0&&querydate.month==0) {
                lblDateStr = [NSString stringWithFormat:@"%d年",querydate.year];
            }else if (querydate.quarterly!=0&&querydate.month==0){
                lblDateStr = [NSString stringWithFormat:@"%d年%d季度",querydate.year,querydate.quarterly];
            }else if (querydate.quarterly==0&&querydate.month!=0){
                lblDateStr = [NSString stringWithFormat:@"%d年%d月",querydate.year,querydate.month];
            }
            self.lblDate.text = lblDateStr;
            [self hiddenExpandView];
            self.querydate = querydate;
            [self performSelector:@selector(sendRequest) withObject:nil afterDelay:1];
        }
    }
}
@end
