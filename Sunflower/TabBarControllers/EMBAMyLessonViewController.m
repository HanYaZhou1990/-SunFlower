//
//  EMBAMyLessonViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyLessonViewController.h"

@interface EMBAMyLessonViewController ()

@end

@implementation EMBAMyLessonViewController

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
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     UIColorFromRGB(0xFFFFFF), UITextAttributeTextColor,
                                                                     [UIFont systemFontOfSize:16.0], UITextAttributeFont,
                                                                     nil]];
    
    _segumentView = [[EMBASegumentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) btnInformation:@[
                    @[@"8月",@"8月"],
                    @[@"9月",@"9月"],
                    @[@"10月",@"10月"],
                    @[@"11月",@"12月"],
                    @[[NSString stringWithFormat:@"%d",0],[UIImage initWithColor:UIColorFromRGB(0xF6F6F6)]]]];
    _segumentView.delegate = self;
    
    _myLessonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT) style:UITableViewStylePlain];
    _myLessonTableView.dataSource = self;
    _myLessonTableView.delegate = self;
    [_myLessonTableView registerClass:[EMBAMyLessonCell class] forCellReuseIdentifier:@"cell"];
    [_myLessonTableView registerClass:[EMBAMyLessonTwoCell class] forCellReuseIdentifier:@"twocell"];
    _myLessonTableView.tableFooterView = [UIView new];
    _myLessonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myLessonTableView];
    
    
    _titleArray = @[@[@[@"12.15",@"周一"]],
                    @[@[@"12.16",@"周二"],@[@"12.16",@"周二"]],
                    @[@[@"12.17",@"周三"],@[@"12.17",@"周三"]],
                    @[@[@"12.18",@"周四"],@[@"12.18",@"周四"]],
                    @[@[@"12.19",@"周五"]],
                    @[@[@"12.20",@"周六"],@[@"2.20",@"周六"]],
                    @[@[@"12.21",@"周日"]],
                    @[@[@"12.21",@"周日"],@[@"12.21",@"周日"]],
                    @[@[@"12.22",@"周一"],@[@"12.22",@"周一"]],
                    ];
}

- (void)backItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark EMBAMineMenuCellDelegate -
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton{
    switch (indexOfButton) {
        case 0:
        {
        _titleArray = @[@[@[@"12.15",@"周一"]],
                        @[@[@"12.16",@"周二"],@[@"12.16",@"周二"]],
                        @[@[@"12.17",@"周三"],@[@"12.17",@"周三"]],
                        @[@[@"12.18",@"周四"],@[@"12.18",@"周四"]],
                        @[@[@"12.19",@"周五"]],
                        @[@[@"12.20",@"周六"],@[@"2.20",@"周六"]],
                        @[@[@"12.21",@"周日"]],
                        @[@[@"12.21",@"周日"],@[@"12.21",@"周日"]],
                        @[@[@"12.22",@"周一"],@[@"12.22",@"周一"]],
                        ];
        [_myLessonTableView reloadData];
        }
            break;
        case 1:
        {
        _titleArray = @[@[@[@"12.15",@"周一"]],
                        @[@[@"12.16",@"周二"],@[@"12.16",@"周二"]],
                        @[@[@"12.22",@"周一"],@[@"12.22",@"周一"]],
                        ];
        [_myLessonTableView reloadData];
        }
            break;
        case 2:
        {
        _titleArray = @[@[@[@"12.15",@"周一"]]];
        [_myLessonTableView reloadData];
        }
            break;
        case 3:
        {
        _titleArray = @[@[@[@"12.15",@"周一"]],
                        @[@[@"12.16",@"周二"],@[@"12.16",@"周二"]],
                        @[@[@"12.17",@"周三"],@[@"12.17",@"周三"]],
                        @[@[@"12.18",@"周四"],@[@"12.18",@"周四"]],
                        @[@[@"12.19",@"周五"]],
                        @[@[@"12.20",@"周六"],@[@"2.20",@"周六"]],
                        @[@[@"12.21",@"周日"]],
                        @[@[@"12.21",@"周日"],@[@"12.21",@"周日"]],
                        @[@[@"12.22",@"周一"],@[@"12.22",@"周一"]],
                        @[@[@"12.15",@"周一"]],
                        @[@[@"12.16",@"周二"],@[@"12.16",@"周二"]],
                        @[@[@"12.17",@"周三"],@[@"12.17",@"周三"]],
                        @[@[@"12.18",@"周四"],@[@"12.18",@"周四"]],
                        @[@[@"12.19",@"周五"]],
                        @[@[@"12.20",@"周六"],@[@"2.20",@"周六"]],
                        @[@[@"12.21",@"周日"]],
                        @[@[@"12.21",@"周日"],@[@"12.21",@"周日"]],
                        @[@[@"12.22",@"周一"],@[@"12.22",@"周一"]],
                        ];
        [_myLessonTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_titleArray[indexPath.row] count]>1) {
        return 130;
    }else{
        return 65;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return _segumentView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_titleArray[indexPath.row] count]>1) {
        EMBAMyLessonTwoCell *twoCell = [tableView dequeueReusableCellWithIdentifier:@"twocell" forIndexPath:indexPath];
        twoCell.titleArray = _titleArray[indexPath.row];
        return twoCell;
    }else{
        EMBAMyLessonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.titleArray = _titleArray[indexPath.row];
        return cell;
    }
}

#pragma mark -
#pragma mark UITableViewDelegate -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*修改cell被选中时的颜色*/
    EMBAMyLessonCell *cell = (EMBAMyLessonCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = UIColorFromRGB(0xFCF6D3);
    
    EMBAMyLessonDetailViewController *detailViewController = [[EMBAMyLessonDetailViewController alloc] init];
    detailViewController.title = @"课程详情";
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

@end
