//
//  EquipmentListViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-4-25.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentListViewController.h"
#import "EquipmentCell.h"
#import "EquipmentDetailViewController.h"
#import "TSActionSheet.h"

#define kHeaderViewBackgroundColor [UIColor redColor]
#define kFooterViewBackgroundColr [UIColor whiteColor]

@interface EquipmentListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) ASIFormDataRequest *request;
@property (nonatomic,retain) NSMutableArray *equipments;
@property NSUInteger currentPage;//当前显示页数
@property BOOL isLoadingmore;//是否有更多页
@property BOOL isRefreshing;//是否正在刷新
@property BOOL isLoding;//是否正在加载更多

@property BOOL isFirstLoad;//是否是第一次加载页面
@end

//{\"error\":0,\"message\":null,\"data\":{\"equipments\":[{\"id\":1,\"sn\":\"fb20130523\",\"name\":\"连续式失重秤\",\"status\":\"正常\",\"type\":\"连续式失重秤\",\"settingFlowRate\":83.0,\"instantFlowRate\":83.0,\"totalOutput\":2000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":2,\"stopDurationMonthly\":23433435,\"runDuration\":23242342,\"operationRate\":0.0},{\"id\":2,\"sn\":\"fb20130524\",\"name\":\"螺旋计量秤\",\"status\":\"正常\",\"type\":\"螺旋计量秤\",\"settingFlowRate\":83.0,\"instantFlowRate\":83.0,\"totalOutput\":2000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":0,\"stopDurationMonthly\":0,\"runDuration\":83242342,\"operationRate\":0.0},{\"id\":3,\"sn\":\"fb20130525\",\"name\":\"信息化转子秤\",\"status\":\"故障\",\"type\":\"信息化转子秤\",\"settingFlowRate\":80.0,\"instantFlowRate\":80.0,\"totalOutput\":3000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":0,\"stopDurationMonthly\":0,\"runDuration\":83242342,\"operationRate\":0.0},{\"id\":4,\"sn\":\"fb20130526\",\"name\":\"双托辊电子皮带秤\",\"status\":\"断开\",\"type\":\"双托辊电子皮带秤\",\"settingFlowRate\":80.0,\"instantFlowRate\":80.0,\"totalOutput\":3000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":0,\"stopDurationMonthly\":0,\"runDuration\":83242342,\"operationRate\":0.0},{\"id\":5,\"sn\":\"fb20130527\",\"name\":\"定量给料机\",\"status\":\"停机\",\"type\":\"定量给料机\",\"settingFlowRate\":80.0,\"instantFlowRate\":80.0,\"totalOutput\":3000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":0,\"stopDurationMonthly\":0,\"runDuration\":83242342,\"operationRate\":0.0},{\"id\":6,\"sn\":\"fb20130528\",\"name\":\"科里奥利秤粉体定量给料秤\",\"status\":\"正常\",\"type\":\"科里奥利秤粉体定量给料秤\",\"settingFlowRate\":80.0,\"instantFlowRate\":80.0,\"totalOutput\":3000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":0,\"stopDurationMonthly\":0,\"runDuration\":83242342,\"operationRate\":0.0},{\"id\":7,\"sn\":\"fb20130529\",\"name\":\"信息化定量给料机\",\"status\":\"正常\",\"type\":\"信息化定量给料机\",\"settingFlowRate\":80.0,\"instantFlowRate\":80.0,\"totalOutput\":3000.0,\"partialOutput\":1430.0,\"stopCountMonthly\":0,\"stopDurationMonthly\":0,\"runDuration\":83242342,\"operationRate\":0.0}],\"totalCount\":7}}

@implementation EquipmentListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)sendRequest
{
    self.request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:kEquipmentList]];
    [self.request setPostValue:kSharedApp.accessToken forKey:@"accessToken"];
    [self.request setPostValue:kSharedApp.factoryId forKey:@"factoryId"];
    [self.request setPostValue:[NSNumber numberWithInt:((self.currentPage-1)*kPageSize)] forKey:@"offset"];
    [self.request setPostValue:[NSNumber numberWithInt:kPageSize] forKey:@"count"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"设备列表";
    //headerView&bottomView
    __weak EquipmentListViewController *weakSelf = self;
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf insertRowAtTop];
    }];
    // setup infinite scrolling
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];

    self.currentPage = 1;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //
    self.containerView.layer.cornerRadius = 10;
    self.containerView.layer.masksToBounds = YES;
    self.equipments = [[NSMutableArray alloc] init];
    [SVProgressHUD showWithStatus:@"正在加载..."];
    self.isFirstLoad = YES;
    //network
    [self sendRequest];
}

- (void)insertRowAtTop {
    __weak EquipmentListViewController *weakSelf = self;
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf.equipments removeAllObjects];
        weakSelf.isRefreshing = YES;
        weakSelf.currentPage=1;
        [weakSelf sendRequest];
    });
}


- (void)insertRowAtBottom {
    __weak EquipmentListViewController *weakSelf = self;
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (weakSelf.isLoadingmore) {
            weakSelf.isLoding = YES;
            weakSelf.currentPage++;
            [weakSelf sendRequest];
        }
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------UITableViewDatasource-------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"EquipmentCell"
                                                    owner:self options:nil];
    EquipmentCell * cell = (EquipmentCell *)[bundle objectAtIndex:0];
    NSDictionary *equipment = [self.equipments objectAtIndex:indexPath.row];
    cell.equipmentId = [[equipment objectForKey:@"id"] longValue];
    cell.lblName.text = [equipment objectForKey:@"name"];
    cell.lblSN.text = [equipment objectForKey:@"sn"];
    cell.imgBackground.image = [UIImage imageNamed:@"equipment.jpg"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.equipments count];
}

#pragma mark -------------UITableViewDelegate-------------
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row<self.equipments.count) {
//        return 85.f;
//    }else{
//        return kLoadmoreFooterHeight;
//    }
    if (IS_Pad) {
        return 120.f;
    }else{
        return 70.f;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    EquipmentDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"equipmentDetailViewController"];
//    detailViewController.hidesBottomBarWhenPushed = YES;
//    detailViewController.equipment = [self.equipments objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:detailViewController animated:YES];
    
    EquipmentDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"equipmentDetailViewController"];
    detailViewController.equipment = [self.equipments objectAtIndex:indexPath.row];
    self.tableView.scrollEnabled = NO;
    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
    [folderTableView openFolderAtIndexPath:indexPath WithContentView:detailViewController.view
                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                     // opening actions
                                 }
                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                    // closing actions
                                }
                           completionBlock:^{
                               // completed actions
                               self.tableView.scrollEnabled = YES;
                           }];
    
}

#pragma mark -------------ASIHTTPRequestDelegate-------------

- (void)requestFinished:(ASIHTTPRequest *)request
{
    __weak EquipmentListViewController *weakSelf = self;
    // Use when fetching text data
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        if (self.isFirstLoad) {
            [SVProgressHUD showSuccessWithStatus:@"解析成功"];
        }
        NSDictionary *data = [dict objectForKey:@"data"];
        [self.equipments addObjectsFromArray:[data objectForKey:@"equipments"]];
        [self.tableView reloadData];
        if (self.isRefreshing) {
            [weakSelf.tableView.pullToRefreshView stopAnimating];
        }
        if (self.isLoding) {
            [weakSelf.tableView.infiniteScrollingView stopAnimating];
        }
        if ([[data objectForKey:@"totalCount"] intValue]>(self.currentPage*kPageSize)) {
            self.isLoadingmore = YES;
            weakSelf.tableView.showsInfiniteScrolling = YES;
        }else{
            weakSelf.tableView.showsInfiniteScrolling = NO;
            self.isLoadingmore = NO;
        }
    }else{
        if (self.isFirstLoad) {
            [SVProgressHUD showErrorWithStatus:@"解析失败"];
        }
        debugLog(@"");
    }
    self.isFirstLoad = NO;
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    //    NSError *error = [request error];
    [SVProgressHUD showErrorWithStatus:@"网络错误"];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setBackgroundImgView:nil];
    [self setContainerView:nil];
    [super viewDidUnload];
}
@end
