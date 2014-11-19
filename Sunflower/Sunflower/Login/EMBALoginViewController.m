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
    
    EMBALoginInputView *inputView = [[EMBALoginInputView alloc] initWithFrame:CGRectMake(26, self.view.bounds.size.height/2, 268, 92)];
    inputView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:inputView];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(26, 400, 268, 46);
    [loginButton setBackgroundImage:[UIImage initWithColor:UIColorFromRGB(0x00b41a)] forState:UIControlStateNormal];
    loginButton.layer.cornerRadius = 46/2;
    loginButton.clipsToBounds = YES;
    loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:UIColorFromRGB(0xfefee4) forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
