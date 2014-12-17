//
//  EMBAMineHeaderView.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/16.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+CleanString.h"

@interface EMBAMineHeaderView : UITableViewHeaderFooterView
/*!
 表的区头有图片
*/
@property (nonatomic, strong) UIImageView           *headerImageView;
/*!
 表的区头的标题
*/
@property (nonatomic, strong) UILabel               *titleLable;
/*!
 用户名
*/
@property (nonatomic, strong) UILabel               *nameLable;
/*!
 初始化的时候，直接去分区头有没有图片，两种初始化方法，初始化的时候，区头"带"图片
 目前会使用此方法
*/
- (id)initWithFrame:(CGRect)frame withHeaderImage:(UIImage *)headerImage withText:(NSString*)string;
/*!
 初始化的时候，直接去分区头有没有图片，两种初始化方法，初始化的时候，区头"不带"图片
*/
- (id)initWithFrame:(CGRect)frame withText:(NSString*)string;
@end
