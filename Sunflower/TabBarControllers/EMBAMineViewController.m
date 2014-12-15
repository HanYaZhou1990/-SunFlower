//
//  EMBAMineViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMineViewController.h"

@interface EMBAMineViewController ()

@end

@implementation EMBAMineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"mine_icon.png"] tag:2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    
    _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _mineTableView.dataSource = self;
    _mineTableView.delegate = self;
    [_mineTableView registerClass:[EMBAMineTopCell class] forCellReuseIdentifier:@"topCell"];
    [_mineTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    /*需要重新初始化，放弃registClass方法*/
//    [_mineTableView registerClass:[EMBAMineHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    
    [self.view addSubview:_mineTableView];
    
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section== 0) {
        return 140;
    }else{
        return 64;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section== 0) {
        return 0;
    }else{
        return 35;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 3;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    EMBAMineHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (section == 1) {
        EMBAMineHeaderView *view = [[EMBAMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 35) withHeaderImage:[EMBAImageProcessing changeImage:[UIImage imageNamed:@"bg.png"]] withText:nil];
        view.titleLable.text = @"EMBA课程";
        return view;
    }else{
        EMBAMineHeaderView *view = [[EMBAMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 35) withHeaderImage:nil withText:nil];
        view.titleLable.text = @"将至课程";
        return view;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        EMBAMineTopCell *topCell = [tableView dequeueReusableCellWithIdentifier:@"topCell" forIndexPath:indexPath];
        topCell.topImage = [UIImage imageNamed:@"bg.png"];
        return topCell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark -
#pragma mark UITableViewDelegate -

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
