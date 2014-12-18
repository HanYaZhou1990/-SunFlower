//
//  EMBAGroupDetailViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAGroupInformationCell.h"
#import "EMBAAddGroupViewController.h"

@interface EMBAGroupDetailViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView               *groupDetailTableView;

@property (nonatomic, strong) NSArray                   *groupMemberArray;
@property (nonatomic, strong) NSArray                   *groupInformationArray;

@end
