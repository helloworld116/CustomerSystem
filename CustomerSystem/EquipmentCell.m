//
//  EquipmentCell.m
//  CustomerSystem
//
//  Created by wzg on 13-4-27.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentCell.h"
#import "AppDelegate.h"
#import "EquipmentListViewController.h"
#import "EquipmentStopRecordViewController.h"

@implementation EquipmentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)stopRecords:(id)sender {
    EquipmentStopRecordViewController *stopRecordViewController = [kSharedApp.storyboard instantiateViewControllerWithIdentifier:@"stopRecordViewController"];
    stopRecordViewController.equipmentId = self.equipmentId;
    stopRecordViewController.hidesBottomBarWhenPushed = YES;
    [[self viewController].navigationController pushViewController:stopRecordViewController animated:YES];
}

//UIView获取所属的UIViewController范例
-(EquipmentListViewController *)viewController{
    for (UIView *next = [self superview]; next; next = [next superview]) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[EquipmentListViewController class]]) {
            return (EquipmentListViewController *)nextResponder;
        }
    }
    return nil;
}
@end
