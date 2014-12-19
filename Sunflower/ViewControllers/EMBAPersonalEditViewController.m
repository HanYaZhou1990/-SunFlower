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
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if (indexPath.row == 0)
    {
        UIImageView *titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 50, 50)];
        titleImgView.layer.cornerRadius = titleImgView.frame.size.width/2;
        titleImgView.image  = [UIImage imageNamed:@"bg.png"];
        [cell.contentView addSubview:titleImgView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, SCREEN_WIDTH-90, 20)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.text = @"金秀贤";
        titleLabel.textColor = UIColorFromRGB(0x333333);
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, SCREEN_WIDTH-90, 20)];
        detailLabel.font = [UIFont systemFontOfSize:13];
        detailLabel.text = @"汽车行业";
        detailLabel.textColor = UIColorFromRGB(0x999999);
        [cell addSubview:detailLabel];
        
        UIView *smallLineView = [[UIView alloc]initWithFrame:CGRectMake(75, 35, SCREEN_WIDTH-80, 1)];
        smallLineView.hidden = YES;
        [cell.contentView addSubview:smallLineView];
        
        UIView *longLineView = [[UIView alloc]initWithFrame:CGRectMake(3, 85, SCREEN_WIDTH-5, 1)];
        [cell.contentView addSubview:longLineView];
    }
    else
    {
       
    }
    
    return cell;
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
