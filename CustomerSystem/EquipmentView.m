//
//  EquipmentView.m
//  CustomerSystem
//
//  Created by wzg on 13-4-27.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentView.h"
#import "EquipmentCell.h"

@interface EquipmentView()

@property (nonatomic,retain) ASIHTTPRequest *request;

@end

@implementation EquipmentView

- (void) equipmentsData:(NSUInteger)page {
    for (int i=(page-1)*10; i<=10*page; i++) {
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        NSURL *url = [NSURL URLWithString:@""];
//        self.request = [[ASIHTTPRequest alloc] initWithURL:url];
//        self.request.delegate = self;
//        [self.request startAsynchronous];
//        [SVProgressHUD showWithStatus:@"正在加载..."];
        self.equipments = [[NSMutableArray alloc] init];
        [self equipmentsData:1];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

#pragma mark UITableViewDatasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *bundle = nil;
    if (IS_Pad) {
        bundle = [[NSBundle mainBundle] loadNibNamed:@"EquipmentCell_iPad"
                                                        owner:self options:nil];
    }else{
        bundle = [[NSBundle mainBundle] loadNibNamed:@"EquipmentCell"
                                                        owner:self options:nil];
    }
    EquipmentCell * cell = (EquipmentCell *)[bundle objectAtIndex:0];
    NSDictionary *equipment = [self.equipments objectAtIndex:indexPath.row];
//    cell.lblName.text = [equipment objectForKey:@"name"];
//    cell.imgState.image = [UIImage imageNamed:[equipment objectForKey:@"status"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.equipments count];
}

#pragma mark UITableViewDelegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_Pad) {
        return 120.f;
    }else{
        return 70.f;
    }
}

#pragma mark ASIHTTPRequest

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [request responseString];
    
    // Use when fetching binary data
//    NSData *responseData = [request responseData];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
//    NSError *error = [request error];
}

@end
