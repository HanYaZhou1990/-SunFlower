//
//  EMBAMessageViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/8.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMessageViewController.h"

@interface EMBAMessageViewController ()

@end

@implementation EMBAMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)leftBarItem{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 44);

    [backButton setImage:[UIImage imageNamed:@"backButtonIcon.png"] forState:UIControlStateNormal];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);/***上／左／下／右***/
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(14, -8, 10, 0);
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=leftBarButton;
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self leftBarItem];
    
    _messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _messageTableView.dataSource = self;
    _messageTableView.delegate = self;
    [_messageTableView registerClass:[EMBAMessageCell class] forCellReuseIdentifier:@"cell"];
    _messageTableView.tableFooterView = [UIView new];
    [self.view addSubview:_messageTableView];
}

#pragma mark -
#pragma mark UITableViewDatasource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPathP {
    EMBAMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPathP];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPathP.row];
    return cell;
}

#pragma mark -
#pragma mark Memory Warning -
- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}

@end
