//
//  EMBAMyLessonCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMBAMyLessonLable.h"

/*
 如果根据枚举，判断类型，有些没必要的对象被创建的毫无意义，有些浪费
 换成两种cell
typedef enum {
    EMBAMyLessonCellTypeOne = 0,
    EMBAMyLessonCellTypeTwo = 1
} EMBAMyLessonCellType;
*/

/*!
 由于前边的标题的特殊性，特设置成:
 titleArray 格式 @[@[@"",@""],@[@"",@""]]
 大数组第一个元素为上边的内容
 大数组第二个元素为下边的内容
 如果数组中只有一个元素，说明，只有上边的
 大数组中的每个元素的第一个元素，为月日，第二个元素为星期几
 */
@interface EMBAMyLessonCell : UITableViewCell

@property (nonatomic ,strong) NSArray          *titleArray;

@property (nonatomic, strong) UILabel          *contentLable;
@property (nonatomic, strong) UILabel          *detailLable;

@end

@interface EMBAMyLessonTwoCell : UITableViewCell

@property (nonatomic ,strong) NSArray          *titleArray;

@property (nonatomic, strong) UILabel          *contentLable;
@property (nonatomic, strong) UILabel          *detailLable;

@end
