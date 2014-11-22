//
//  EMBAUserInfoViewController.m
//  Sunflower
//
//  Created by crystal on 14-11-22.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAUserInfoViewController.h"

@interface EMBAUserInfoViewController ()
{
    UIButton *_backButton;
    UILabel *_barlabel;
}
@end

@implementation EMBAUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftNavigationBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setLeftNavigationBarItem
{
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(0, 0, 170, 26);
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backButtonIcon.png"] highlightedImage:[UIImage imageNamed:@"backButtonIcon.png"]];
    imageview.frame = CGRectMake(0, 0, 24, 24);
    _barlabel = [[UILabel alloc] initWithFrame:CGRectMake(29, 0, 130, 26)];;
    [_barlabel setFont:[UIFont boldSystemFontOfSize:20]];
    [_barlabel setTextColor:[UIColor whiteColor]];
    [_barlabel setText:@"返回"];
    [_barlabel setBackgroundColor:[UIColor clearColor]];
    [_backButton addSubview:imageview];
    [_backButton addSubview:_barlabel];
    [_backButton addTarget:self action:@selector(popPreViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)popPreViewController
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
