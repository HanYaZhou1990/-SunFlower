//
//  EMBACreatGroupCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
/*!
 用于创建群的时候，填写将要创建的群组的基本信息
 */
@interface EMBACreatGroupCell : UITableViewCell
/*!
 cell最前边的标题
 */
@property (nonatomic, strong) UILabel         *titleLable;
/*!
 cell标题后边的输入框
 */
@property (nonatomic, strong) UITextField     *contentTextField;

@end
