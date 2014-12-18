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
@interface EMBASchoolfellow_ViewController ()<UITableViewDelegate,UITableViewDataSource,EMBASegumentViewDelegate>
{
    EMBASegumentView  *segumentView;
    NSMutableArray    *_dataSource;
    UITableView       *_tableView;
    
    int               _typeIndex;//班级0 行业1 同乡2 标识符
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
    
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    _dataSource = [[NSMutableArray alloc]init];
    
    segumentView = [[EMBASegumentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) btnInformation:@[                                                                          @[@"班级",@"班级"],                                                                        @[@"行业",@"行业"],                                                                      @[@"同乡",@"同乡"],                                                                                                                                              @[[NSString stringWithFormat:@"%d",0],[UIImage initWithColor:UIColorFromRGB(0xF6F6F6)]]]];
    segumentView.delegate = self;
    [self.view addSubview:segumentView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT-44) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
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
        //班级
        EMBASchoolFellowEntity *embaSchoolFellowClassOne = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassOne.headImage = @"";
        embaSchoolFellowClassOne.titleString = @"三年级一班";
        embaSchoolFellowClassOne.detailString = @"[赵默笙]今天要交物理作业";
        embaSchoolFellowClassOne.timeString = @"18:35";
        [_dataSource addObject:embaSchoolFellowClassOne];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassTwo = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassTwo.headImage = @"";
        embaSchoolFellowClassTwo.titleString = @"三年级二班";
        embaSchoolFellowClassTwo.detailString = @"一生一代一双人";
        embaSchoolFellowClassTwo.timeString = @"18:35";
        [_dataSource addObject:embaSchoolFellowClassTwo];
        
    }
    else if (_typeIndex==1)
    {
        //行业
        EMBASchoolFellowEntity *embaSchoolFellowClassOne = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassOne.headImage = @"";
        embaSchoolFellowClassOne.titleString = @"郑州IT";
        embaSchoolFellowClassOne.detailString = @"[韩亚周]有没有做ios开发的?";
        embaSchoolFellowClassOne.timeString = @"18:35";
        [_dataSource addObject:embaSchoolFellowClassOne];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassTwo = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassTwo.headImage = @"";
        embaSchoolFellowClassTwo.titleString = @"机电行业";
        embaSchoolFellowClassTwo.detailString = @"挖掘机技术哪家强";
        embaSchoolFellowClassTwo.timeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassTwo];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassThree = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassThree.headImage = @"";
        embaSchoolFellowClassThree.titleString = @"珠宝行业";
        embaSchoolFellowClassThree.detailString = @"金鑫珠宝黄金大298元/克";
        embaSchoolFellowClassThree.timeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassThree];
    }
    else if (_typeIndex==2)
    {
        //同乡
        EMBASchoolFellowEntity *embaSchoolFellowClassOne = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassOne.headImage = @"";
        embaSchoolFellowClassOne.titleString = @"郑州老乡群";
        embaSchoolFellowClassOne.detailString = @"[年级班主任]陪伴是最长情的告白!";
        embaSchoolFellowClassOne.timeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassOne];
        
        EMBASchoolFellowEntity *embaSchoolFellowClassTwo = [[EMBASchoolFellowEntity alloc]init];
        embaSchoolFellowClassTwo.headImage = @"";
        embaSchoolFellowClassTwo.titleString = @"大同老乡群";
        embaSchoolFellowClassTwo.detailString = @"陪伴是最长情的告白!";
        embaSchoolFellowClassTwo.timeString = @"14:32";
        [_dataSource addObject:embaSchoolFellowClassTwo];
    }
    [_tableView reloadData];
}
//加入群点击
-(void)footerButtonClick
{
    NSLog(@"点击加入一个群");
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataSource.count>0)
    {
        return _dataSource.count;
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
        EMBASchoolFellowEntity *embaSchoolFellow = [_dataSource objectAtIndex:indexPath.row];
        [cell setImage:embaSchoolFellow.headImage andTitleStr:embaSchoolFellow.titleString andDetailStr:embaSchoolFellow.detailString andTimeStr:embaSchoolFellow.timeString];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        return cell;
    }
    return nil;
    
}

#pragma mark -
#pragma mark UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 16)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    if (_dataSource.count>0)
    {
        titleLabel.text = @"我加入的群";
    }
    else
    {
        titleLabel.text = @"您还没有加入群哦";
    }
    titleLabel.textColor = UIColorFromRGB(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    [headView addSubview:titleLabel];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 85;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        UIButton *footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        footerButton.frame = CGRectMake((SCREEN_WIDTH-143)/2, 20, 143, 45);
        [footerButton setImage:[UIImage imageNamed:@"addOneGroup.png"] forState:UIControlStateNormal];
        [footerButton setImage:[UIImage imageNamed:@"addOneGroup.png"] forState:UIControlStateHighlighted];
        [footerButton addTarget:self action:@selector(footerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 85)];
        [footView setBackgroundColor:[UIColor clearColor]];
        [footView addSubview:footerButton];
        return footView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSource.count>0)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//         EMBASchoolFellowEntity *embaSchoolFellow = [_dataSource objectAtIndex:indexPath.row];
        
    }
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
