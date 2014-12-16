//
//  EMBAMineMenuView.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/16.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EMBAMineMenuViewDelegate  <NSObject>

@required
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton;

@end

@interface EMBAMineMenuView : UIView
/*!
 按钮的图片，和title
 */
@property (nonatomic, strong) NSArray                            *btnInformationAry;
/*!
 代理
 */
@property (nonatomic, assign) id <EMBAMineMenuViewDelegate>      delegate;
@end
