//
//  EMBALoginInputView.h
//  Sunflower
//
//  Created by hanyazhou on 14-10-24.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZTextField;

@interface EMBALoginInputView : UIView <UITextFieldDelegate>
@property (nonatomic, strong) YZTextField          *userNameField;
@property (nonatomic, strong) YZTextField          *userPswField;
@end
@interface YZTextField : UITextField

@end