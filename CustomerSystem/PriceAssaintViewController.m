//
//  PriceAssaintViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-5-8.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "PriceAssaintViewController.h"

@interface PriceAssaintViewController ()
@property (nonatomic,retain) NSMutableArray *products;
@end

@implementation PriceAssaintViewController

-(void) productsInit{
    for (int i=1; i<=10; i++) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setValue:[NSString stringWithFormat:@"产品%d",i] forKey:@"name"];
        [dict setValue:[NSString stringWithFormat:@"%d元/吨",i] forKey:@"price"];
        [self.products addObject:dict];
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
    
    
//    self.navigationController
//    self.navigationItem
//    self.title
    
	// Do any additional setup after loading the view.
    self.products = [[NSMutableArray alloc] init];
    [self productsInit];
    self.productPriceTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.productPriceTableview
    self.productPriceTableview.dataSource = self;
    self.productPriceTableview.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"PriceAssaintCell" owner:self options:nil];
    PriceAssaintCell * cell = (PriceAssaintCell *)[bundle objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *product = [self.products objectAtIndex:indexPath.row];
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tmall_bg_main"]];
    cell.lblName.text = [product objectForKey:@"name"];
    cell.lblTag.text = @"推荐售价：";
    cell.lblPrice.text = [product objectForKey:@"price"];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    SubCateViewController *subVc = [[[SubCateViewController alloc]
//                                     initWithNibName:NSStringFromClass([SubCateViewController class])
//                                     bundle:nil] autorelease];
//    NSDictionary *cate = [self.cates objectAtIndex:indexPath.row];
//    subVc.subCates = [cate objectForKey:@"subClass"];
//    self.currentCate = cate;
//    subVc.cateVC = self;

    ProductPriceDetailViewController *subVc = [self.storyboard instantiateViewControllerWithIdentifier:@"productPriceDetailViewController"];
    self.productPriceTableview.scrollEnabled = NO;
    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
    [folderTableView openFolderAtIndexPath:indexPath WithContentView:subVc.view
                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                     // opening actions
                                 }
                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                    // closing actions
                                }
                           completionBlock:^{
                               // completed actions
                               self.productPriceTableview.scrollEnabled = YES;
                           }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.f;
}

- (void)viewDidUnload {
    [self setProductPriceTableview:nil];
    [super viewDidUnload];
}
@end
