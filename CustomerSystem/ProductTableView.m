//
//  ProductTableView.m
//  CustomerSystem
//
//  Created by wzg on 13-5-15.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "ProductTableView.h"
#import "ProductCell.h"
#import "ProductOverviewViewController.h"
#import "ProductViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ProductTableView()

@end

@implementation ProductTableView

- (id)initWithFrame:(CGRect)frame withProducts:(NSArray *)products
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.products = products;
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark begin UITableViewDatasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *bundle = nil;
    if (IS_Pad) {
        bundle = [[NSBundle mainBundle] loadNibNamed:@"ProductCell_iPad"
                                                    owner:self options:nil];
    }else{
        bundle = [[NSBundle mainBundle] loadNibNamed:@"ProductCell"
                                               owner:self options:nil];
    }
    ProductCell * cell = (ProductCell *)[bundle objectAtIndex:0];
    NSDictionary *product = [self.products objectAtIndex:indexPath.row];
//    cell.lblTagName.hidden = NO;
//    cell.lblTagCost.hidden = NO;
//    cell.lblTagTotalOutput.hidden = NO;
//    cell.lblTagUnitCost.hidden = NO;
    cell.imgView.image = [UIImage imageNamed:@"shuini.png"];
    cell.lblName.text = [product objectForKey:@"name"];
    cell.lblCost.text = [product objectForKey:@"zcb"];
    cell.lblOutput.text = [product objectForKey:@"zcl"];
//    cell.lblUnitCost.text = [product objectForKey:@"dwcb"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.products count];
}
#pragma mark end UITableViewDataSource


#pragma mark begin UITableViewDelegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_Pad) {
        return 160.f;
    }else{
        return 94.f;
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductViewController *viewController = [[self viewController].storyboard instantiateViewControllerWithIdentifier:@"productViewController"];
    viewController.hidesBottomBarWhenPushed = YES;
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionFade];
    [animation setSubtype: kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [[self viewController].navigationController pushViewController:viewController animated:NO];
    [[self viewController].navigationController.view.layer addAnimation:animation forKey:nil];
}

#pragma mark end UITableViewDelegate
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

//UIView获取所属的UIViewController范例
-(ProductOverviewViewController *)viewController{
    for (UIView *next = [self superview]; next; next = [next superview]) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[ProductOverviewViewController class]]) {
            return (ProductOverviewViewController *)nextResponder;
        }
    }
    return nil;
}
@end
