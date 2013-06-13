//
//  EquipmentView.h
//  CustomerSystem
//
//  Created by wzg on 13-4-27.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "EquipmentCell.h"

@interface EquipmentView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSMutableArray *equipments;


@end
