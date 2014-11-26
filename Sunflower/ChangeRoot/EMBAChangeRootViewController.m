//
//  EMBAChangeRootViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAChangeRootViewController.h"
#import "EMBAAppDelegate.h"

@implementation EMBAChangeRootViewController

+ (UITabBarController *)loginSuccess{
    
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:[EMBAMainViewController new]];
    mainNav.navigationBar.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *schoolNav = [[UINavigationController alloc] initWithRootViewController:[EMBASchoolfellow_ViewController new]];
    
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:[EMBAMineViewController new]];
    
    UINavigationController *togetherNav = [[UINavigationController alloc] initWithRootViewController:[EMBATogetherViewController new]];
    
    
    [EMBAAppDelegate shareAppDelegate].tabBarController.viewControllers = @[mainNav,schoolNav,mineNav,togetherNav];
//    [EMBAAppDelegate shareAppDelegate].window.rootViewController = [EMBAAppDelegate shareAppDelegate].tabBarController;
    return [EMBAAppDelegate shareAppDelegate].tabBarController;
}
+ (void)loginOut{
    
}
@end
