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
    self.title = @"金秀贤";
    
    _titleArray = @[@"电话",@"邮箱",@"地址",@"班级"];
    _subArray = @[@"18788899987",@"18788899987@123.com",@"中国河南郑州市",@"三年二班"];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:Nil action:@selector(endRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

#pragma mark- TABLEVIEWDELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        EMBAPersonalCell * cell = [[EMBAPersonalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
        cell.titleLabel.text = @"金秀贤";
        cell.detailLabel.text = @"汽";
        cell.titleImgView.image = [UIImage imageNamed:@"success.png"];
        cell.smallLineView.hidden = NO;
        cell.longLineView.hidden = NO;
        cell.deleteButton.hidden = NO;
        return cell;
        
    }
    else
    {
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
