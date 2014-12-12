//
//  EMBAPersonalViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-5.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAPersonalViewController.h"

@interface EMBAPersonalViewController ()

@end

@implementation EMBAPersonalViewController

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
    
    _titleArray = @[@"dianhua",@"youxiang",@"dizhi",@"banji"];
    _subArray = @[@"138......",@"23@123.com",@"zhongguohenanzhengzhou",@"sannianerban"];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"bianji" style:UIBarButtonItemStylePlain target:Nil action:@selector(editRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
	// Do any additional setup after loading the view.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


#pragma mark- TABLEVIEWDELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 4;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
    if (indexPath.section == 0) {
        
        cell.imageView.backgroundColor = [UIColor redColor];
        cell.textLabel.text = @"XXXXXX";
        cell.detailTextLabel.text = @"mmmmmmmmmmmmmmmmmmm";
        
        
        
        
        
        
        
        
    }else{
        
        cell.textLabel.text = _titleArray[indexPath.row];
        cell.detailTextLabel.text = _subArray[indexPath.row];
        
        
    }
    return cell;
}

- (void)editRightBarItem
{
    EMBAPersonalEditViewController * vc = [[EMBAPersonalEditViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
