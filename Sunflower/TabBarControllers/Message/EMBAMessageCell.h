//
//  EMBAMessageCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/9.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMBAMessageFram.h"

@interface EMBAMessageCell : UITableViewCell

/*!
 消息坐标
*/
@property (nonatomic, strong) EMBAMessageFram              *messageFram;

/*!
 消息来自人的头像
*/
@property (nonatomic, strong) UIImageView                  *headImageView;
/*!
 消息内容
 */
@property (nonatomic, strong) UIButton                     *contentBtn;
/*!
 消息时间
 */
@property (nonatomic, strong) UILabel                      *timeLable;

@end
