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
}


- (void)setLeftNavigationBarItem
{
    /*
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
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;*/
    /*
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    */
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 44);
    
    [backButton setImage:[UIImage imageNamed:@"backButtonIcon.png"] forState:UIControlStateNormal];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);/***上／左／下／右***/
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(14, -8, 10, 0);
    [backButton addTarget:self action:@selector(openButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
}
- (void)openButtonPressed
{
    self.sideMenuViewController = [[TWTSideMenuViewController alloc] initWithMenuViewController:[EMBASettingsViewController new] mainViewController:[EMBAChangeRootViewController loginSuccess]];
    self.sideMenuViewController.shadowColor = [UIColor blackColor];
    self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
    self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
    [UIApplication sharedApplication].keyWindow.rootViewController = self.sideMenuViewController;
}

@end
