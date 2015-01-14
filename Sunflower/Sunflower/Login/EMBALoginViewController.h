//
//  EMBALoginViewController.h
//  Sunflower
//
//  Created by hanyazhou on 14-10-24.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"
#import "EMBALoginInputView.h"
#import "EMBAMainViewController.h"
#import "TWTSideMenuViewController.h"
#import "EMBASettingsViewController.h"
#import "EMBAChangeRootViewController.h"

#import "EaseMob.h"
#import "MBProgressHUD+Add.h"

@interface EMBALoginViewController : EMBAFatherViewController<IChatManagerDelegate>

@property (nonatomic, strong) EMBALoginInputView *inputView;
@property (strong, nonatomic) TWTSideMenuViewController *sideMenuViewController;

@end
