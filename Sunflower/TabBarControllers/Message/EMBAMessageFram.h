//
//  EMBAMessageFram.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/9.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EMBAMessage;

#define kContentFont [UIFont systemFontOfSize:12] //内容字体
/*!间隔*/
#define kMargin                   16
/*! 两条消息间隔*/
#define kContentMargin            14
/*!上一条消息和时间的间隔*/
#define  kContent_TimeMargin      18
/*! 时间和下一条消息间隔*/
#define kTime_ContentMargin       28
/*!头像与内容的间隔*/
#define kIcon_ContentMargin       4
/*!头像宽高*/
#define kIconWH                   35
/*!内容宽度*/
#define kContentW                 180

/*!文本内容与按钮上边缘间隔*/
#define kContentTop               11
/*!文本内容与按钮左边缘间隔*/
#define kContentLeft              16
/*!文本内容与按钮下边缘间隔*/
#define kContentBottom            11
/*!文本内容与按钮右边缘间隔*/
#define kContentRight             16

@interface EMBAMessageFram : NSObject

/*!
 头像的坐标
 */
@property (nonatomic, assign, readonly) CGRect      iconF;
/*!
 需要展示的时间的坐标
 */
@property (nonatomic, assign, readonly) CGRect      timeF;
/*!
 消息内容的坐标
 */
@property (nonatomic, assign, readonly) CGRect      contentF;
/*!
 cell应有的高度
 */
@property (nonatomic, assign, readonly) CGFloat     cellHeight;
/*!
 消息内容
 */
@property (nonatomic, strong) EMBAMessage           *message;
/*!
 是否展示时间
 */
@property (nonatomic, assign) BOOL showTime;

@end


typedef enum {
    
    EMBAMessageTypeMe = 0, // 自己发的
    EMBAMessageTypeOther = 1,  //别人发得
} EMBAMessageType;

@interface EMBAMessage : NSObject
/*!
 用户头像
 */
@property (nonatomic, copy) NSString             *icon;
/*!
 接收或者发送消息的时间
 */
@property (nonatomic, copy) NSString             *time;
/*!
 消息里边需要展示的内容
 */
@property (nonatomic, copy) NSString             *content;
/*!
 消息类型
 */
@property (nonatomic, assign) EMBAMessageType    type;
/*!
 一条完整的消息
 */
@property (nonatomic, copy) NSDictionary         *dictionary;

@end