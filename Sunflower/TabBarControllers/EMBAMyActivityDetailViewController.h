//
//  EMBAMyActivityDetailViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAMyClassHeaderView.h"
#import "EMBACalculation.h"

@interface EMBAMyActivityDetailViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView        *activityDetailTableView;
@property (nonatomic, strong) NSArray            *titleArray;
@property (nonatomic, strong) NSArray            *contentArrary;

@end
