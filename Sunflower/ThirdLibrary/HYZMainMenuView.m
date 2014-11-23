//
//  HYZMainMenuView.m
//  User
//
//  Created by hanyazhou on 14-8-28.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "HYZMainMenuView.h"

@implementation HYZMainMenuView


- (id)initWithFrame:(CGRect)frame btnInformation:(NSArray *)btnInformation
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUIWithArray:btnInformation rect:frame];
    }
    return self;
}

- (void)drawUIWithArray:(NSArray *)informationArrry rect:(CGRect)rect{
    if (!_btnArray) {
        _btnArray = [@[]mutableCopy];
    }
    for (int i = 0; i < informationArrry.count - 1; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(rect.size.width/(informationArrry.count - 1)*i, 0, rect.size.width/(informationArrry.count - 1), rect.size.height);
        [button setImage:informationArrry[i][0] forState:UIControlStateNormal];
        [button setImage:informationArrry[i][1] forState:UIControlStateSelected];
        [button setBackgroundImage:[informationArrry lastObject][1] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setMultipleTouchEnabled:YES];
        if (i == [[informationArrry lastObject][0] intValue]) {button.selected = YES;}
        button.tag = i +10;
        [_btnArray addObject:button];
        [self addSubview:button];
    }
}

-(void)itemClick:(UIButton *)sender{
    if (sender.selected) {
        return;
    }else{
        for (int i = 0; i < _btnArray.count; i ++) {
            UIButton *btn = (UIButton *)_btnArray[i];
            if (sender.tag == btn.tag) {
                [btn setSelected:YES];
                if ([_delegate respondsToSelector:@selector(view:didSelectIndex:)]) {
                    [_delegate view:self didSelectIndex:sender.tag-10];
                }
            }else{
                [btn setSelected:NO];
                if ([_delegate respondsToSelector:@selector(view:didDeselectIndex:)]) {
                    [_delegate view:self didDeselectIndex:sender.tag-10];
                }
            }
        }
    }
}

@end
