//
//  EMBASettingsViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-20.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASettingsViewController.h"
#import "EMBAUserInfoViewController.h"

@interface EMBASettingsViewController ()
{
    NSArray *_cellTextContents;
    NSArray *_cellImages;
}
@end

@implementation EMBASettingsViewController

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
    
    _cellTextContents = [[NSArray alloc] initWithObjects:@"我的收藏", @"系统设置", @"联系我们", @"关于", @"退出", nil];
    _cellImages = [[NSArray alloc] initWithObjects:@"left_collect",@"left_systemsetting", @"left_contactus", @"left_about", @"left_logout", nil];
    
    self.view.backgroundColor = UIColorFromRGB(0x353535);
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage initWithColor:UIColorFromRGB(0x353535)]];
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGRect imageViewRect = [[UIScreen mainScreen] bounds];
    imageViewRect.size.width += 589;
    backgroundImageView.frame = imageViewRect;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:backgroundImageView];
    
    UITableView *leftBarTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20) style:UITableViewStyleGrouped];
    leftBarTableView.delegate = self;
    leftBarTableView.dataSource = self;
    leftBarTableView.backgroundColor = [UIColor clearColor];
    leftBarTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    leftBarTableView.showsHorizontalScrollIndicator = NO;
    leftBarTableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:leftBarTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"leftBarCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.imageView.image = [UIImage imageNamed:_cellImages[indexPath.row]];
    cell.textLabel.text = _cellTextContents[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    cell.textLabel.textColor = UIColorFromRGB(0xa09e9e);
    cell.backgroundColor = [UIColor clearColor];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 49.5f, SCREEN_WIDTH, 0.5f)];
    lineLabel.backgroundColor = RGBA(70, 70, 70, 1);
    [cell addSubview:lineLabel];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *sectionHeaderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sectionHeaderBtn addTarget:self action:@selector(sectionheaderClicked) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *myselfAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 50, 50)];
    myselfAvatar.image = [UIImage imageNamed:@"iOS-defaultHead0"];
    myselfAvatar.layer.cornerRadius = 25;
    myselfAvatar.layer.masksToBounds = YES;
    [sectionHeaderBtn addSubview:myselfAvatar];
    
    UILabel *myselfName = [[UILabel alloc] initWithFrame:CGRectMake(myselfAvatar.frame.origin.x + myselfAvatar.frame.size.width + 17, 40, 150, 20)];
    myselfName.textColor = UIColorFromRGB(0xffffff);
    myselfName.font = [UIFont boldSystemFontOfSize:15.0f];
    myselfName.text = @"金秀贤";
    [sectionHeaderBtn addSubview:myselfName];
    
    /*UILable:UIView  所以如果是同样的效果，我会选择使用UIView*/
    UIView *separationLine = [[UIView alloc] initWithFrame:CGRectMake(0, 99.5, SCREEN_WIDTH, 0.5)];
    separationLine.backgroundColor = RGBA(70, 70, 70, 1);
    [sectionHeaderBtn addSubview:separationLine];
    
    return sectionHeaderBtn;
}


#pragma mark - UITableView sectionHeader点击事件
- (void)sectionheaderClicked
{
    NSLog(@"昵称点击");
    EMBAUserInfoViewController *uiVC = [[EMBAUserInfoViewController alloc] init];
    uiVC.isUser = YES;
    UINavigationController *userInfoVC = [[UINavigationController alloc] initWithRootViewController:uiVC];
    [self.sideMenuViewController setMainViewController:userInfoVC animated:YES closeMenu:YES];
}

#pragma mark -
#pragma mark UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
        /*我的收藏*/
        UINavigationController *myCollectionVC = [[UINavigationController alloc] initWithRootViewController:[[EMBAMyCollectionViewController alloc] init]];
        [self.sideMenuViewController setMainViewController:myCollectionVC animated:YES closeMenu:YES];
        }
            break;
        case 1:
        {
        /*系统设置*/
        UINavigationController *systemSetVC = [[UINavigationController alloc] initWithRootViewController:[[EMBASystemSetViewController alloc] init]];
        [systemSetVC.navigationBar setTitleTextAttributes:@{UIColorFromRGB(0xF0F0F0): UITextAttributeTextColor}];
        [self.sideMenuViewController setMainViewController:systemSetVC animated:YES closeMenu:YES];
        }
            break;
        case 2:
        {
        /*联系我们*/
        UINavigationController *contactUsVC = [[UINavigationController alloc] initWithRootViewController:[[EMBAContactUsViewController alloc] init]];
        [self.sideMenuViewController setMainViewController:contactUsVC animated:YES closeMenu:YES];
        }
            break;
        case 3:
        {
        /*关于*/
        UINavigationController *aboutUsVC = [[UINavigationController alloc] initWithRootViewController:[[EMBAAboutViewController alloc] init]];
        [self.sideMenuViewController setMainViewController:aboutUsVC animated:YES closeMenu:YES];
        }
            break;
        case 4:
        {
        /*退出*/
        
        }
            break;
            
            
        default:
            break;
    }
}

@end
