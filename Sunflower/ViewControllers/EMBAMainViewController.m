

    //
//  EMBAMainViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-20.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMainViewController.h"

@interface EMBAMainViewController ()

@end

@implementation EMBAMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"message_icon.png"] tag:0];
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return self;
}

- (void)barItemClick:(UIBarButtonItem *)barButtonItem{
    if (barButtonItem.tag == 21) {
        EMBAMyCollectionViewController *myCollectionVC = [[EMBAMyCollectionViewController alloc] init];
        myCollectionVC.needPop = YES;
        [self.navigationController pushViewController:myCollectionVC animated:YES];
    }else{
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    openItem.tag = 19;
    self.navigationItem.leftBarButtonItem = openItem;
    
    
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Search_Bar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    searchBarItem.tag = 20;
    UIBarButtonItem* collectBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"collect_bar_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    collectBarItem.tag = 21;
        
    self.navigationItem.rightBarButtonItems = @[collectBarItem,searchBarItem];
    
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource  = self;
    _mainTableView.tableFooterView = [UIView new];
    [_mainTableView registerClass:[EMBAMainCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_mainTableView];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMBAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EMBAMessageViewController *messageViewController = [[EMBAMessageViewController alloc] init];
    messageViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:messageViewController animated:YES];
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
