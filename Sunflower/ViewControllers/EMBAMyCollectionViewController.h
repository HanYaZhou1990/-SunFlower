//
//  EMBAMyCollectionViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/10.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBASettingsViewController.h"
#import "EMBAChangeRootViewController.h"
#import "EMBASegumentView.h"
#import "EMBACollectionCell.h"
#import "EMBAMainCell.h"

@interface EMBAMyCollectionViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate,EMBASegumentViewDelegate>

@property (strong, nonatomic) TWTSideMenuViewController *sideMenuViewController;
/*!收藏表*/
@property (strong, nonatomic) UITableView               *collectionTableView;
/*!
 数组里有一个字符串，作为区头， @"title"
 然后有个数组，数组里边的数据作为行标题  @"rowTitleArray"
*/
@property (nonatomic, strong) NSArray                   *informationAry;

/*!最上排的Menu*/
@property (nonatomic, strong) EMBASegumentView          *segumentView;

@property (nonatomic, assign) NSInteger                 selectIndex;
/*!收藏的消息*/
@property (nonatomic, strong) NSArray                   *messageAry;
/*!收藏的校友*/
@property (nonatomic, strong) NSArray                   *schoolFriendAry;

@end
