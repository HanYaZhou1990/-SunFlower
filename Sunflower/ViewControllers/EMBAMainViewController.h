//
//  EMBAMainViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14-11-20.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "HYZMainMenuView.h"

@interface EMBAMainViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate,HYZMainMenuViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@end
