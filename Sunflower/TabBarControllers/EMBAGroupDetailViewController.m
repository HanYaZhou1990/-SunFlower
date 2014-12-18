//
//  EMBAGroupDetailViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAGroupDetailViewController.h"

@interface EMBAGroupDetailViewController ()

@end

@implementation EMBAGroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xF6F6F6);
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
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     UIColorFromRGB(0xFFFFFF), UITextAttributeTextColor,
                                                                     [UIFont systemFontOfSize:16.0], UITextAttributeFont,
                                                                     nil]];
    
    
    _groupDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _groupDetailTableView.dataSource = self;
    _groupDetailTableView.delegate = self;
    [_groupDetailTableView registerClass:[EMBAGroupInformationCell class] forCellReuseIdentifier:@"cell"];
    _groupDetailTableView.tableFooterView = [UIView new];
    _groupDetailTableView.backgroundColor = UIColorFromRGB(0xF6F6F6);
    _groupDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_groupDetailTableView];
    
    _groupInformationArray = @[@[@"群名称",@"郑州大学汇"],@[@"群简介",@"来自郑州大学的校友们"],@[@"群公告",@"相聚是缘分，走到哪里都是老乡"]];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 65;
    }else{
        return 55;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 29;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
    view.layer.borderWidth = 0.25;
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMBAGroupInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
    cell.layer.borderWidth = 0.25;
    if (indexPath.section == 1) {
        cell.titleLable.text = _groupInformationArray[indexPath.row][0];
        cell.detailLable.text = _groupInformationArray[indexPath.row][1];
    }else {
        UIButton *addButton= [UIButton buttonWithType:UIButtonTypeCustom];
        [addButton setBackgroundImage:[UIImage imageNamed:@"addBtn.png"] forState:UIControlStateNormal];
        addButton.frame = CGRectMake(10, 10, 35, 35);
        [addButton addTarget:self action:@selector(addGroupMember:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:addButton];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)addGroupMember:(UIButton *)sender{
    EMBAAddGroupViewController *addViewController = [[EMBAAddGroupViewController alloc] init];
    addViewController.title = @"添加新成员";
    [self.navigationController pushViewController:addViewController animated:YES];
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
