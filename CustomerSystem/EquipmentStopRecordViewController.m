//
//  EquipmentStopRecordViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-4.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentStopRecordViewController.h"
#import "EquipmentStopRecordCell.h"

@interface EquipmentStopRecordViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) NSMutableArray *records;
@property (nonatomic,retain) ASIFormDataRequest *request;
@property NSUInteger currentPage;
@property BOOL isRefreshing;//是否正在刷新
@property BOOL isLoadingmore;//是否有更多页
@property BOOL isFirstLoad;//是否是第一次加载
@property BOOL isLoding;//是否正在加载更多
@end

//{\"error\":0,\"message\":null,\"data\":{\"totalCount\":7,\"stopRecords\":[{\"reason\":\"检修\",\"stopDuration\":2099700,\"recoverTime\":1369207875218,\"stopTime\":1369205775518},{\"reason\":\"故障\",\"stopDuration\":2099700,\"recoverTime\":1369207895218,\"stopTime\":1369205875518},{\"reason\":\"停电\",\"stopDuration\":2099700,\"recoverTime\":1369227875218,\"stopTime\":1369205895518}]}}
@implementation EquipmentStopRecordViewController

- (void) recordsData:(NSUInteger)page {
    for (int i=(page-1)*10+1; i<=10*page; i++) {
        NSMutableDictionary *record = [[NSMutableDictionary alloc] init];
        if (i%2==0) {
            [record setValue:@"系统检查" forKey:@"reason"];
            [record setValue:@"12小时" forKey:@"continuousTime"];
            [record setValue:@"2013-01-18 15:07:23" forKey:@"stopTime"];
        }else if (i%3==0){
            [record setValue:@"限电倒电" forKey:@"reason"];
            [record setValue:@"6小时" forKey:@"continuousTime"];
            [record setValue:@"2013-05-02 11:09:42" forKey:@"stopTime"];
        }else{
            [record setValue:@"生产故障" forKey:@"reason"];
            [record setValue:@"33小时" forKey:@"continuousTime"];
            [record setValue:@"2013-04-11 09:02:11" forKey:@"stopTime"];
        }
        [self.records addObject:record];
    }
}

- (void)sendRequest{
    if (self.isFirstLoad) {
        [SVProgressHUD showWithStatus:@"正在加载..."];
    }
    self.request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:kEquipmentStopRecord]];
    [self.request setPostValue:kSharedApp.accessToken forKey:@"accessToken"];
    [self.request setPostValue:kSharedApp.factoryId forKey:@"factoryId"];
    [self.request setPostValue:[NSNumber numberWithLong:self.equipmentId] forKey:@"equipmentId"];
    [self.request setPostValue:[NSNumber numberWithInt:((self.currentPage-1)*kPageSize)] forKey:@"offset"];
    [self.request setPostValue:[NSNumber numberWithInt:kPageSize] forKey:@"count"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.navigationItem.backBarButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.title = @"停机记录列表";
    //headerView&bottomView
    __weak EquipmentStopRecordViewController *weakSelf = self;
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf insertRowAtTop];
    }];
    // setup infinite scrolling
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];
    //
    self.containerView.layer.cornerRadius = 10;
    self.containerView.layer.masksToBounds = YES;
    self.records = [[NSMutableArray alloc] init];
    self.isFirstLoad = YES;
    self.currentPage = 1;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self sendRequest];
}

- (void)insertRowAtTop {
    __weak EquipmentStopRecordViewController *weakSelf = self;
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf.records removeAllObjects];
        weakSelf.isRefreshing = YES;
        weakSelf.currentPage=1;
        [weakSelf sendRequest];
    });
}


- (void)insertRowAtBottom {
    __weak EquipmentStopRecordViewController *weakSelf = self;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.records count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *bundle = nil;
    if (IS_Pad) {
        bundle = [[NSBundle mainBundle] loadNibNamed:@"EquipmentStopRecordCell_iPad"
                                               owner:self options:nil];
    }else{
        bundle = [[NSBundle mainBundle] loadNibNamed:@"EquipmentStopRecordCell"
                                               owner:self options:nil];
    }
    EquipmentStopRecordCell * cell = (EquipmentStopRecordCell *)[bundle objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *record = [self.records objectAtIndex:indexPath.row];
    cell.imgViewStatus.image = [UIImage imageNamed:@"stop.png"];
    cell.lblReason.text = [record objectForKey:@"reason"];
    cell.lblContinuousTime.text = [Tool secondsToHour:[[record objectForKey:@"stopDuration"] longValue]];
    cell.lblStopTime.text = [Tool timeIntervalToString:[[record objectForKey:@"stopTime"] doubleValue]/1000 dateformat:kDateFormatFull];
    cell.lblRestoreTime.text = [Tool timeIntervalToString:[[record objectForKey:@"recoverTime"] doubleValue]/1000 dateformat:kDateFormatFull];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_Pad) {
        return 110.f;
    }else{
        return 70.f;
    }
}

#pragma mark -------------ASIHTTPRequestDelegate-------------

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    //    NSString *responseString = [request responseString];
    __weak EquipmentStopRecordViewController *weakSelf = self;
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        [SVProgressHUD showSuccessWithStatus:@"解析成功"];
        NSDictionary *data = [dict objectForKey:@"data"];
        [self.records addObjectsFromArray:[data objectForKey:@"stopRecords"]];
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
            self.isLoadingmore = NO;
            weakSelf.tableView.showsInfiniteScrolling = NO;
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

- (void)viewDidUnload {
    [self setContainerView:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
