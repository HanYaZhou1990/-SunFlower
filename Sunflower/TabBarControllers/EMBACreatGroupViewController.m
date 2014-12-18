//
//  EMBACreatGroupViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBACreatGroupViewController.h"

@interface EMBACreatGroupViewController ()

@end

@implementation EMBACreatGroupViewController

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
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitItemClicked:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    _creatGroupTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStyleGrouped];
    _creatGroupTableView.dataSource = self;
    _creatGroupTableView.delegate = self;
    [_creatGroupTableView registerClass:[EMBACreatGroupCell class] forCellReuseIdentifier:@"cell"];
    _creatGroupTableView.tableFooterView = [UIView new];
    _creatGroupTableView.backgroundColor = UIColorFromRGB(0xF6F6F6);
    _creatGroupTableView.separatorColor = UIColorFromRGB(0xD9D9D9);
    [self.view addSubview:_creatGroupTableView];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMBACreatGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLable.text = @"群名称";
        cell.contentTextField.placeholder = @"索尼娅";
    }else{
        cell.titleLable.text = @"群简介";
        cell.contentTextField.placeholder = @"如2014届3班";
    }
    return cell;
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)submitItemClicked:(UIBarButtonItem *)sender{
    EMBACreatSuccessViewController *successViewController = [[EMBACreatSuccessViewController alloc] init];
    successViewController.title = @"创建群租成功";
    [self.navigationController pushViewController:successViewController animated:YES];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}

@end
