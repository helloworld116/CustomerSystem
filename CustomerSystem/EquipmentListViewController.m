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

#define kHeaderViewBackgroundColor [UIColor whiteColor]
#define kFooterViewBackgroundColr [UIColor whiteColor]

@interface EquipmentListViewController ()<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate,LoadMoreTableFooterDelegate>
@property (nonatomic,retain) ASIFormDataRequest *request;
@property (nonatomic,retain) NSMutableArray *equipments;
@property (nonatomic,retain) EGORefreshTableHeaderView *refreshHeaderView;
@property (nonatomic,retain) LoadMoreTableFooterView *loadMoreTableFooterView;
@property NSUInteger currentPage;//当前显示页数
@property BOOL isRefreshing;//是否正在刷新
@property BOOL isLoadingmore;//是否有更多页
@end

@implementation EquipmentListViewController

- (void) equipmentsData:(NSUInteger)page {
    for (int i=(page-1)*15+1; i<=15*page; i++) {
        NSMutableDictionary *equipment = [[NSMutableDictionary alloc] init];
        [equipment setValue:[NSString stringWithFormat:@"设备%d",i] forKey:@"name"];
        if (i%2==0) {
            [equipment setValue:@"normal.png" forKey:@"status"];
        }else if (i%3==0){
            [equipment setValue:@"stop.png" forKey:@"status"];
        }else{
            [equipment setValue:@"fault.png" forKey:@"status"];
        }
        [self.equipments addObject:equipment];
    }
}

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"设备列表";
    //headerView
    self.refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f,  -REFRESHINGVIEW_HEIGHT, kScreenWidth,REFRESHINGVIEW_HEIGHT)];
    self.refreshHeaderView.backgroundColor = kHeaderViewBackgroundColor;
    [self.view addSubview:self.refreshHeaderView];
    self.refreshHeaderView.delegate = self;
    [self.refreshHeaderView refreshLastUpdatedDate];
    self.currentPage = 1;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [SVProgressHUD showWithStatus:@"正在加载..."];
    self.request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:kEquipmentList]];
    [self.request setUseCookiePersistence:YES];
    [self.request setPostValue:kSharedApp.accessToken forKey:@"accessToken"];
    [self.request setPostValue:kSharedApp.factoryId forKey:@"factoryId"];
    [self.request setPostValue:[NSNumber numberWithInt:((self.currentPage-1)*kPageSize)] forKey:@"offset"];
    [self.request setPostValue:[NSNumber numberWithInt:kPageSize] forKey:@"count"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];
    
    self.loadMoreTableFooterView = [[LoadMoreTableFooterView alloc] initWithFrame:CGRectZero];
    self.equipments = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------UITableViewDatasource-------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<self.equipments.count) {
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
    }else{
        static NSString *loadmoreCell = @"loadmoreCell";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loadmoreCell];
        self.loadMoreTableFooterView.hidden = NO;
        self.loadMoreTableFooterView.frame = cell.frame;
        [cell addSubview:self.loadMoreTableFooterView];
        return cell;
//        [self.tableView addSubview:self.loadMoreTableFooterView];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.isLoadingmore) {
        return [self.equipments count]+1;
    }else{
        return [self.equipments count];
    }
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
    // Use when fetching text data
//    NSString *responseString = [request responseString];
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        [SVProgressHUD dismissWithSuccess:@"解析成功"];
        NSDictionary *data = [dict objectForKey:@"data"];
        [self.equipments addObjectsFromArray:[data objectForKey:@"equipments"]];
        [self.tableView reloadData];
        if ([[data objectForKey:@"totalCount"] intValue]>(self.currentPage*kPageSize)) {
            self.isLoadingmore = YES;
        }else{
            self.isLoadingmore = NO;
        }
    }else{
        [SVProgressHUD dismissWithError:@"解析失败"];
        debugLog(@"");
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    //    NSError *error = [request error];
}

#pragma mark -------------EGORefreshTableHeaderDelegate-------------
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    self.isRefreshing = YES;
    self.currentPage = 1;
    [self performSelector:@selector(doneLoadingTableViewData) withObject:self afterDelay:3.0f];  //make a delay to show loading process for a while
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return self.isRefreshing;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    return [NSDate date]; 
}

#pragma mark -------------LoadMoreTableFooterDelegate-------------
- (void)loadMoreTableFooterDidTriggerRefresh:(LoadMoreTableFooterView *)view{
    [self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}

- (BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView *)view{
    return self.isLoadingmore;
}

#pragma mark 重新加载表格数据
- (void)doneLoadingTableViewData{
    if (self.isRefreshing||self.isLoadingmore) {
        if (self.isRefreshing)
        {
            self.isRefreshing = NO;
            [self.refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
            [self.equipments removeAllObjects];
        }
        if (self.isLoadingmore) {
//            self.isLoadingmore = NO;
            [self.loadMoreTableFooterView loadMoreScrollViewDataSourceDidFinishedLoading:self.tableView];
        }
        //todo 从网络加载数据
//        [self equipmentsData:self.currentPage];
        [self.tableView reloadData];
    }
}

- (void)reloadTableViewDataSource{
    
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	self.isLoadingmore = YES;
    self.currentPage++;
}



#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[self.refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height )
    {
        if (!self.isLoadingmore) return;
        self.currentPage ++;
        [self performSelector:@selector(doneLoadingTableViewData) withObject:self afterDelay:1.0f]; //make a delay to show loading process for a while
    }
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
