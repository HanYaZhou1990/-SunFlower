//
//  EMBALoginViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-10-24.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBALoginViewController.h"

@interface EMBALoginViewController ()

@end

@implementation EMBALoginViewController

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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:imageView];
    
    _inputView = [[EMBALoginInputView alloc] initWithFrame:CGRectMake(26, self.view.bounds.size.height/2, 268, 92)];
    _inputView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_inputView];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(26, 400, 268, 46);
    [loginButton setBackgroundImage:[UIImage initWithColor:UIColorFromRGB(0x00b41a)] forState:UIControlStateNormal];
    loginButton.layer.cornerRadius = 46/2;
    loginButton.clipsToBounds = YES;
    loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:UIColorFromRGB(0xfefee4) forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}
#pragma mark -
#pragma mark Login button click -
- (void)loginButtonClicked:(UIButton *)sender{
//    http://www.vpengo.com/login?loginName=13598084041&password=123456
//    [WTRequestCenter postWithURL:@"http://www.vpengo.com/login" parameters:@{@"loginName":_inputView.userNameField.text,@"password":_inputView.userPswField.text} finished:^(NSURLResponse *response, NSData *data) {
//        NSDictionary *jsonDic = [WTRequestCenter JSONObjectWithData:data];
//        if (jsonDic[@"sessionId"]) {
            self.sideMenuViewController = [[TWTSideMenuViewController alloc] initWithMenuViewController:[EMBASettingsViewController new] mainViewController:[[UINavigationController alloc] initWithRootViewController:[EMBAMainViewController new]]];
            self.sideMenuViewController.shadowColor = [UIColor blackColor];
            self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
            self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
            [UIApplication sharedApplication].keyWindow.rootViewController = self.sideMenuViewController;
            
            
//            
//        }
//    } failed:^(NSURLResponse *response, NSError *error) {
//        NSLog(@"%@",error);
//    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
