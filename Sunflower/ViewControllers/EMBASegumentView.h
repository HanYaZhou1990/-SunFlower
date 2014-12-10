//
//  EMBASegumentView.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/10.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EMBASegumentButton;

@protocol EMBASegumentViewDelegate <NSObject>

@required
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton;

@end

@interface EMBASegumentView : UIView

@property (nonatomic, strong) NSMutableArray       *btnArray;
@property (nonatomic, assign) id <EMBASegumentViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame btnInformation:(NSArray *)btnInformation;

@end

@interface EMBASegumentButton : UIButton

@end
