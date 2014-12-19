//
//  EMBAMineViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBAMineHeaderView.h"
#import "EMBAImageProcessing.h"
#import "UIImage+Color.h"
#import "ExpandHeader.h"
#import "EMBAMineMenuCell.h"
#import "EMBAMineCell.h"
#import "EMBAMyClassViewController.h"
#import "EMBAMyLessonViewController.h"
#import "EMBAMyActivityViewController.h"
#import "EMBAMyCollectionViewController.h"

@interface EMBAMineViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate,EMBAMineMenuCellDelegate>

@property (nonatomic, strong) UITableView    *mineTableView;
@property (nonatomic, strong) ExpandHeader    *header;

@end
