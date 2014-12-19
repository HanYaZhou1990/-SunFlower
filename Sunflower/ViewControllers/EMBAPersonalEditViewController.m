//
//  EMBAPersonalEditViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-11.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAPersonalEditViewController.h"

@interface EMBAPersonalEditViewController ()<UITextFieldDelegate>
{
    UITextField *signTextField;//签名
    UITextField *telephoneTextField;//电话
    UITextField *emailTextField;//邮箱
    UITextField *adressTextField;//地址
    UITextField *classTextField;//班级
    
}
@end

@implementation EMBAPersonalEditViewController

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
    self.title = @"金秀贤";
    
    _titleArray = @[@"电话",@"邮箱",@"地址",@"班级"];
    _subArray = @[@"18788899987",@"18788899987@123.com",@"中国河南郑州市",@"三年二班"];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:Nil action:@selector(endRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

#pragma mark- 
#pragma mark- UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 0)
    {
        UIImageView *titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 50, 50)];
        titleImgView.layer.cornerRadius = 25;
        titleImgView.clipsToBounds = YES;
        titleImgView.image  = [UIImage imageNamed:@"bg.png"];
        [cell.contentView addSubview:titleImgView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, SCREEN_WIDTH-90, 20)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.text = @"金秀贤";
        titleLabel.textColor = UIColorFromRGB(0x333333);
        [cell.contentView addSubview:titleLabel];
        
        signTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 55, SCREEN_WIDTH-90, 20)];
        signTextField.tag = 100+indexPath.row;
        signTextField.borderStyle = UITextBorderStyleNone;//无边框
        signTextField.font = [UIFont systemFontOfSize:14];
        signTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//在编辑时出现x按钮
        signTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否自动纠错
        signTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;//首字母是否自动大写
        signTextField.keyboardType = UIKeyboardTypeDefault;
        [signTextField setDelegate:self];
        signTextField.returnKeyType = UIReturnKeyNext;
        [signTextField setPlaceholder:@"请输入简介"];
        [cell.contentView addSubview:signTextField];
        
        UIView *smallLineView = [[UIView alloc]initWithFrame:CGRectMake(80, 45, SCREEN_WIDTH-90, 1)];
        smallLineView.backgroundColor = UIColorFromRGB(0xd9d9d9);
        [cell.contentView addSubview:smallLineView];
    }
    else
    {
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 12, 40, 20)];
        leftLabel.font = [UIFont systemFontOfSize:16];
        leftLabel.text = [_titleArray objectAtIndex:indexPath.row-1];
        leftLabel.textColor = UIColorFromRGB(0x0681ff);
        [cell.contentView addSubview:leftLabel];
        
        UIImageView *titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(55, 15, 14, 14)];
        titleImgView.image  = [UIImage imageNamed:@"userInfoIcon.png"];
        [cell.contentView addSubview:titleImgView];
        
        UILabel *lineLabelOne = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 1, 24)];
        lineLabelOne.backgroundColor = UIColorFromRGB(0xd9d9d9);
        [cell.contentView addSubview:lineLabelOne];
 
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 12, SCREEN_WIDTH-100, 20)];
        textField.tag = 100+indexPath.row;
        textField.borderStyle = UITextBorderStyleNone;//无边框
        textField.font = [UIFont systemFontOfSize:14];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;//在编辑时出现x按钮
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;//首字母是否自动大写
        [textField setDelegate:self];
        [cell.contentView addSubview:textField];
        if (indexPath.row==1)
        {
            textField.keyboardType = UIKeyboardTypeNumberPad;
            textField.returnKeyType = UIReturnKeyNext;
            [textField setPlaceholder:@"请输入您的电话号码"];
            telephoneTextField = textField;
        }
        else if (indexPath.row==2)
        {
            textField.keyboardType = UIKeyboardTypeDefault;
            textField.returnKeyType = UIReturnKeyNext;
            [textField setPlaceholder:@"请输入您的邮箱"];
            emailTextField = textField;
        }
        else if (indexPath.row==3)
        {
            textField.keyboardType = UIKeyboardTypeDefault;
            textField.returnKeyType = UIReturnKeyNext;
            [textField setPlaceholder:@"请输入您的地址"];
            adressTextField = textField;
        }
        else if (indexPath.row==4)
        {
            textField.keyboardType = UIKeyboardTypeDefault;
            textField.returnKeyType = UIReturnKeyGo;
            [textField setPlaceholder:@"请输入您的班级"];
            classTextField = textField;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 85;
    }
    else
    {
        return 44;
    }
}

#pragma mark - CustomFunction

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [signTextField resignFirstResponder];
    [telephoneTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [adressTextField resignFirstResponder];
    [classTextField resignFirstResponder];
   
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   
}

//email失去焦点，键盘消失
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        //实现按键切换
        if (textField == signTextField)
        {
            [telephoneTextField becomeFirstResponder];
        }
        if (textField == telephoneTextField)
        {
            [emailTextField becomeFirstResponder];
        }
        if (textField == emailTextField)
        {
            [classTextField becomeFirstResponder];
        }
        return NO;
        
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField.returnKeyType == UIReturnKeyGo)
    {
        //完成请求
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    textField.text = @"";
    return YES;
}

#pragma mark - Click
- (void)endRightBarItem
{
//    Post
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
