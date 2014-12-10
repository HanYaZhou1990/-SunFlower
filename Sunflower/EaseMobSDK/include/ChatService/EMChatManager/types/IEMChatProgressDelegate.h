/*!
 @header IEMChatProgressDelegate.h
 @abstract 聊天消息发送接收进度条协议
 @author EaseMob Inc.
 @version 1.00 2014/01/01 Creation (1.00)
 */

#import <Foundation/Foundation.h>

/*!
 @protocol
 @brief 聊天消息发送接收进度条
 @discussion 当发送带有附件的消息时, 可以使用进度条在界面上提示用户当前进度
 */
@protocol IEMChatProgressDelegate <NSObject>

@required

/*!
 @method
 @brief 设置进度
 @discussion 用户需实现此接口用以支持进度显示
 @param progress 值域为0到1.0的浮点数
 @param message  某一条消息的progress
 @result
 */
- (void)setProgress:(float)progress forMessage:(EMMessage *)message;

/*!
 @method
 @brief 设置进度
 @discussion 用户需实现此接口用以支持进度显示
 @param progress 值域为0到1.0的浮点数
 @result
 */
- (void)setProgress:(float)progress __attribute__((deprecated("")));

@end
