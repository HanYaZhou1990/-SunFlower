//
//  EMBACreatGroupViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBACreatGroupCell.h"
#import "EMBACreatSuccessViewController.h"

@interface EMBACreatGroupViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView               *creatGroupTableView;

@end
