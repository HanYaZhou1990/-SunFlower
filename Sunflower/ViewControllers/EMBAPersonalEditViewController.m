//
//  EMBAPersonalEditViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-11.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAPersonalEditViewController.h"

@interface EMBAPersonalEditViewController ()

@end

@implementation EMBAPersonalEditViewController

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
    self.title = @"JinXiuXian ";
    
    _titleArray = @[@"dianhua",@"youxiang",@"dizhi",@"banji"];
    _subArray = @[@"138......",@"23@123.com",@"zhongguohenanzhengzhou",@"sannianerban"];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"wancheng" style:UIBarButtonItemStylePlain target:Nil action:@selector(endRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark- TABLEVIEWDELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        EMBAPersonalCell * cell = [[EMBAPersonalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
        cell.titleLabel.text = @"JinXiuXian";
        return cell;
        
    }else{
        EMBAPersonalContentCell * contentCell = [[EMBAPersonalContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
        contentCell.titleContentLabel.text = _titleArray[indexPath.row-1];
        contentCell.contentLabel.text = _subArray[indexPath.row-1];
        
        return contentCell;
        
    }
    
    
}

#pragma mark - Click
- (void)endRightBarItem
{
//    Post
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
