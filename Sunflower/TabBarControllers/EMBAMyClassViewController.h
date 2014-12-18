//
//  EMBAMyClassViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAMineHeaderView.h"
#import "EMBAAnnouncementCell.h"
#import "EMBACalculation.h"
#import "EMBAMyClassHeaderView.h"
#import "EMBAMainCell.h"

@interface EMBAMyClassViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView                    *myClassTableView;

@end
