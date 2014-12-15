//
//  EMBAMineViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBAMineTopCell.h"
#import "EMBAMineHeaderView.h"
#import "EMBAImageProcessing.h"
#import "UIImage+Color.h"

@interface EMBAMineViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView    *mineTableView;

@end
