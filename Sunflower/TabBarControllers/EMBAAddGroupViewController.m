//
//  EMBAAddGroupViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAAddGroupViewController.h"

@interface EMBAAddGroupViewController ()

@end

@implementation EMBAAddGroupViewController

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
    
    _addGroupTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _addGroupTableView.dataSource = self;
    _addGroupTableView.delegate = self;
    [_addGroupTableView registerClass:[EMBAMainCell class] forCellReuseIdentifier:@"cell"];
    _addGroupTableView.tableFooterView = [UIView new];
    _addGroupTableView.backgroundColor = UIColorFromRGB(0xF6F6F6);
    _addGroupTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_addGroupTableView];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMBAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.firstImageView.hidden = YES;
    cell.numberLable.hidden = YES;
    cell.timeLable.hidden = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setBackgroundImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = button;
    return cell;
}

- (void)addButtonClicked:(UIButton *)sender{
    if ([self.title isEqualToString:@"添加新成员"]) {
        return;
    }else{
        EMBAAddSuccessViewController *successViewController = [[EMBAAddSuccessViewController alloc] init];
        successViewController.title = @"加入一个群";
        [self.navigationController pushViewController:successViewController animated:YES];
    }
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}

@end
