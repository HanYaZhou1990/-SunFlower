//
//  EMBAChangeRootViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMBAMainViewController.h"
#import "EMBASchoolfellowViewController.h"
#import "EMBAMineViewController.h"
#import "EMBATogetherViewController.h"

@class EMBAAppDelegate;

@interface EMBAChangeRootViewController : NSObject

+ (UITabBarController *)loginSuccess;
+ (void)loginOut;

@end
