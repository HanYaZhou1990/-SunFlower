//
//  EMBACreatSuccessViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBACreatSuccessViewController.h"

@interface EMBACreatSuccessViewController ()

@end

@implementation EMBACreatSuccessViewController

- (void)viewDidLoad {
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
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake((SCREEN_WIDTH-62)/2, 59, 62, 62);
    imageView.image = [UIImage imageNamed:@"success.png"];
    [self.view addSubview:imageView];
    
    
    UILabel *updateLabel = [[UILabel alloc] init];
    updateLabel.frame =CGRectMake(0, CGRectGetMaxY(imageView.frame)+22, SCREEN_WIDTH, 20);
    updateLabel.text = @"创建成功!";
    updateLabel.textColor = UIColorFromRGB(0x333333);
    updateLabel.font = [UIFont systemFontOfSize:15];
    updateLabel.textAlignment = NSTextAlignmentCenter;
    updateLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:updateLabel];
    
    UILabel *updateInfoLabel = [[UILabel alloc] init];
    updateInfoLabel.frame =CGRectMake(30, CGRectGetMaxY(updateLabel.frame)+15, SCREEN_WIDTH-60, 40);
    updateInfoLabel.text = @"您进入群后可以添加群成员";
    updateInfoLabel.textColor = UIColorFromRGB(0x999999);
    updateInfoLabel.font = [UIFont systemFontOfSize:12];
    updateInfoLabel.numberOfLines = 2;
    updateInfoLabel.textAlignment = NSTextAlignmentCenter;
    updateInfoLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:updateInfoLabel];
    
    UIButton *inButton = [UIButton buttonWithType:UIButtonTypeCustom];
    inButton.frame = CGRectMake(30, CGRectGetMaxY(updateInfoLabel.frame)+25, SCREEN_WIDTH-60, 44);
    [inButton addTarget:self action:@selector(inButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [inButton setBackgroundImage:[UIImage imageNamed:@"in.png"] forState:UIControlStateNormal];
    [self.view addSubview:inButton];
}

- (void)inButtonClicked:(UIButton *)sender{
    EMBAGroupDetailViewController *detailViewController = [[EMBAGroupDetailViewController alloc] init];
    detailViewController.title = @"郑州大学校友汇";
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}


@end
