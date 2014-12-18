//
//  EMBAAddGroupViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAMainCell.h"
#import "EMBAAddSuccessViewController.h"

@interface EMBAAddGroupViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView               *addGroupTableView;

@end
