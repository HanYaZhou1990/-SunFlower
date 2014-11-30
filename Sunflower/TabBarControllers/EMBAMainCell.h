//
//  EMBAMainCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/11/30.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LEFT_RIGHT_TOP_WIDTH         15
#define HEADER_WIDTH_HEIGHT          36
#define LABLE_HEIGHT                 25

@interface EMBAMainCell : UITableViewCell

/*********背景颜色 fafef6  头像离前边距离是 15 *********/
@property (nonatomic, strong) UIImageView                   *firstImageView;/***最前边的大头针图片*****/
@property (nonatomic, strong) UIButton                      *headerButton;/***用户的头像**** 70*70 *****/
@property (nonatomic, strong) UILabel                       *numberLable;/***消息数量****/
@property (nonatomic, strong) UILabel                       *nameLable;/***用户或者群组昵称**** 字号 28 颜色  33333 *****/
@property (nonatomic, strong) UILabel                       *contentLable;/***用来展示用户和这个用户（群）的最后一条消息**** 字号 26   颜色 999999 *****/
@property (nonatomic, strong) UILabel                       *timeLable;/***最后的时间lable****/

@end
