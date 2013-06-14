//
//  ProductOverviewViewController2.m
//  CustomerSystem
//
//  Created by wzg on 13-6-13.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductOverviewViewController2.h"
#import "ProductCell.h"
//生产总览
//{\"error\":0,\"message\":null,\"data\":{\"overview\":{\"costHuanbiIncrement\":34656,\"outputTongbiIncrement\":5066,\"totalCost\":623589,\"totalOutput\":60000,\"outputTongbiRate\":0.28,\"outputHuanbiRate\":0.21,\"costTongbiIncrement\":54123,\"costTongbiRate\":0.24,\"costHuanbiRate\":0.13,\"outputHuanbiIncrement\":3452},\"products\":[{\"totalCost\":323589,\"outputTongbiRate\":0.28,\"outputHuanbiRate\":0.21,\"costTongbiRate\":0.24,\"costPercent\":0.5,\"id\":1,\"costHuanbiIncrement\":34656,\"outputTongbiIncrement\":5066,\"unitCost\":232,\"costTongbiIncrement\":54123,\"output\":30000,\"costHuanbiRate\":0.13,\"productName\":\"P.O42.5普通硅酸盐水泥\",\"outputHuanbiIncrement\":3452},{\"totalCost\":300000,\"outputTongbiRate\":0.28,\"outputHuanbiRate\":0.21,\"costTongbiRate\":0.24,\"costPercent\":0.5,\"id\":2,\"costHuanbiIncrement\":34656,\"outputTongbiIncrement\":5066,\"unitCost\":232,\"costTongbiIncrement\":54123,\"output\":30000,\"costHuanbiRate\":0.13,\"productName\":\"P.C32.5复合硅酸盐水泥\",\"outputHuanbiIncrement\":3452}],\"costItems\":[{\"costHuanbiIncrement\":24656,\"itemName\":\"原材料\",\"percent\":0.75,\"quantityUnit\":\"T\",\"costTongbiIncrement\":14123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"useQuantity\":\"48267\",\"cost\":\"523589l\"},{\"costHuanbiIncrement\":24656,\"itemName\":\"电耗\",\"percent\":0.15,\"quantityUnit\":\"KWH\",\"costTongbiIncrement\":14123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"useQuantity\":\"38267\",\"cost\":\"523589l\"},{\"costHuanbiIncrement\":4656,\"itemName\":\"固定成本\",\"percent\":0.05,\"costTongbiIncrement\":4123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"cost\":\"23589l\"},{\"costHuanbiIncrement\":4656,\"itemName\":\"管理成本\",\"percent\":0.05,\"costTongbiIncrement\":4123,\"costTongbiRate\":-2.4,\"costHuanbiRate\":-0.18,\"cost\":\"43589l\"}]}}
//产品详情
//{\"error\":0,\"message\":null,\"data\":{\"materialUsageHistory\":[{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":1840},{\"time\":1369411200000,\"quantity\":1930},{\"time\":1369584000000,\"quantity\":1898},{\"time\":1369756800000,\"quantity\":1931},{\"time\":1369929600000,\"quantity\":1877},{\"time\":1370102400000,\"quantity\":1926},{\"time\":1370275200000,\"quantity\":1898},{\"time\":1370448000000,\"quantity\":1842},{\"time\":1370620800000,\"quantity\":1846},{\"time\":1370793600000,\"quantity\":1881},{\"time\":1370966400000,\"quantity\":1861},{\"time\":1371139200000,\"quantity\":1846},{\"time\":1371312000000,\"quantity\":1921},{\"time\":1371484800000,\"quantity\":1931},{\"time\":1371657600000,\"quantity\":1890}],\"material\":\"熟料\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":883},{\"time\":1369411200000,\"quantity\":859},{\"time\":1369584000000,\"quantity\":844},{\"time\":1369756800000,\"quantity\":867},{\"time\":1369929600000,\"quantity\":845},{\"time\":1370102400000,\"quantity\":871},{\"time\":1370275200000,\"quantity\":867},{\"time\":1370448000000,\"quantity\":877},{\"time\":1370620800000,\"quantity\":840},{\"time\":1370793600000,\"quantity\":868},{\"time\":1370966400000,\"quantity\":846},{\"time\":1371139200000,\"quantity\":862},{\"time\":1371312000000,\"quantity\":846},{\"time\":1371484800000,\"quantity\":871},{\"time\":1371657600000,\"quantity\":878}],\"material\":\"石膏\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":646},{\"time\":1369411200000,\"quantity\":659},{\"time\":1369584000000,\"quantity\":637},{\"time\":1369756800000,\"quantity\":641},{\"time\":1369929600000,\"quantity\":637},{\"time\":1370102400000,\"quantity\":663},{\"time\":1370275200000,\"quantity\":637},{\"time\":1370448000000,\"quantity\":663},{\"time\":1370620800000,\"quantity\":658},{\"time\":1370793600000,\"quantity\":642},{\"time\":1370966400000,\"quantity\":634},{\"time\":1371139200000,\"quantity\":658},{\"time\":1371312000000,\"quantity\":660},{\"time\":1371484800000,\"quantity\":646},{\"time\":1371657600000,\"quantity\":653}],\"material\":\"矿渣\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":446},{\"time\":1369411200000,\"quantity\":454},{\"time\":1369584000000,\"quantity\":460},{\"time\":1369756800000,\"quantity\":436},{\"time\":1369929600000,\"quantity\":450},{\"time\":1370102400000,\"quantity\":461},{\"time\":1370275200000,\"quantity\":435},{\"time\":1370448000000,\"quantity\":440},{\"time\":1370620800000,\"quantity\":450},{\"time\":1370793600000,\"quantity\":440},{\"time\":1370966400000,\"quantity\":459},{\"time\":1371139200000,\"quantity\":442},{\"time\":1371312000000,\"quantity\":452},{\"time\":1371484800000,\"quantity\":461},{\"time\":1371657600000,\"quantity\":436}],\"material\":\"粉煤灰\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":740},{\"time\":1369411200000,\"quantity\":752},{\"time\":1369584000000,\"quantity\":745},{\"time\":1369756800000,\"quantity\":735},{\"time\":1369929600000,\"quantity\":736},{\"time\":1370102400000,\"quantity\":734},{\"time\":1370275200000,\"quantity\":738},{\"time\":1370448000000,\"quantity\":752},{\"time\":1370620800000,\"quantity\":740},{\"time\":1370793600000,\"quantity\":751},{\"time\":1370966400000,\"quantity\":746},{\"time\":1371139200000,\"quantity\":748},{\"time\":1371312000000,\"quantity\":742},{\"time\":1371484800000,\"quantity\":745},{\"time\":1371657600000,\"quantity\":753}],\"material\":\"炉渣\"},{\"historyUsage\":[{\"time\":1369238400000,\"quantity\":147},{\"time\":1369411200000,\"quantity\":162},{\"time\":1369584000000,\"quantity\":147},{\"time\":1369756800000,\"quantity\":150},{\"time\":1369929600000,\"quantity\":158},{\"time\":1370102400000,\"quantity\":153},{\"time\":1370275200000,\"quantity\":155},{\"time\":1370448000000,\"quantity\":135},{\"time\":1370620800000,\"quantity\":135},{\"time\":1370793600000,\"quantity\":159},{\"time\":1370966400000,\"quantity\":153},{\"time\":1371139200000,\"quantity\":162},{\"time\":1371312000000,\"quantity\":143},{\"time\":1371484800000,\"quantity\":138},{\"time\":1371657600000,\"quantity\":163}],\"material\":\"助磨剂\"}],\"materialUsage\":[{\"usagePercent\":0.67,\"totalCost\":435638,\"unitCost\":185,\"unitQuantity\":0.8,\"quantity\":32267,\"material\":\"熟料\"},{\"usagePercent\":0.08,\"totalCost\":25638,\"unitCost\":85,\"unitQuantity\":0.08,\"quantity\":8688,\"material\":\"石膏\"},{\"usagePercent\":0.06,\"totalCost\":15638,\"unitCost\":65,\"unitQuantity\":0.04,\"quantity\":2896,\"material\":\"矿渣\"},{\"usagePercent\":0.1,\"totalCost\":18638,\"unitCost\":45,\"unitQuantity\":0.08,\"quantity\":4827,\"material\":\"粉煤灰\"},{\"usagePercent\":0.05,\"totalCost\":15638,\"unitCost\":66,\"unitQuantity\":0.04,\"quantity\":2413,\"material\":\"炉渣\"},{\"usagePercent\":0.05,\"totalCost\":15638,\"unitCost\":66,\"unitQuantity\":0.04,\"quantity\":2413,\"material\":\"炉渣\"},{\"usagePercent\":0.04,\"totalCost\":35638,\"unitCost\":123,\"unitQuantity\":0.04,\"quantity\":1931,\"material\":\"助磨剂\"}],\"energeUsage\":[{\"usagePercent\":1,\"totalCost\":234232,\"unitQuantity\":2344,\"item\":\"电耗\",\"quantity\":3453434}]}}
@interface ProductOverviewViewController2 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) NSMutableArray *products;
@property (nonatomic,retain) NSDictionary *overview;
@property (nonatomic,retain) NSMutableArray *costItems;
@property (nonatomic,retain) ASIFormDataRequest *request;
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
    [self.request setPostValue:@"2013" forKey:@"periodUnit"];//(0：天  1:月  2:季度  3:年)
    [self.request setPostValue:@"1" forKey:@"year"];
    [self.request setPostValue:@"1" forKey:@"quarter"];
    [self.request setPostValue:@"1" forKey:@"month"];
    [self.request setPostValue:@"1" forKey:@"day"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    //init local var
    self.products = [[NSMutableArray alloc] init];
    self.costItems = [[NSMutableArray alloc] init];
    self.overviewTableView.delegate = self;
    self.overviewTableView.dataSource = self;
    //send request
    [self sendRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setOverviewTableView:nil];
    [super viewDidUnload];
}

#pragma mark -------------ASIHTTPRequestDelegate-------------

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        [SVProgressHUD showSuccessWithStatus: @"解析成功"];
        NSDictionary *data = [dict objectForKey:@"data"];
        self.overview = [data objectForKey:@"overview"];
        [self.costItems addObjectsFromArray:[data objectForKey:@"costItems"]];
        [self.products addObjectsFromArray:[data objectForKey:@"products"]];
        [self.overviewTableView reloadData];
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


#pragma mark -------------UITableViewDatasource-------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"overview"];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        UIImageView *leftArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        leftArrowView.frame = CGRectMake(10, 10, 20, 20);
        
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(180, 5, 100, 30)];
        rightView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
        UILabel *lblDate = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 80, 30)];
        lblDate.text = @"2013年5月";
        UIImageView *rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        rightArrowView.frame = CGRectMake(85, 5, 10, 30);
        [rightView addSubview:lblDate];
        [rightView addSubview:rightArrowView];
        
        [cell addSubview:leftArrowView];
        [cell addSubview:rightView];
        return cell;
    }else{
        ProductCell *productCell = (ProductCell *)[[[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil] objectAtIndex:0];
        NSDictionary *product = [self.products objectAtIndex:indexPath.row];
        productCell.lblName.text = [product objectForKey:@"productName"];
        productCell.lblCost.text = [NSString stringWithFormat:@"%.2f",[[product objectForKey:@"totalCost"] doubleValue]];
        productCell.lblOutput.text = [NSString stringWithFormat:@"%.2f",[[product objectForKey:@"output"]doubleValue]];
        return productCell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return self.products.count;
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

#pragma mark -------------UITableViewDelegate-------------
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (IS_Pad) {
            return 120.f;
        }else{
            return 40.f;
        }
    }else{
        if (IS_Pad) {
            return 120.f;
        }else{
            return 92.f;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
//    EquipmentDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"equipmentDetailViewController"];
//    detailViewController.equipment = [self.equipments objectAtIndex:indexPath.row];
//    self.tableView.scrollEnabled = NO;
//    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
//    [folderTableView openFolderAtIndexPath:indexPath WithContentView:detailViewController.view
//                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
//                                     // opening actions
//                                 }
//                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
//                                    // closing actions
//                                }
//                           completionBlock:^{
//                               // completed actions
//                               self.tableView.scrollEnabled = YES;
//                           }];
    }else{
//    EquipmentDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"equipmentDetailViewController"];
//    detailViewController.hidesBottomBarWhenPushed = YES;
//    detailViewController.equipment = [self.equipments objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

@end
