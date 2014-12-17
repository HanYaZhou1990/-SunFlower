//
//  EMBAMyLessonViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBASegumentView.h"
#import "EMBAMyLessonCell.h"

@interface EMBAMyLessonViewController : EMBAFatherViewController<EMBASegumentViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) EMBASegumentView                      *segumentView;

@property (nonatomic, strong) UITableView                           *myLessonTableView;

@property (nonatomic, strong) NSArray                               *titleArray;

@end
