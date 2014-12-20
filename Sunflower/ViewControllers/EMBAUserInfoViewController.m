//
//  EMBAUserInfoViewController.m
//  Sunflower
//
//  Created by crystal on 14-11-22.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAUserInfoViewController.h"
#import <MessageUI/MessageUI.h>
@interface EMBAUserInfoViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>
{
    UIButton *_backButton;
    UILabel *_barlabel;
    NSString *telePhoneStr;
    NSString *emailStr;
    
}
@end

@implementation EMBAUserInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setLeftNavigationBarItem];
    
    telePhoneStr = @"15093296683";
    emailStr = @"710535238@qq.com";
    
}

- (void)didReceiveMemoryWarning
{
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
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(openButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    self.title = @"金秀贤";
    NSDictionary * attDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:15],UITextAttributeFont, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attDic];
    
    _titleArray = @[@"电话",@"邮箱",@"地址",@"班级"];
    _subArray = @[@"18877871122",@"18877871122@123.com",@"中国河南郑州",@"三年二班"];
    if (self.isUser==YES)
    {
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editRightBarItem)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    [self.view addSubview:_tableView];
    
}
- (void)openButtonPressed:(UIButton *)sender
{
    self.sideMenuViewController = [[TWTSideMenuViewController alloc] initWithMenuViewController:[EMBASettingsViewController new] mainViewController:[EMBAChangeRootViewController loginSuccess]];
    self.sideMenuViewController.shadowColor = [UIColor blackColor];
    self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
    self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
    [UIApplication sharedApplication].keyWindow.rootViewController = self.sideMenuViewController;
}
-(void)buttonClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag)
    {
        case 1000:
        {
            //打电话
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",telePhoneStr]]];
        }
            break;
        case 1001:
        {
            //发短信
            if([[UIDevice currentDevice].systemVersion floatValue] >= 4.0)
            {
                if([MFMessageComposeViewController canSendText])
                {
                    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
                    controller.messageComposeDelegate = self;
                    controller.recipients = [NSArray arrayWithObject:telePhoneStr];
                    
                    [self presentViewController:controller animated:YES completion:nil];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"出错了" message:@"您的设备不能发送短信" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
                    [alert show];
                }
            }
            else
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",telePhoneStr]]];
            }
        }
            break;
        case 1002:
        {
            //发邮件
            if([MFMailComposeViewController canSendMail])
            {
                MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
                
                controller.mailComposeDelegate = self;
                
                [controller setToRecipients:[NSArray arrayWithObject:emailStr]];
                [self presentViewController:controller animated:YES completion:nil];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"出错了" message:@"您还没有设置邮件账户" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
                
                [alert show];
                
            }
        }
            break;
        default:
            break;
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)erro
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


//发送消息按钮被点击
-(void)sendMessageButtonclicked:(id)sender
{
    NSLog(@"点击发消息");
}

#pragma mark- 
#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 85;
    }
    else
    {
        return 65;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        EMBAPersonalCell * cell = [[EMBAPersonalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
        cell.titleLabel.text = @"金秀贤";
        cell.titleLabel.textColor = UIColorFromRGB(0x333333);
        cell.detailLabel.text = @"汽车行业";
        cell.detailLabel.textColor = UIColorFromRGB(0x999999);
        cell.titleImgView.image  = [UIImage imageNamed:@"success.png"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else
    {
        UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Nil];
        cell.textLabel.frame = CGRectMake(10, 10, cell.frame.size.width-104, 15);
        cell.textLabel.text = _titleArray[indexPath.row];
        cell.textLabel.textColor = UIColorFromRGB(0x999999);
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.frame = CGRectMake(10, 35, cell.frame.size.width-20, 20);
        cell.detailTextLabel.text = _subArray[indexPath.row];
        cell.detailTextLabel.textColor = UIColorFromRGB(0x333333);
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64.5, SCREEN_WIDTH, 0.5)];
        lineLabel.backgroundColor = UIColorFromRGB(0xd9d9d9);
        [cell.contentView addSubview:lineLabel];
        if (self.isUser==NO)
        {
            if (indexPath.row==0)
            {
                UIButton *telephoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
                telephoneButton.frame = CGRectMake(cell.frame.size.width-104, (cell.frame.size.height-33)/2, 33, 33);
                [telephoneButton setImage:[UIImage imageNamed:@"icon-telephone.png"] forState:UIControlStateNormal];
                [telephoneButton setImage:[UIImage imageNamed:@"icon-telephone.png"] forState:UIControlStateHighlighted];
                [telephoneButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
                telephoneButton.tag = 1000;
                [cell addSubview:telephoneButton];
                
                UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
                messageButton.frame = CGRectMake(telephoneButton.frame.size.width+telephoneButton.frame.origin.x+17, (cell.frame.size.height-33)/2, 33, 33);
                [messageButton setImage:[UIImage imageNamed:@"icon-useMessage.png"] forState:UIControlStateNormal];
                [messageButton setImage:[UIImage imageNamed:@"icon-useMessage.png"] forState:UIControlStateHighlighted];
                [messageButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
                messageButton.tag = 1001;
                [cell addSubview:messageButton];
            }
            if (indexPath.row==1)
            {
                UIButton *emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
                emailButton.frame = CGRectMake(cell.frame.size.width-54, (cell.frame.size.height-33)/2, 33, 33);
                [emailButton setImage:[UIImage imageNamed:@"icon-email.png"] forState:UIControlStateNormal];
                [emailButton setImage:[UIImage imageNamed:@"icon-email.png"] forState:UIControlStateHighlighted];
                [emailButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
                emailButton.tag = 1002;
                [cell addSubview:emailButton];
            }
        }
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1)
    {
        if (self.isUser==NO)
        {
            return 85;
        }
    }
    return 0.5;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==1)
    {
        if (self.isUser==NO)
        {
            UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 85)];
            [footView setBackgroundColor:[UIColor clearColor]];
            
            
            UIButton *sendMessageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            sendMessageButton.frame = CGRectMake(25, 20, SCREEN_WIDTH-50, 45);
            [sendMessageButton setBackgroundImage:[UIImage initWithColor:UIColorFromRGB(0x00b41a)] forState:UIControlStateNormal];
            sendMessageButton.layer.cornerRadius = 46/2;
            sendMessageButton.clipsToBounds = YES;
            sendMessageButton.titleLabel.font = [UIFont systemFontOfSize:19];
            [sendMessageButton setTitle:@"发消息" forState:UIControlStateNormal];
            [sendMessageButton setTitleColor:UIColorFromRGB(0xfefee4) forState:UIControlStateNormal];
            [sendMessageButton addTarget:self action:@selector(sendMessageButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
            [footView addSubview:sendMessageButton];
            return footView;
        }
    }

    return nil;
}


- (void)editRightBarItem
{
    EMBAPersonalEditViewController * vc = [[EMBAPersonalEditViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -

@end
