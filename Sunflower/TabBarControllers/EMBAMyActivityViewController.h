//
//  EMBAMyActivityViewController.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBASegumentView.h"
#import "EMBAMyLessonCell.h"
#import "EMBAMyActivityDetailViewController.h"

@interface EMBAMyActivityViewController : EMBAFatherViewController<EMBASegumentViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) EMBASegumentView                      *segumentView;

@property (nonatomic, strong) UITableView                           *myActivityTableView;

@property (nonatomic, strong) NSArray                               *titleArray;

@end
