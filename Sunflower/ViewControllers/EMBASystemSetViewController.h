//
//  EMBASystemSetViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/10.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBASettingsViewController.h"
#import "EMBAChangeRootViewController.h"
#import "EMBASystemSettingCell.h"

@interface EMBASystemSetViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) TWTSideMenuViewController *sideMenuViewController;
/*!设置表*/
@property (nonatomic, strong) UITableView               *settingtableView;
/*!
 设置项
 @"title"  区头
 @"rotTitle"  行标题
*/

@property (nonatomic, strong) NSArray                   *settingMenuAry;

@end
