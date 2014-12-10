//
//  EMBAMessageViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/8.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAMessageCell.h"

@interface EMBAMessageViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView               *messageTableView;/* 聊天表*/
/*!消息数组*/
@property (nonatomic, strong) NSArray                   *messageArray;

@end
