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

- (void)barItemClick:(UIBarButtonItem *)barButtonItem{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Search_Bar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    searchBarItem.tag = 20;
    UIBarButtonItem* collectBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"collect_bar_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    collectBarItem.tag = 21;
    
    self.navigationItem.rightBarButtonItems = @[collectBarItem,searchBarItem];
    
    _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _mineTableView.dataSource = self;
    _mineTableView.delegate = self;
    [_mineTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    /*需要重新初始化，放弃registClass方法*/
//    [_mineTableView registerClass:[EMBAMineHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    _mineTableView.tableFooterView = [UIView new];
    [self.view addSubview:_mineTableView];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 140)];
    [imageView setImage:[UIImage imageNamed:@"CURRENT.png"]];
    
    _header = [ExpandHeader expandWithScrollView:_mineTableView expandView:imageView];
    
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 1;
    }else{
        return 2;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    EMBAMineHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (section == 0) {
        EMBAMineHeaderView *view = [[EMBAMineHeaderView alloc] initWithFrame:CGRectZero withHeaderImage:[EMBAImageProcessing changeImage:[UIImage imageNamed:@"CURRENT.png"]] withText:nil];
        view.titleLable.text = @"EMBA课程";
        return view;
    }else{
        EMBAMineHeaderView *view = [[EMBAMineHeaderView alloc] initWithFrame:CGRectZero withHeaderImage:nil withText:nil];
        view.titleLable.text = @"将至课程";
        return view;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
