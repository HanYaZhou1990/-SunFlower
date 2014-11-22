//
//  EMBAForgetPwdViewController.m
//  Sunflower
//
//  Created by julong on 14/11/22.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAForgetPwdViewController.h"
#import "EMBALoginViewController.h"
@interface EMBAForgetPwdViewController ()
{
    UIView *editView;//编辑页面
    UIButton *rightButton;
    
    UITextField *realNameTextField;//真实姓名
    UITextField *embaClassTextField;//班级
    UITextField *phoneTextField;//联系电话
    
    UIView *finishView;//完成页面
    
}
@end

@implementation EMBAForgetPwdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"忘记密码";
    
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    [self setLeftBarItem];
    [self setRightBarItem];
    [self setEditView];
    [self setUpdateFinishView];
    
    // Do any additional setup after loading the view.
}

-(void)setLeftBarItem
{
    //设置uinavigationbar button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 100, 26);
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backButtonIcon.png"]];
    imageview.frame = CGRectMake(0, 0, 24, 24);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(24, 0, 60, 26)];
    [label setFont:[UIFont systemFontOfSize:18]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"返回"];
    [label setBackgroundColor:[UIColor clearColor]];
    [backButton addSubview:imageview];
    [backButton addSubview:label];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=leftBarButton;
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)setRightBarItem
{
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 39, 19);
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBar;
}
-(void)rightBarAction
{
//    NSLog(@"提交");//发送请求 完成后切换界面
    
    rightButton.hidden = YES;
    editView.hidden = YES;
    finishView.hidden = NO;
    
}

-(void)setEditView
{
    editView = [[UIView alloc] initWithFrame:CGRectMake(0, 19.5, SCREEN_WIDTH, 152)];
    editView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:editView];
    
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.frame =CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    lineLabel.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [editView addSubview:lineLabel];
    
    
    UILabel *realNameLabel = [[UILabel alloc] init];
    realNameLabel.frame =CGRectMake(20, 0.5, 90, 50);
    realNameLabel.text = @"真实姓名";
    realNameLabel.textAlignment = NSTextAlignmentLeft;
    realNameLabel.textColor = UIColorFromRGB(0x666666);
    realNameLabel.backgroundColor = [UIColor clearColor];
    [editView addSubview:realNameLabel];
    
    realNameTextField = [[UITextField alloc] init];
    realNameTextField.frame = CGRectMake(realNameLabel.frame.size.width+realNameLabel.frame.origin.x, realNameLabel.frame.origin.y, SCREEN_WIDTH-(realNameLabel.frame.size.width+realNameLabel.frame.origin.x+10), 50);
    realNameTextField.font = [UIFont systemFontOfSize:16];
    realNameTextField.textAlignment = NSTextAlignmentLeft;
    realNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    realNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [realNameTextField setPlaceholder:@"请输入真实姓名"];
    realNameTextField.returnKeyType =UIReturnKeyNext;
    realNameTextField.backgroundColor = [UIColor clearColor];
    realNameTextField.delegate = self;
    [editView addSubview:realNameTextField];
    
    UILabel *lineLabel2 = [[UILabel alloc] init];
    lineLabel2.frame =CGRectMake(20, 50.5, SCREEN_WIDTH-20, 0.5);
    lineLabel2.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [editView addSubview:lineLabel2];
    
    
    UILabel *embaClassLabel = [[UILabel alloc] init];
    embaClassLabel.frame =CGRectMake(20, 51, 90, 50);
    embaClassLabel.text = @"EMBA班级";
    embaClassLabel.textAlignment = NSTextAlignmentLeft;
    embaClassLabel.textColor = UIColorFromRGB(0x666666);
    embaClassLabel.backgroundColor = [UIColor clearColor];
    [editView addSubview:embaClassLabel];
    
    embaClassTextField = [[UITextField alloc] init];
    embaClassTextField.frame = CGRectMake(embaClassLabel.frame.size.width+embaClassLabel.frame.origin.x, embaClassLabel.frame.origin.y, SCREEN_WIDTH-(embaClassLabel.frame.size.width+embaClassLabel.frame.origin.x+10), 50);
    embaClassTextField.font = [UIFont systemFontOfSize:16];
    embaClassTextField.textAlignment = NSTextAlignmentLeft;
    embaClassTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    embaClassTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [embaClassTextField setPlaceholder:@"请输入您的班级"];
    embaClassTextField.returnKeyType =UIReturnKeyNext;
    embaClassTextField.backgroundColor = [UIColor clearColor];
    embaClassTextField.delegate = self;
    [editView addSubview:embaClassTextField];
    
    UILabel *lineLabel3 = [[UILabel alloc] init];
    lineLabel3.frame =CGRectMake(20, 101, SCREEN_WIDTH-20, 0.5);
    lineLabel3.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [editView addSubview:lineLabel3];
    
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.frame =CGRectMake(20, 101.5, 90, 50);
    phoneLabel.text = @"联系电话";
    phoneLabel.textAlignment = NSTextAlignmentLeft;
    phoneLabel.textColor = UIColorFromRGB(0x666666);
    phoneLabel.backgroundColor = [UIColor clearColor];
    [editView addSubview:phoneLabel];
    
    phoneTextField = [[UITextField alloc] init];
    phoneTextField.frame = CGRectMake(phoneLabel.frame.size.width+phoneLabel.frame.origin.x, phoneLabel.frame.origin.y, SCREEN_WIDTH-(phoneLabel.frame.size.width+phoneLabel.frame.origin.x+10), 50);
    phoneTextField.font = [UIFont systemFontOfSize:16];
    phoneTextField.textAlignment = NSTextAlignmentLeft;
    phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    phoneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [phoneTextField setPlaceholder:@"请输入您的联系电话"];
    phoneTextField.returnKeyType =UIReturnKeyDone;
    phoneTextField.backgroundColor = [UIColor clearColor];
    phoneTextField.delegate = self;
    [editView addSubview:phoneTextField];
    
    UILabel *lineLabel4 = [[UILabel alloc] init];
    lineLabel4.frame =CGRectMake(0, 151.5, SCREEN_WIDTH, 0.5);
    lineLabel4.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [editView addSubview:lineLabel4];
    
    
}

-(void)setUpdateFinishView
{
    finishView = [[UIView alloc] initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 163)];
    finishView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:finishView];
    finishView.hidden = YES;
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake((SCREEN_WIDTH-62)/2, 0, 62, 62);
    imageView.image = [UIImage imageNamed:@"success.png"];
    [finishView addSubview:imageView];
    
    
    UILabel *updateLabel = [[UILabel alloc] init];
    updateLabel.frame =CGRectMake(0, 88, SCREEN_WIDTH, 20);
    updateLabel.text = @"信息提交成功";
    updateLabel.textColor = UIColorFromRGB(0x333333);
    updateLabel.font = [UIFont systemFontOfSize:15];
    updateLabel.textAlignment = NSTextAlignmentCenter;
    updateLabel.backgroundColor = [UIColor clearColor];
    [finishView addSubview:updateLabel];
    
    UILabel *updateInfoLabel = [[UILabel alloc] init];
    updateInfoLabel.frame =CGRectMake(30, 123, SCREEN_WIDTH-60, 40);
    updateInfoLabel.text = @"我们将在收到您的提交信息后与您取得了联系确认身分后，与您重新设置新密码";
    updateInfoLabel.textColor = UIColorFromRGB(0x999999);
    updateInfoLabel.font = [UIFont systemFontOfSize:12];
    updateInfoLabel.numberOfLines = 2;
    updateInfoLabel.textAlignment = NSTextAlignmentCenter;
    updateInfoLabel.backgroundColor = [UIColor clearColor];
    [finishView addSubview:updateInfoLabel];
    
    
}

//email失去焦点，键盘消失
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([string isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        //实现按键切换
        if (textField == realNameTextField)
        {
            [embaClassTextField becomeFirstResponder];
        }
        if (textField == embaClassTextField)
        {
            [phoneTextField becomeFirstResponder];
        }
        if (textField == phoneTextField)
        {
            [textField resignFirstResponder];
           //提交
        }
        
        return NO;
        
    }
    
    return YES;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
