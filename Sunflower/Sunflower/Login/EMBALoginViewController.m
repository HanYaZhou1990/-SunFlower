//
//  EMBALoginViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-10-24.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBALoginViewController.h"
#import "EMBAForgetPwdViewController.h"
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
    
    /*最下边的签名*/
    UILabel *signatureLable = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    signatureLable.text = @"2014@EMBA设计团队";
    signatureLable.font = [UIFont systemFontOfSize:11];
    signatureLable.textAlignment = NSTextAlignmentCenter;
    signatureLable.textColor = UIColorFromRGB(0x939393);
    [self.view addSubview:signatureLable];
    
    /*两个输入框统一放到了一个view上*/
    _inputView = [[EMBALoginInputView alloc] initWithFrame:CGRectMake(26, SCREEN_HEIGHT/2-22, 268, 92)];
    _inputView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_inputView];
    
    /***登录***/
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(26, CGRectGetMaxY(_inputView.frame) + 20, 268, 46);
    [loginButton setBackgroundImage:[UIImage initWithColor:UIColorFromRGB(0x00b41a)] forState:UIControlStateNormal];
    loginButton.layer.cornerRadius = 46/2;
    loginButton.clipsToBounds = YES;
    loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:UIColorFromRGB(0xfefee4) forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    UIButton *forgetPwd = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwd.frame = CGRectMake((SCREEN_WIDTH-100)/2, CGRectGetMaxY(loginButton.frame)+10, 100, 40);
    forgetPwd.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetPwd setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetPwd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetPwd addTarget:self action:@selector(forgetPwdButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwd];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark -
#pragma mark  button click -
- (void)loginButtonClicked:(UIButton *)sender{
        //    http://www.vpengo.com/login?loginName=13598084041&password=123456
    [WTRequestCenter postWithURL:@"http://www.vpengo.com/login" parameters:@{@"loginName":_inputView.userNameField.text,@"password":_inputView.userPswField.text} finished:^(NSURLResponse *response, NSData *data) {
        NSDictionary *jsonDic = [WTRequestCenter JSONObjectWithData:data];
        if (jsonDic[@"sessionId"]) {
            
            [[NSUserDefaults standardUserDefaults] setObject:jsonDic[@"sessionId"] forKey:@"sessionId"];
            [[NSUserDefaults standardUserDefaults] setObject:jsonDic[@"user"] forKey:@"userMessage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            self.sideMenuViewController = [[TWTSideMenuViewController alloc] initWithMenuViewController:[EMBASettingsViewController new] mainViewController:[EMBAChangeRootViewController loginSuccess]];
            self.sideMenuViewController.shadowColor = [UIColor blackColor];
            self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
            self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
            [UIApplication sharedApplication].keyWindow.rootViewController = self.sideMenuViewController;
            
        }
    } failed:^(NSURLResponse *response, NSError *error) {
        NSLog(@"%@",error);
    }];
}
//忘记密码
- (void)forgetPwdButtonClicked:(UIButton *)sender
{
    EMBAForgetPwdViewController *fpVC = [[EMBAForgetPwdViewController alloc]init];
    [self.navigationController pushViewController:fpVC animated:NO];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:username
                                                        password:password
                                                      completion:
     ^(NSDictionary *loginInfo, EMError *error) {
         if (loginInfo && !error) {
             [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
             NSLog(@"success   %@ ",loginInfo);
         }else {
             switch (error.errorCode) {
                 case EMErrorServerNotReachable:
                     NSLog(@"连接服务器失败!");
                     break;
                 case EMErrorServerAuthenticationFailure:
                     NSLog(@"用户名或密码错误");
                     break;
                 case EMErrorServerTimeout:
                     NSLog(@"连接服务器超时!");
                     break;
                 default:
                     NSLog(@"登录失败");
                     break;
             }
         }
     } onQueue:nil];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
