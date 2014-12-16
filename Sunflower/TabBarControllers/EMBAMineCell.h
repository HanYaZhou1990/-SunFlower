//
//  EMBAMineCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  TOP_BOTTOM_HEIGHT     16
#define  LEFT_RIGHT            15
#define  SOMEBODY_WIDTH        60

@interface EMBAMineCell : UITableViewCell
/*! 
 课程或者活动的名字
 */
@property (nonatomic, strong) UILabel  	    *nameLable;
/*!
 课程老师或者活动负责人
 */
@property (nonatomic, strong) UILabel  	    *somebodyLable;
/*!
 课程或者活动的地址
 */
@property (nonatomic, strong) UILabel  	    *addressLable;
/*!
 课程活着活动的开始时间
 */
@property (nonatomic, strong) UILabel  	    *timeLable;

@end
