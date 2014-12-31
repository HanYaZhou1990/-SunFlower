//
//  EMBASchoolfellowViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-26.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASchoolfellowViewController.h"
#import "EMBASchoolFellowEntity.h"
#import "EMBASchoolFellowTableViewCell.h"
#import "EMBASegumentView.h"
#import "ExpandHeader.h"
#import "EMBAUserInfoViewController.h"
#import "EMBAGroupDetailViewController.h"

@interface EMBASchoolfellow_ViewController ()<UITableViewDelegate,UITableViewDataSource,EMBASegumentViewDelegate>
{
    EMBASegumentView  *segumentView;
    NSMutableArray    *_dataSource;
    UITableView       *_tableView;
    
    int               _typeIndex;//班级0 行业1 同乡2 标识符
    UILabel           *titleLabel;
    ExpandHeader      *header;
    
    BOOL              isSectionSpread[100];//区头是否展开的数组
    
}
@end

@implementation EMBASchoolfellow_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"校友" image:[UIImage imageNamed:@"school_icon.png"] tag:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xe5e5e5);
    
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    _dataSource = [[NSMutableArray alloc]init];
    
    segumentView = [[EMBASegumentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) btnInformation:@[
                                                                                                               @[@"班级",@"班级"],
                                                                                                               @[@"行业",@"行业"],
                                                                                                               @[@"同乡",@"同乡"],
                                                                                                               @[[NSString stringWithFormat:@"%d",0],[UIImage initWithColor:UIColorFromRGB(0xF6F6F6)]]]];
    segumentView.delegate = self;
    [self.view addSubview:segumentView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT-44-TABBAR_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    UIView *titleBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    titleBgView.backgroundColor = [UIColor clearColor];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 12, SCREEN_WIDTH, 20);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = UIColorFromRGB(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    [titleBgView addSubview:titleLabel];
    header = [ExpandHeader expandWithScrollView:_tableView expandView:titleBgView];
    
    _typeIndex = 0;
    
    [self getDataSource];
    
}


#pragma mark -
#pragma mark EMBAMineMenuCellDelegate -
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton
{
    switch (indexOfButton)
    {
        case 0:
        {
        _typeIndex=0;
        }
        break;
        case 1:
        {
        _typeIndex=1;
        }
        break;
        case 2:
        {
        _typeIndex=2;
        }
        break;
        default:
        break;
    }
    
//此处刷新表格数据源 有接口请求接口 没接口自动选择数据
    [self getDataSource];
}

#pragma mark -
#pragma mark 请求获得表格数据源

-(void)getDataSource
{
    if (_dataSource)
        {
        [_dataSource removeAllObjects];
        }
    if (_typeIndex==0)
        {
        [WTRequestCenter getWithURL:[NSString stringWithFormat:@"%@getAllUserWithBasic",HTTP_URL]parameters:@{@"sessionId":[EMBAUserId getUserId]} option:WTRequestCenterCachePolicyCacheAndRefresh finished:^(NSURLResponse *response, NSData *data) {
            NSDictionary *jsonDic = [WTRequestCenter JSONObjectWithData:data];
            for (NSString *keyString in [jsonDic[[jsonDic allKeys][0]] allKeys]) {
                NSData *stringData = [keyString dataUsingEncoding:NSUTF8StringEncoding];
                
                EMBASchoolFellowClassEntity *classEntityOne = [[EMBASchoolFellowClassEntity alloc]init];
                classEntityOne.classList = [[NSMutableArray alloc]init];
                classEntityOne.classId = [WTRequestCenter JSONObjectWithData:stringData][@"gradeId"];
                classEntityOne.className = [WTRequestCenter JSONObjectWithData:stringData][@"description"];
                for (NSDictionary *memberDic in jsonDic[[jsonDic allKeys][0]][keyString]) {
                    EMBASchoolFellowEntity *embaSchoolFellowClassOne = [[EMBASchoolFellowEntity alloc]init];
                    NSLog(@"%@",[memberDic[@"picture"] stringClearNull]);
                    embaSchoolFellowClassOne.picture = [memberDic[@"picture"] stringClearNull];
                    embaSchoolFellowClassOne.nameString = [memberDic[@"name"] stringClearNull];
                    embaSchoolFellowClassOne.idString = [memberDic[@"id"] stringClearNull];
                    embaSchoolFellowClassOne.loginTimeString = [memberDic[@"loginName"] stringClearNull];
                    [classEntityOne.classList addObject:embaSchoolFellowClassOne];
                }
                
                [_dataSource addObject:classEntityOne];
                
                [_tableView reloadData];
            }
            
        } failed:^(NSURLResponse *response, NSError *error) {
            
        }];
        }
    else if (_typeIndex==1)
        {
            //行业
        EMBASchoolFellowEntity *embaSchoolFellowClassOne = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassOne.picture = @"";
        embaSchoolFellowClassOne.nameString = @"郑州IT";
        embaSchoolFellowClassOne.idString = @"[韩亚周]有没有做ios开发的?";
        embaSchoolFellowClassOne.loginTimeString = @"18:35";
        [_dataSource addObject:embaSchoolFellowClassOne];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassTwo = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassTwo.picture = @"";
        embaSchoolFellowClassTwo.nameString = @"机电行业";
        embaSchoolFellowClassTwo.idString = @"挖掘机技术哪家强";
        embaSchoolFellowClassTwo.loginTimeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassTwo];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassThree = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassThree.picture = @"";
        embaSchoolFellowClassThree.nameString = @"珠宝行业";
        embaSchoolFellowClassThree.idString = @"金鑫珠宝黄金大298元/克";
        embaSchoolFellowClassThree.loginTimeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassThree];
        }
    else if (_typeIndex==2)
        {
            //同乡
        EMBASchoolFellowEntity *embaSchoolFellowClassOne = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassOne.picture = @"";
        embaSchoolFellowClassOne.nameString = @"郑州老乡群";
        embaSchoolFellowClassOne.idString = @"[年级班主任]陪伴是最长情的告白!";
        embaSchoolFellowClassOne.loginTimeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassOne];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassTwo = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassTwo.picture = @"";
        embaSchoolFellowClassTwo.nameString = @"大同老乡群";
        embaSchoolFellowClassTwo.idString = @"陪伴是最长情的告白!";
        embaSchoolFellowClassTwo.loginTimeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassTwo];
        }
    
    if (_dataSource.count>0)
        {
        titleLabel.text = @"我加入的群";
        }
    else
        {
        titleLabel.text = @"您还没有加入群哦";
        }
    [_tableView reloadData];
}

#pragma mark -
#pragma mark 班级区头点击方法
-(void)sectionHeaderBtnClick:(UIButton *)sender
{
    isSectionSpread[sender.tag - 10] = !isSectionSpread[sender.tag - 10];
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:sender.tag - 10];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_typeIndex==0)
        {
        return _dataSource.count;
        }
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataSource.count>0)
        {
        if (_typeIndex==0)
            {
            EMBASchoolFellowClassEntity *classEntity = [_dataSource objectAtIndex:section];
            if (isSectionSpread[section])
                {
                return classEntity.classList.count;
                }
            else
                return 0;
            }
        else if (_typeIndex==1||_typeIndex==2)
            {
            return _dataSource.count;
            }
        else
            return 1;
        }
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    
    if (_dataSource.count==0)
        {
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell)
            {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
        cell.backgroundView = nil;
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.frame =CGRectMake(0, 25, SCREEN_WIDTH, 15);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = @"您可以创建一个群或加入一个群";
        cell.textLabel.textColor = UIColorFromRGB(0x999999);
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        }
    else
        {
        EMBASchoolFellowTableViewCell *cell =(EMBASchoolFellowTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell)
            {
            cell = [[EMBASchoolFellowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
        EMBASchoolFellowEntity *embaSchoolFellow ;
        if (_typeIndex==0)
            {
            EMBASchoolFellowClassEntity *classEntityOne = [_dataSource objectAtIndex:indexPath.section];
            embaSchoolFellow = [classEntityOne.classList objectAtIndex:indexPath.row];
            }
        if (_typeIndex==1||_typeIndex==2)
            {
            embaSchoolFellow = [_dataSource objectAtIndex:indexPath.row];
            }
        
        [cell setImage:embaSchoolFellow.picture andTitleStr:embaSchoolFellow.nameString andDetailStr:embaSchoolFellow.idString andTimeStr:embaSchoolFellow.loginTimeString];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        return cell;
        }
    return nil;
    
}

#pragma mark -
#pragma mark UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_typeIndex==0)
        {
        EMBASchoolFellowClassEntity *classEntityOne = [_dataSource objectAtIndex:section];
        UIButton *headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        headerButton.adjustsImageWhenHighlighted = NO;
        headerButton.adjustsImageWhenDisabled = NO;
        headerButton.tag = section+ 10;
        [headerButton addTarget:self action:@selector(sectionHeaderBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [headerButton setBackgroundColor:UIColorFromRGB(0xf6f6f6)];
        
        UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-43, 5, 23, 23)];
        leftImgView.image = [UIImage imageNamed:@"open_expand.png"];
        [headerButton addSubview:leftImgView];
        if (isSectionSpread[section])
            {
            leftImgView.transform = CGAffineTransformMakeRotation(M_PI);
            }
        else
            leftImgView.transform = CGAffineTransformMakeRotation(0);
        
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 0, SCREEN_WIDTH-60, 33)];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = UIColorFromRGB(0x333333);
        headerLabel.font = [UIFont systemFontOfSize:14];
        headerLabel.text = classEntityOne.className;
        [headerButton addSubview:headerLabel];
        
        return headerButton;
        }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_typeIndex==0)
        {
        return 33;
        }
    else
        return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_typeIndex == 0)
        {
        if (_dataSource.count>0)
            {
            if (section==_dataSource.count-1)
                {
                return 85;
                }
            }
        return 0;
        }
    if (_typeIndex == 1 ||_typeIndex==2)
        {
        return 85;
        }
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 85)];
    [footView setBackgroundColor:[UIColor clearColor]];
    
    UIButton *creatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [creatButton setImage:[UIImage imageNamed:@"creadOneGroup.png"] forState:UIControlStateNormal];
    [creatButton setImage:[UIImage imageNamed:@"creadOneGroup.png"] forState:UIControlStateHighlighted];
    [creatButton addTarget:self action:@selector(creatGroupButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:creatButton];
    
    UIButton *footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerButton setImage:[UIImage imageNamed:@"addOneGroup.png"] forState:UIControlStateNormal];
    [footerButton setImage:[UIImage imageNamed:@"addOneGroup.png"] forState:UIControlStateHighlighted];
    [footerButton addTarget:self action:@selector(addOneGroupButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:footerButton];
    if (_typeIndex == 0 || _typeIndex == 1)
        {
        creatButton.frame = CGRectMake(15, 20, 142, 45);
        footerButton.frame = CGRectMake(CGRectGetMaxX(creatButton.frame)+6, 20, 142, 45);
        }
    else
        {
        footerButton.frame = CGRectMake((SCREEN_WIDTH-142)/2, 20, 142, 45);
        }
    
    if (_typeIndex == 0)
        {
        if (_dataSource.count>0)
            {
            if (section==_dataSource.count-1)
                {
                return footView;
                }
            }
        return nil;
        }
    if (_typeIndex == 1 ||_typeIndex==2)
        {
        return footView;
        }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSource.count>0)
        {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (_typeIndex == 0)
            {
            
            EMBASchoolFellowClassEntity *classEntityOne = [_dataSource objectAtIndex:indexPath.section];
            EMBASchoolFellowEntity *embaSchoolFellow  = [classEntityOne.classList objectAtIndex:indexPath.row];
            EMBAUserInfoViewController *uIVC = [[EMBAUserInfoViewController alloc]init];
            uIVC.isUser = NO;
            uIVC.userIdStr = embaSchoolFellow.idString;
            uIVC.classNameString = classEntityOne.className;
            uIVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:uIVC animated:YES];
            }
            if (_typeIndex == 1||_typeIndex ==2)
            {
                EMBAGroupDetailViewController *gDVC = [[EMBAGroupDetailViewController alloc]init];
                [self.navigationController pushViewController:gDVC animated:YES];
            }

        }
}

#pragma mark -
#pragma mark footer view 上的button点击事件 -

- (void)creatGroupButtonClicked:(UIButton *)sender{
    EMBACreatGroupViewController *creatViewController = [[EMBACreatGroupViewController alloc] init];
    creatViewController.title = @"创建一个群";
    creatViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:creatViewController animated:YES];
}

- (void)addOneGroupButtonclicked:(UIButton *)sender{
    EMBAAddGroupViewController *addViewController = [[EMBAAddGroupViewController alloc] init];
    addViewController.title = @"加入一个群";
    addViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addViewController animated:YES];
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
