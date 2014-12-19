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
    EMBAMyCollectionViewController *myCollectionVC = [[EMBAMyCollectionViewController alloc] init];
    myCollectionVC.needPop = YES;
    [self.navigationController pushViewController:myCollectionVC animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
//    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Search_Bar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
//    searchBarItem.tag = 20;
    UIBarButtonItem* collectBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"collect_bar_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
//    collectBarItem.tag = 21;
    
    self.navigationItem.rightBarButtonItem = collectBarItem;
    
    _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStyleGrouped];
    _mineTableView.dataSource = self;
    _mineTableView.delegate = self;
    [_mineTableView registerClass:[EMBAMineMenuCell class] forCellReuseIdentifier:@"mineMenuCell"];
    [_mineTableView registerClass:[EMBAMineCell class] forCellReuseIdentifier:@"cell"];
    /*需要重新初始化，放弃registClass方法*/
//    [_mineTableView registerClass:[EMBAMineHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    _mineTableView.tableFooterView = [UIView new];
    _mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    if (indexPath.section == 0) {
        return 64;
    }else{
        return 100;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 35;
    }else {
        return 38;
    }
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
    if (indexPath.section == 0) {
        EMBAMineMenuCell *menuCell = [tableView dequeueReusableCellWithIdentifier:@"mineMenuCell" forIndexPath:indexPath];
        menuCell.delegate = self;
        return menuCell;
    }
    EMBAMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark EMBAMineMenuCellDelegate -
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton{
    switch (indexOfButton) {
        case 0:
        {
        EMBAMyClassViewController *classViewController = [[EMBAMyClassViewController alloc] init];
        classViewController.hidesBottomBarWhenPushed = YES;
        classViewController.title = @"我的班级";
        [self.navigationController pushViewController:classViewController animated:YES];
        }
            break;
        case 1:
        {
        EMBAMyLessonViewController *lessonViewController = [[EMBAMyLessonViewController alloc] init];
        lessonViewController.hidesBottomBarWhenPushed = YES;
        lessonViewController.title = @"我的课程";
        [self.navigationController pushViewController:lessonViewController animated:YES];
        }
            break;
        case 2:
        {
        EMBAMyActivityViewController *activityViewController = [[EMBAMyActivityViewController alloc] init];
        activityViewController.hidesBottomBarWhenPushed = YES;
        activityViewController.title = @"我的活动";
        [self.navigationController pushViewController:activityViewController animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
