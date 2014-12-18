//
//  EMBAMyClassViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyClassViewController.h"

@interface EMBAMyClassViewController ()

@end

@implementation EMBAMyClassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

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
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     UIColorFromRGB(0xFFFFFF), UITextAttributeTextColor,
                                                                     [UIFont systemFontOfSize:16.0], UITextAttributeFont,
                                                                     nil]];
    
    
    _myClassTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStyleGrouped];
    _myClassTableView.dataSource = self;
    _myClassTableView.delegate = self;
    [_myClassTableView registerClass:[EMBAAnnouncementCell class] forCellReuseIdentifier:@"announcementCell"];
    [_myClassTableView registerClass:[EMBAMainCell class] forCellReuseIdentifier:@"cell"];
    [_myClassTableView registerClass:[EMBAMyClassHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    _myClassTableView.tableFooterView = [UIView new];
    _myClassTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myClassTableView];
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [EMBACalculation height:@"2014年1班聚会将于2014年3月4日在汐歌儿大酒店举行，届时有任何问题请大家联系班长：13876658888" widthOfFatherView:280 textFont:[UIFont systemFontOfSize:14]]+30;
    }else{
        return 64;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 36;
    }else {
        return 41;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 1;
    }else{
        return 4;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    EMBAMyClassHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    headerView.titleLable.text = @"班级公告";
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        EMBAAnnouncementCell *announcementCell = [tableView dequeueReusableCellWithIdentifier:@"announcementCell" forIndexPath:indexPath];
        return announcementCell;
    }
    EMBAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = UIColorFromRGB(0xFFFFFF);
    cell.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
    cell.layer.borderWidth = 0.5;
    cell.timeLable.text = @"学习委员";
    cell.timeLable.adjustsFontSizeToFitWidth = YES;
    cell.firstImageView.hidden = YES;
    cell.numberLable.hidden = YES;
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

@end
