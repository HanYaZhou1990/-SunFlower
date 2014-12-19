//
//  EMBAUserInfoViewController.m
//  Sunflower
//
//  Created by crystal on 14-11-22.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAUserInfoViewController.h"

@interface EMBAUserInfoViewController ()
{
    UIButton *_backButton;
    UILabel *_barlabel;
    
}
@end

@implementation EMBAUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftNavigationBarItem];
}

- (void)didReceiveMemoryWarning {
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
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
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

#pragma mark- TABLEVIEWDELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 85;
    }else{
        return 65;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.section == 0) {
            EMBAPersonalCell * cell = [[EMBAPersonalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
            cell.titleLabel.text = @"金秀贤";
            cell.titleLabel.textColor = UIColorFromRGB(0x333333);
            cell.detailLabel.text = @"汽车行业";
            cell.detailLabel.textColor = UIColorFromRGB(0x999999);
            cell.titleImgView.image  = [UIImage imageNamed:@"success.png"];
            return cell;
            
        }else{
            UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Nil];
            cell.textLabel.text = _titleArray[indexPath.row];
            cell.textLabel.textColor = UIColorFromRGB(0x999999);
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.detailTextLabel.text = _subArray[indexPath.row];
            cell.detailTextLabel.textColor = UIColorFromRGB(0x333333);
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
           return cell;
        }

}

- (void)editRightBarItem
{
    EMBAPersonalEditViewController * vc = [[EMBAPersonalEditViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -

@end
