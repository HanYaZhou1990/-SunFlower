//
//  EMBAMessageFram.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/9.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EMBAMessage;

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
@property (nonatomic, strong) EMBAMessage *message;
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
@property (nonatomic, copy) NSDictionary         *dict;

@end