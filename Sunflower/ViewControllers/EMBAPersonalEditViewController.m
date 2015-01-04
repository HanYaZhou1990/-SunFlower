//
//  EMBAPersonalEditViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-11.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAPersonalEditViewController.h"

@interface EMBAPersonalEditViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
{
    UITextField *signTextField;//签名
    UITextField *telephoneTextField;//电话
    UITextField *emailTextField;//邮箱
    UITextField *adressTextField;//地址
    UITextField *classTextField;//班级
    UIImageView *titleImgView;//头像
    
    UITextField *currentTextField;
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
    [self setLeftNavigationBar];
    self.title = @"金秀贤";
    
    _titleArray = @[@"电话",@"邮箱",@"地址",@"班级"];
    _subArray = @[@"18788899987",@"18788899987@123.com",@"中国河南郑州市",@"三年二班"];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:Nil action:@selector(endRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    [self.view addSubview:_tableView];
}

- (void)setLeftNavigationBar
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 44);
    
    [backButton setImage:[UIImage imageNamed:@"backButtonIcon.png"] forState:UIControlStateNormal];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);/***上／左／下／右***/
    [backButton setTitle:@"取消" forState:UIControlStateNormal];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(14, -8, 10, 0);
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
}

- (void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

//图片点击事件
-(void)tapMyDetailImg:(id)sender
{
   //切换头像
    [self pickImageFromAlbum];
}
#pragma -
#pragma mark 调用相机设置头像

- (void)pickImageFromAlbum
{
    UIActionSheet *sheet;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    else
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    [sheet showInView:self.view];
    
}
#pragma -
#pragma mark UIActionSheetDelegate

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255)
    {
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            
            switch (buttonIndex)
            {
                case 2:
                    // 取消
                    return;
                case 0:
                {
//                    //ios8访问权限
//                    if (([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending))
//                    {
//                        //判断ios8的相机访问权限
//                        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//                        if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
//                        {
//                            //无权限
//                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"无法拍照", nil)
//                                                                            message:NSLocalizedString(@"请在设备的'设置-隐私-相机'中允许访问相机。", nil)
//                                                                           delegate:nil
//                                                                  cancelButtonTitle:NSLocalizedString(@"确定", nil)
//                                                                  otherButtonTitles:nil];
//                            [alert show];
//                            return;
//                        }
//                        else if (authStatus ==AVAuthorizationStatusNotDetermined) //第一次使用，则会弹出是否打开权限
//                        {
//                            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted)
//                             {
//                                 if(granted)
//                                 {//点击允许访问时调用
//                                     //用户明确许可与否，媒体需要捕获，但用户尚未授予或拒绝许可。
//                                     // 相机
//                                     
//                                 }
//                                 else
//                                 {
//                                     //点击不允许时调用
//                                     return ;
//                                 }
//                             }];
//                        }
//                    }
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                }
                    break;
                    
                case 1:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else
        {
            if (buttonIndex == 1)
            {
                
                return;
            }
            else
            {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
//        imagePickerController.navigationBar.tintColor=[UIColor blackColor];
//        [imagePickerController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bar.png"] forBarMetrics:UIBarMetricsDefault];
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
    }
}

#pragma -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    [MBProgressHUD showHUDAddedToExt:self.view showMessage:NSLocalizedString(@"更新图片中...", nil) animated:YES];
    
    [picker dismissViewControllerAnimated:YES completion:
     ^{
         
         UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
         image = [self fixOrientation:image];
         
         titleImgView.image  = image;
         
         //上传头像
         [self upLoadHeadImageView:image];
         
     }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

//控制拍照图片的方向
- (UIImage *)fixOrientation:(UIImage *)aImage
{
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

#pragma -
#pragma mark 上传头像
-(void)upLoadHeadImageView:(UIImage *)image
{
    //压缩图片
    NSData *imageToSendData = UIImageJPEGRepresentation(image, 0.5);
    //发送上传图片请求
 
}
//保存头像文件
- (void)saveDataToCache:(NSData *)data witPath:(NSString *)cachePath
{
//    [MXSHelper createFolder:cachePath isDirectory:NO];
//    [data writeToFile:cachePath atomically:NO];
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
        titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 50, 50)];
        titleImgView.layer.cornerRadius = 25;
        titleImgView.clipsToBounds = YES;
        titleImgView.image  = [UIImage imageNamed:@"bg.png"];
        titleImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMyDetailImg:)];
        [titleImgView addGestureRecognizer:singleTap];
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
        
        UIView *smallLineView = [[UIView alloc]initWithFrame:CGRectMake(80, 45.5, SCREEN_WIDTH-80, 0.5)];
        smallLineView.backgroundColor = UIColorFromRGB(0xd9d9d9);
        [cell.contentView addSubview:smallLineView];
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 84.5, SCREEN_WIDTH, 0.5)];
        lineLabel.backgroundColor = UIColorFromRGB(0xd9d9d9);
        [cell.contentView addSubview:lineLabel];
    }
    else
    {
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 12, 40, 20)];
        leftLabel.font = [UIFont systemFontOfSize:13];
        leftLabel.text = [_titleArray objectAtIndex:indexPath.row-1];
        leftLabel.textColor = UIColorFromRGB(0x0681ff);
        [cell.contentView addSubview:leftLabel];
        
        UIImageView *titleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(55, 15, 14, 14)];
        titleImageView.image  = [UIImage imageNamed:@"userInfoIcon.png"];
        [cell.contentView addSubview:titleImageView];
        
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
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5)];
        lineLabel.backgroundColor = UIColorFromRGB(0xd9d9d9);
        [cell.contentView addSubview:lineLabel];
        if (indexPath.row==1)
        {
            textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            textField.returnKeyType = UIReturnKeyNext;
            [textField setPlaceholder:@"请输入您的电话号码"];
            telephoneTextField = textField;
        }
        else if (indexPath.row==2)
        {
            textField.keyboardType = UIKeyboardTypeEmailAddress;
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
            textField.returnKeyType = UIReturnKeyDone;
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

#pragma mark - keyboard monitor event
- (void)keyboardWasChange:(NSNotification *)aNotification
{
    NSString *str = [[UITextInputMode currentInputMode] primaryLanguage];
    NSLog(@"输入法：%@",str);
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSLog(@"keyboard's height:%f, screen_height is %f", kbSize.height, SCREEN_HEIGHT);
    
    CGFloat frameHeight = [currentTextField convertRect:currentTextField.bounds toView:_tableView].origin.y + currentTextField.frame.size.height + 64;
    [UIView animateWithDuration:[[aNotification.userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        if ((SCREEN_HEIGHT - kbSize.height - frameHeight) < 0)
        {
            _tableView.frame = CGRectMake(0, (SCREEN_HEIGHT - kbSize.height - frameHeight), _tableView.frame.size.width, _tableView.frame.size.height);
        }
        
    }completion:^(BOOL finished){
    }];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (currentTextField != textField)
    {
        currentTextField = textField;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.01 animations:^{
        _tableView.frame = CGRectMake(0, 0, _tableView.frame.size.width, _tableView.frame.size.height);
    }completion:^(BOOL finished){
        
    }];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}

//email失去焦点，键盘消失
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        
        return NO;
        
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
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
        [adressTextField becomeFirstResponder];
    }
    if (textField == adressTextField)
    {
        [classTextField becomeFirstResponder];
    }
    
    if (textField.returnKeyType == UIReturnKeyDone)
    {
        //完成请求
        [signTextField resignFirstResponder];
        [telephoneTextField resignFirstResponder];
        [emailTextField resignFirstResponder];
        [adressTextField resignFirstResponder];
        [classTextField resignFirstResponder];
        [self endRightBarItem];
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
    //发送请求 完成后 退出界面
    
    
    
    NSLog(@"完成编辑");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
