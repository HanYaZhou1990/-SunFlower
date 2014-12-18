//
//  EMBAMyLessonDetailViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyLessonDetailViewController.h"

@interface EMBAMyLessonDetailViewController ()

@end

@implementation EMBAMyLessonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*返回按钮*/
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 44);
    
    [backButton setImage:[UIImage imageNamed:@"backButtonIcon.png"] forState:UIControlStateNormal];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);/***上／左／下／右***/
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(14, -8, 10, 0);
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    UIBarButtonItem* collectBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"collect_bar_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    
    self.navigationItem.rightBarButtonItem = collectBarItem;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     UIColorFromRGB(0xFFFFFF), UITextAttributeTextColor,
                                                                     [UIFont systemFontOfSize:16.0], UITextAttributeFont,
                                                                     nil]];
    
    _lessonDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStyleGrouped];
    _lessonDetailTableView.dataSource = self;
    _lessonDetailTableView.delegate = self;
    [_lessonDetailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_lessonDetailTableView registerClass:[EMBAMainCell class] forCellReuseIdentifier:@"mainCell"];
    [_lessonDetailTableView  registerClass:[EMBAMyClassHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    _lessonDetailTableView.tableFooterView = [UIView new];
    _lessonDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_lessonDetailTableView];
    
    _titleArray = @[@"课程名称",@"讲师",@"课程时段",@"课程时间",@"课程地点"];
    _contentArrary = @[@"市场经济学",
                     @{@"header":@"bg.png",@"name":@"张迪",@"phone":@"18886868686"},
                     @"2014年上半年第四周到第十五周",
                     @[@"周一 09:00－12:00",@"周二 14:00－17:00",@"周三 09:00－17:00",@"周六 14:00－17:00"],
                     @"综合楼c栋 201"];
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)barItemClick:(UIBarButtonItem *)barButtonItem{
    
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return [_contentArrary[section] count];
    }else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    EMBAMyClassHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    headerView.titleLable.text = _titleArray[section];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        EMBAMainCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
        mainCell.selectionStyle = UITableViewCellSelectionStyleNone;
        mainCell.timeLable.hidden = YES;
        mainCell.firstImageView.hidden = YES;
        mainCell.numberLable.hidden = YES;
        return mainCell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
        cell.layer.borderWidth = 0.5;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = UIColorFromRGB(0x333333);
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        style.firstLineHeadIndent = 6;//首行缩进
        style.headIndent = 6;//行首缩进
        if (indexPath.section == 3){
            if ([[_contentArrary[indexPath.section] objectAtIndex:indexPath.row] length]>0) {
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[[_contentArrary[indexPath.section] objectAtIndex:indexPath.row] stringClearNull] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x333333)}];
                [cell.textLabel setAttributedText:attributedString];
            }else{}
        }else{
            if ([_contentArrary[indexPath.section] length]>0) {
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[_contentArrary[indexPath.section] stringClearNull] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x333333)}];
                [cell.textLabel setAttributedText:attributedString];
            }
        }
        return cell;
    }
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

@end
