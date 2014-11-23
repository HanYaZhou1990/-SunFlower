

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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
     self.navigationItem.leftBarButtonItem = openItem;
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64) style:UITableViewStylePlain];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    _mainTableView.tableFooterView = [UIView new];
    [self.view addSubview:_mainTableView];
    
    HYZMainMenuView *view = [[HYZMainMenuView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) btnInformation:@[
    @[[UIImage imageNamed:@"message.png"],[UIImage imageNamed:@"message.png"]],
    @[[UIImage imageNamed:@"friend.png"],[UIImage imageNamed:@"friend.png"]],
    @[[UIImage imageNamed:@"me.png"],[UIImage imageNamed:@"me.png"]],
    @[[UIImage imageNamed:@"must.png"],[UIImage imageNamed:@"must.png"]],
    @[[NSString stringWithFormat:@"%d",0],[UIImage initWithColor:UIColorFromRGB(0xf6f6f6)]]]];
    view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    view.delegate = self;
    [self.view addSubview:view];
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark - HYZMainMenuViewDelegate
- (void)view:(HYZMainMenuView *)view didSelectIndex:(NSInteger)indexOfButton{
}

#pragma mark -
#pragma mark UITableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}

@end
