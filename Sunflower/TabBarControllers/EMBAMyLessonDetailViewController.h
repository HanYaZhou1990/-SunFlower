//
//  EMBAMyLessonDetailViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBAMyClassHeaderView.h"
#import "EMBAMainCell.h"

@interface EMBAMyLessonDetailViewController : EMBAFatherViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView        *lessonDetailTableView;
@property (nonatomic, strong) NSArray            *titleArray;
@property (nonatomic, strong) NSArray            *contentArrary;

@end
