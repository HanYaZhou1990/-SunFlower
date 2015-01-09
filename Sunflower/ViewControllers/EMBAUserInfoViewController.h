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
#import "EMBAMessageViewController.h"
#import "UIImageView+WTRequestCenter.h"
#import "ChatViewController.h"

@interface EMBAUserInfoViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong ,nonatomic) NSString *userIdStr;//详情ID
@property (assign,nonatomic) BOOL isUser;//判断是否是用户自己

@property (strong, nonatomic) TWTSideMenuViewController *sideMenuViewController;

@property (nonatomic, strong) UITableView                                                 * tableView;
@property (nonatomic, strong) NSArray                                                     * titleArray;
@property (nonatomic, strong) NSArray                                                     * subArray;
@property  (strong ,nonatomic) NSString                                                   * classNameString;//来自班级

@end
