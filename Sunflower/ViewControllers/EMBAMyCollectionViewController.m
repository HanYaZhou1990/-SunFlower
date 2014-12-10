//
//  EMBAMyCollectionViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/10.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyCollectionViewController.h"

@interface EMBAMyCollectionViewController ()

@end

@implementation EMBAMyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xF6F6F6);
    
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
    
    /*为了方便，直接复制上边的代码了,可以完善*/
    UIButton *titleView = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleView setImage:[UIImage imageNamed:@"collect_bar_icon.png"] forState:UIControlStateNormal];
    titleView.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);/***上／左／下／右***/
    [titleView setTitle:@"我的收藏" forState:UIControlStateNormal];
    titleView.contentEdgeInsets = UIEdgeInsetsMake(14, -8, 10, 0);
    [titleView setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [titleView setBackgroundColor:[UIColor redColor]];
    
    self.navigationItem.titleView = titleView;
    
    
    _segumentView = [[EMBASegumentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) btnInformation:@[
            @[@"消息",@"消息"],
            @[@"校友",@"校友"],
            @[@"我",@"我"],
            @[[NSString stringWithFormat:@"%d",0],[UIImage initWithColor:UIColorFromRGB(0xF6F6F6)]]]];
    _segumentView.delegate = self;
    
    _selectIndex = 0;
    
    _collectionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _collectionTableView.dataSource = self;
    _collectionTableView.delegate = self;
    [_collectionTableView registerClass:[EMBACollectionCell class] forCellReuseIdentifier:@"cell"];
    [_collectionTableView registerClass:[EMBAMainCell class] forCellReuseIdentifier:@"messageCell"];
    _collectionTableView.backgroundColor = UIColorFromRGB(0xF6F6F6);
    _collectionTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _collectionTableView.tableFooterView = [UIView new];
    [self.view addSubview:_collectionTableView];
    
    _informationAry = @[@{@"title":@"课题",@"rowTitleArray":@[@"市场经济学",@"宏观经济学",@"调研分析与研究"]},@{@"title":@"活动",@"rowTitleArray":@[@"汽车研究分享会",@"汽车展览会",@"汽车调研会"]}];
    _messageAry = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    
}

- (void)openButtonPressed:(UIButton *)sender{
    self.sideMenuViewController = [[TWTSideMenuViewController alloc] initWithMenuViewController:[EMBASettingsViewController new] mainViewController:[EMBAChangeRootViewController loginSuccess]];
    self.sideMenuViewController.shadowColor = [UIColor blackColor];
    self.sideMenuViewController.edgeOffset = (UIOffset) { .horizontal = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 18.0f : 0.0f };
    self.sideMenuViewController.zoomScale = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 0.5634f : 0.85f;
    [UIApplication sharedApplication].keyWindow.rootViewController = self.sideMenuViewController;
}

#pragma mark -
#pragma mark UITableViewDatasource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_selectIndex == 0) {
        return 1;
    }else if (_selectIndex == 1){
        return 1;
    }else{
        return _informationAry.count+1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_selectIndex == 0) {
        if (section == 0) {
            return 44;
        }
        return 0;
    }else if (_selectIndex == 1){
        if (section == 0) {
            return 44;
        }
        return 0;
    }else{
        if (section == 0) {
            return 44;
        }
        return 35;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_selectIndex == 0) {
        return 10;
    }else if (_selectIndex == 1){
        return 0;
    }else{
        if (section==0) {
            return 0;
        }else{
            return [_informationAry[section-1][@"rowTitleArray"] count];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectIndex == 0) {
        return 64;
    }else if (_selectIndex == 1){
        return 0;
    }else{
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectIndex == 0) {
        EMBAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
        cell.firstImageView.hidden = YES;
        cell.numberLable.hidden = YES;
        return cell;
    }else if (_selectIndex == 1){
        return nil;
    }else{
        if (indexPath.section == 0) {
            return nil;
        }else{
            EMBACollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            cell.textLabel.text = _informationAry[indexPath.section - 1][@"rowTitleArray"][indexPath.row];
            return cell;
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (_selectIndex == 0) {
        return nil;
    }else if (_selectIndex == 1){
        return nil;
    }else{
        return _informationAry[section-1][@"title"];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return _segumentView;
    }else{
        if (_selectIndex == 0) {
            return nil;
        }else if (_selectIndex == 1){
            return nil;
        }else{
            UILabel *sectionTitleLable = [[UILabel alloc] init];
            sectionTitleLable.backgroundColor = [UIColor clearColor];
            sectionTitleLable.font = [UIFont systemFontOfSize:12];
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
            style.firstLineHeadIndent = 20;//首行缩进
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_informationAry[section-1][@"title"] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x666666)}];
            [sectionTitleLable setAttributedText:attributedString];
            sectionTitleLable.layer.borderColor = [UIColorFromRGB(0xD9D9D9) CGColor];
            sectionTitleLable.layer.borderWidth = 0.5;
            
            return sectionTitleLable;
        }
    }
}

#pragma mark -
#pragma mark UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -
#pragma mark EMBASegumentViewDelegate -
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton{
    if (indexOfButton == 0) {
        [(UIImageView *)[_collectionTableView viewWithTag:10086] removeFromSuperview];
        _collectionTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }else if (indexOfButton == 1){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 95, SCREEN_WIDTH - 50*2, 53)];
        imageView.image = [UIImage imageNamed:@"noCollection.png"];
        imageView.tag = 10086;
        [_collectionTableView addSubview:imageView];
        _collectionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else{
        [(UIImageView *)[_collectionTableView viewWithTag:10086] removeFromSuperview];
        _collectionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    _selectIndex = indexOfButton;
    [_collectionTableView reloadData];
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

@end
