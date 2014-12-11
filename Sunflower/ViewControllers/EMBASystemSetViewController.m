//
//  EMBASystemSetViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/10.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASystemSetViewController.h"

@interface EMBASystemSetViewController ()

@end

@implementation EMBASystemSetViewController

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
    
    /*返回按钮*/
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
    
    UILabel *titileLabel = [[UILabel alloc]init];
    titileLabel.text = @"设置";
    [titileLabel sizeToFit];
    titileLabel.font = [UIFont systemFontOfSize:16.0];
    titileLabel.textAlignment = NSTextAlignmentCenter;
    titileLabel.textColor = UIColorFromRGB(0xFFFFFF);
    self.navigationItem.titleView = titileLabel;
    
    _settingtableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _settingtableView.dataSource = self;
    _settingtableView.delegate = self;
    [_settingtableView registerClass:[EMBASystemSettingCell class] forCellReuseIdentifier:@"cell"];
    _settingtableView.backgroundColor = UIColorFromRGB(0xF6F6F6);
    _settingtableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _settingtableView.tableFooterView = [UIView new];
    [self.view addSubview:_settingtableView];
    
    _settingMenuAry = @[@{@"title":@"新消息提醒",@"rotTitle":@[@{@"name":@"接受新消息通知",@"type":@"0"},
                                                          @{@"name":@"声音",@"type":@"0"},
                                                          @{@"name":@"震动",@"type":@"0"}]},
                        @{@"title":@"聊天设置",@"rotTitle":@[@{@"name":@"汽车研究分享会",@"type":@"0"}]},
                        @{@"title":@"用户设置",@"rotTitle":@[@{@"name":@"清空缓存",@"type":@"1"},
                                                         @{@"name":@"更换账号",@"type":@"1"},
                                                         @{@"name":@"修改密码",@"type":@"1"}]}];
}

- (void)openButtonPressed:(UIButton *)sender
{
    self.sideMenuViewController = [[TWTSideMenuViewController alloc] initWithMenuViewController:[EMBASettingsViewController new] mainViewController:[EMBAChangeRootViewController loginSuccess]];
    self.sideMenuViewController.shadowColor = [UIColor blackColor];
    self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
    self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
    [UIApplication sharedApplication].keyWindow.rootViewController = self.sideMenuViewController;
}

#pragma mark -
#pragma mark UITableViewDatasource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _settingMenuAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_settingMenuAry[section][@"rotTitle"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMBASystemSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _settingMenuAry[indexPath.section][@"rotTitle"][indexPath.row][@"name"];
    cell.settingType = [_settingMenuAry[indexPath.section][@"rotTitle"][indexPath.row][@"type"] intValue];
    if(indexPath.section ==2 && indexPath.row == 2){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _settingMenuAry[section][@"title"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        UILabel *sectionTitleLable = [[UILabel alloc] init];
        sectionTitleLable.backgroundColor = [UIColor clearColor];
        sectionTitleLable.font = [UIFont systemFontOfSize:12];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        style.firstLineHeadIndent = 20;//首行缩进
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_settingMenuAry[section][@"title"] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x666666)}];
        [sectionTitleLable setAttributedText:attributedString];
        sectionTitleLable.layer.borderColor = [UIColorFromRGB(0xD9D9D9) CGColor];
        sectionTitleLable.layer.borderWidth = 0.5;
        
        return sectionTitleLable;
}

#pragma mark -
#pragma mark UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}
@end
