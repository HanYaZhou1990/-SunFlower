/*!
 @header IChatManagerConversation.h
 @abstract 为ChatManager提供基础会话操作
 @author EaseMob Inc.
 @version 1.00 2014/01/01 Creation (1.00)
 */

#import <Foundation/Foundation.h>
#import "IChatManagerBase.h"

@class EMConversation;
@class EMMessage;

/*!
 @protocol
 @brief 本协议主要用于聊天数据库的操作, 包括获取会话对象、保存会话对象、删除会话对象、获取会话未读记录的条数等
 @discussion
 */
@protocol IChatManagerConversation <IChatManagerBase>

@optional

#pragma mark - properties

/*!
 @property
 @brief 当前登陆用户的会话对象列表
 */
@property (nonatomic, readonly) NSArray *conversations;

#pragma mark - database

/*!
 @method
 @brief 获取某个用户的会话
 @discussion
        此方法获取会话的顺序如下:
            1. 查找内存会话列表中的会话;
            2. 如果没找到, 试图从数据库中查找此条会话;
            3. 如果仍没找到, 创建一个新的会话, 加到会话列表中, 并触发didUpdateConversationList:回调
 @param chatter 需要获取会话对象的用户名, 对于群组, 则是群组ID
 @result 会话对象
 */
- (EMConversation *)conversationForChatter:(NSString *)chatter isGroup:(BOOL)isGroup;

/*!
 @method
 @brief 获取当前登录用户的会话列表
 @discussion
 @result 会话对象列表
 */
- (NSArray *)loadAllConversations EM_DEPRECATED_IOS(2_0_8, 2_1_1, "Use - loadAllConversationsFromDatabase");
- (NSArray *)loadAllConversationsFromDatabase;

#pragma mark - save

/*!
 @method
 @brief 保存当前登录用户的会话列表到数据库
 @discussion
 @result 成功保存的会话对象列表的项数
 */
- (NSInteger)saveAllConversations EM_DEPRECATED_IOS(2_0_6, 2_1_1, "Delete");

/*!
 @method
 @brief 保存单个会话对象到数据库
 @discussion 对数据库中取出的数据修改后, 需要调用该方法
 @param conversation 需要保存的会话对象
 @param append2Chat  是否调用相关回调方法
 @result 保存成功或失败
 */
- (BOOL)insertConversationToDB:(EMConversation *)conversation
                   append2Chat:(BOOL)append2Chat;

/*!
 @method
 @brief 保存多个会话对象到数据库
 @discussion
 @param conversations 需要保存的会话对象列表
 @param append2Chat  是否调用相关回调方法
 @result 保存成功的会话对象个数
 */
- (NSInteger)insertConversationsToDB:(NSArray *)conversations
                         append2Chat:(BOOL)append2Chat;

#pragma mark - remove
/*!
 @method
 @brief 删除某个会话对象
 @discussion
 @param chatter 这个会话对象所对应的用户名
 @param aDeleteMessages 是否删除这个会话对象所关联的聊天记录
 @result 删除成功或失败
 */
- (BOOL)removeConversationByChatter:(NSString *)chatter deleteMessages:(BOOL)aDeleteMessages;

/*!
 @method
 @brief 删除某几个会话对象
 @discussion
 @param chatters 这几个要被删除的会话对象所对应的用户名列表
 @param aDeleteMessages 是否删除这个会话对象所关联的聊天记录
 @result 成功删除的会话对象的个数
 */
- (NSUInteger)removeConversationsByChatters:(NSArray *)chatters deleteMessages:(BOOL)aDeleteMessages;

/*!
 @method
 @brief 删除所有会话对象
 @discussion
 @param aDeleteMessages 是否删除这个会话对象所关联的聊天记录
 @result 是否成功执行
 */
- (BOOL)removeAllConversationsWithDeleteMessages:(BOOL)aDeleteMessages;

#pragma mark - message counter

/*!
 @method
 @brief 获取总的未读消息数量
 @discussion
 @result 未读消息数量
 */
- (NSUInteger)totalUnreadMessagesCount;

/*!
 @method
 @brief 获取单个会话对象的未读消息数量
 @discussion
 @param chatter 此会话对象所对应的用户名
 @result 此绘画对象的未读消息数量
 */
- (NSUInteger)unreadMessagesCountForConversation:(NSString *)chatter;

/*!
 @method
 @brief 获取当前登录用户所有包含未读消息的会话对象的个数
 @discussion
 @result 当前登录用户所有包含未读消息的会话对象的个数
 */
- (NSUInteger)unreadConversationsCount EM_DEPRECATED_IOS(2_0_0, 2_0_8, "不再提供该属性");

#pragma mark - search message

/*!
 *  从所有的聊天记录中搜索符合条件的记录
 *
 *  @param criteria 搜索条件
 *
 *  @return 搜索结果, 由EMMessage对象组成
 */
- (NSArray *)searchMessagesWithCriteria:(NSString *)criteria;

/*!
 *  从单个chatter聊天记录中搜索符合条件的记录
 *
 *  @param criteria 搜索条件
 *  @param chatter  聊天对象的用户名
 *
 *  @return 搜索结果, 由EMMessage对象组成
 */
- (NSArray *)searchMessagesWithCriteria:(NSString *)criteria
                            withChatter:(NSString *)chatter;

#pragma mark - save message

/*!
 @method
 @brief 保存聊天消息到DB
 @param message 待保存的聊天消息
 @return 是否成功保存聊天消息
 @discussion 
        消息会直接保存到数据库中,并不会调用相关回调方法;
        若希望调用相关回调方法,请使用insertMessageToDB:append2Chat:
 */
- (BOOL)saveMessage:(EMMessage *)message EM_DEPRECATED_IOS(2_0_6, 2_1_1, "Use - insertMessageToDB:");

- (BOOL)insertMessageToDB:(EMMessage *)message;

/*!
 @method
 @brief 导入聊天消息
 @param message 待导入的聊天消息
 @param append2Chat 是否调用相关回调方法
 @return 是否成功导入聊天消息
 */
- (BOOL)importMessage:(EMMessage *)message
          append2Chat:(BOOL)append2Chat EM_DEPRECATED_IOS(2_0_6, 2_1_1, "Use - insertMessageToDB:append2Chat:");

- (BOOL)insertMessageToDB:(EMMessage *)message
              append2Chat:(BOOL)append2Chat;

/*!
 @method
 @brief 保存一组聊天消息
 @param messages 待保存的聊天消息列表
 @return 成功保存的聊天消息条数
 */
- (NSInteger)saveMessages:(NSArray *)messages EM_DEPRECATED_IOS(2_0_6, 2_1_1, "Use - insertMessagesToDB:");

- (NSInteger)insertMessagesToDB:(NSArray *)messages;

/*!
 @method
 @brief 保存一组聊天消息(推荐用法，速度有惊喜哦)
 @param messages 待保存的聊天消息列表
 @param chatter  必填选项，message的conversationChatter
 @param append2Chat 是否调用相关回调方法
 @return 是否成功插入
 */
- (BOOL)insertMessagesToDB:(NSArray *)messages
                forChatter:(NSString *)chatter
               append2Chat:(BOOL)append2Chat;

@end
