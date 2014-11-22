//
//  EMBASettingsViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-20.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASettingsViewController.h"

@interface EMBASettingsViewController ()
{
    NSArray *cellTextContents;
    NSArray *cellImages;
}
@end

@implementation EMBASettingsViewController

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
    
    cellTextContents = [[NSArray alloc] initWithObjects:@"我的收藏", @"系统设置", @"联系我们", @"关于", @"退出", nil];
    cellImages = [[NSArray alloc] initWithObjects:@"left_collect",@"left_systemsetting", @"left_contactus", @"left_about", @"left_logout", nil];
    CGFloat appScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat appScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    self.view.backgroundColor = UIColorFromRGB(0x353535);
    UITableView *leftBarTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, appScreenWidth, appScreenHeight - 20) style:UITableViewStylePlain];
    leftBarTableView.delegate = self;
    leftBarTableView.dataSource = self;
    leftBarTableView.showsHorizontalScrollIndicator = NO;
    leftBarTableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:leftBarTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
