//
//  EMBAPersonalViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-5.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAPersonalEditViewController.h"

@interface EMBAPersonalViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)UITableView             * tableView;
@property (nonatomic, strong)NSArray                 * titleArray;
@property (nonatomic, strong)NSArray                 * subArray;
@end
