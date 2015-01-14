//
//  EMBAMainViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14-11-20.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBAMainCell.h"
#import "EMBAMessageViewController.h"
#import "EMBAMyCollectionViewController.h"
#import "EaseMob.h"
#import "ConvertToCommonEmoticonsHelper.h"
#import "NSDate+Category.h"
#import "ChatViewController.h"

@interface EMBAMainViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate,UITabBarControllerDelegate,ChatViewControllerDelegate>

@property (nonatomic, strong) UITableView          *mainTableView;
@property (nonatomic, strong) NSMutableArray       *historyArray;

@end
