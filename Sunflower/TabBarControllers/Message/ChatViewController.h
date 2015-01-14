/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import <UIKit/UIKit.h>

@protocol ChatViewControllerDelegate <NSObject>

- (void)dataReload;

@end

@interface ChatViewController : UIViewController

@property (nonatomic, assign) id <ChatViewControllerDelegate>  delegate;

- (instancetype)initWithChatter:(NSString *)chatter isGroup:(BOOL)isGroup;

@end
