//
//  HYZMainMenuView.h
//  User
//
//  Created by hanyazhou on 14-8-28.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYZ+Color.h"
@class HYZMainMenuView;

@protocol HYZMainMenuViewDelegate <NSObject>

@optional
- (void)view:(HYZMainMenuView *)view didDeselectIndex:(NSInteger)indexOfButton;
@required
- (void)view:(HYZMainMenuView *)view didSelectIndex:(NSInteger)indexOfButton;

@end

@interface HYZMainMenuView : UIView
@property (nonatomic, strong) NSMutableArray       *btnArray;
@property (nonatomic, assign) NSInteger            selectIndex;//待实现
@property (nonatomic, assign) id <HYZMainMenuViewDelegate> delegate;


- (id)initWithFrame:(CGRect)frame btnInformation:(NSArray *)btnInformation;
@end
