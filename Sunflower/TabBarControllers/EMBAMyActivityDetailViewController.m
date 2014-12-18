//
//  EMBAMyActivityDetailViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyActivityDetailViewController.h"

@interface EMBAMyActivityDetailViewController ()

@end

@implementation EMBAMyActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*返回按钮*/
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 44);
    
    [backButton setImage:[UIImage imageNamed:@"backButtonIcon.png"] forState:UIControlStateNormal];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);/***上／左／下／右***/
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(14, -8, 10, 0);
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    UIBarButtonItem* collectBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"collect_bar_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    
    self.navigationItem.rightBarButtonItem = collectBarItem;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     UIColorFromRGB(0xFFFFFF), UITextAttributeTextColor,
                                                                     [UIFont systemFontOfSize:16.0], UITextAttributeFont,
                                                                     nil]];
    
    _activityDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStyleGrouped];
    _activityDetailTableView.dataSource = self;
    _activityDetailTableView.delegate = self;
    [_activityDetailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_activityDetailTableView  registerClass:[EMBAMyClassHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    _activityDetailTableView.tableFooterView = [UIView new];
    _activityDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_activityDetailTableView];
    
    _titleArray = @[@"活动名称",@"发起人/组织人",@"活动时间",@"活动地点",@"活动主题"];
    _contentArrary = @[@"市场经济分享会",@"郑州大学",@"周四 14:00-17:00",@"综合楼C栋 666",@"10月15-16日，第八届Granges技术研讨会在成都隆重举行，研讨会由Granges格朗吉斯（前撒拍）主办，西科沃克，索尔维化工，肖拉，森克路及撒拍精密管业－焊管业务等5家专注于铝热交换器生产配套的全球知名公司共同协办"];
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)barItemClick:(UIBarButtonItem *)barButtonItem{
    
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 4) {
        return [EMBACalculation height:_contentArrary[indexPath.section] widthOfFatherView:SCREEN_WIDTH-40 textFont:[UIFont systemFontOfSize:14]]+30;
    }else{
        return 65;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    EMBAMyClassHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    headerView.titleLable.text = _titleArray[section];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = UIColorFromRGB(0x333333);
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.firstLineHeadIndent = 6;//首行缩进
    style.headIndent = 6;//行首缩进
    if ([_contentArrary[indexPath.section] length]>0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[_contentArrary[indexPath.section] stringClearNull] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x666666)}];
        [cell.textLabel setAttributedText:attributedString];
    }else{}
    return cell;
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

@end
