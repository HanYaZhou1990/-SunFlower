//
//  EMBAUserInfoViewController.h
//  Sunflower
//
//  Created by crystal on 14-11-22.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBASettingsViewController.h"
#import "EMBAChangeRootViewController.h"
#import "EMBAPersonalEditViewController.h"

@interface EMBAUserInfoViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) TWTSideMenuViewController *sideMenuViewController;

@property (nonatomic, strong)UITableView             * tableView;
@property (nonatomic, strong)NSArray                 * titleArray;
@property (nonatomic, strong)NSArray                 * subArray;

@end
