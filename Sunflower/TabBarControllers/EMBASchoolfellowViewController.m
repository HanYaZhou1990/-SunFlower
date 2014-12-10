//
//  EMBASchoolfellowViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASchoolfellowViewController.h"
#import "EMBAClassesViewController.h"

@interface EMBASchoolfellow_ViewController ()
{
    NSMutableDictionary *_vcDic;
    int  _currentIndex;
    UIView *_contentView;
    NSArray *_classArray;
    
    UITableView *_tableView;
    
    BOOL isOpen[3];
}
@end


#define  CLASSTAG 1
#define  VOCATION 2
#define  SAME 3
@implementation EMBASchoolfellow_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"校友" image:[UIImage imageNamed:@"school_icon.png"] tag:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    UIImageView *segmentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 194, 29)];
    segmentImageView.center =  CGPointMake(self.view.center.x, 30);
    segmentImageView.tag = 10;
    segmentImageView.image = [UIImage imageNamed:@"班级.png"];
    segmentImageView.userInteractionEnabled = YES;
    [self.view addSubview:segmentImageView];
    
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+1;
        btn.frame = CGRectMake(i*65, 0, 65, 29);
        [btn addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
        [segmentImageView addSubview:btn];
    }
    
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0,55, 320, 568-55-49)];
    _contentView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_contentView];
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 568-55-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 130/2;
    [_contentView addSubview:_tableView];
    
//    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:0];
//
////    存对象用  封装联系人的对象 对象中存联系的信息
//    [dataArray addObject:];
    
    
    _classArray = @[@"2013届1班",@"2013届2班",@"2013届3班"];
    
    
}


- (void)menuClick:(UIButton *)btn
{
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:10];
    
    switch (btn.tag) {
        case CLASSTAG:
        {
        imageView.image = [UIImage imageNamed:@"班级.png"];
        }
            break;
        case VOCATION:
        {
        imageView.image = [UIImage imageNamed:@"行业.png"];
        }
            break;
        case SAME:
        {
        imageView.image = [UIImage imageNamed:@"同乡.png"];
        }
            break;
        default:
            break;
    }
    
}


#pragma 代理方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (isOpen[section]) {
        return 0;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
        {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 35, 35)];
        imageView.backgroundColor = [UIColor yellowColor];
        [cell addSubview:imageView];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 200, 35)];
        lab.backgroundColor = [UIColor redColor];
        [cell addSubview:lab];
        
        
        }
    
    
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor grayColor];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 30)];
    lab.text = [_classArray objectAtIndex:section];
    [view addSubview:lab];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn.frame =CGRectMake(280, 15, 20, 20);
    btn.tag = section;
    [btn addTarget:self action:@selector(openOrClose:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}


- (void)openOrClose:(UIButton *)btn
{
    isOpen[btn.tag] = !isOpen[btn.tag];
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
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
