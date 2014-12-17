//
//  EMBASegumentView.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/10.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASegumentView.h"

@implementation EMBASegumentView

- (id)initWithFrame:(CGRect)frame btnInformation:(NSArray *)btnInformation;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColorFromRGB(0xC8C7CC) CGColor];
        self.layer.borderWidth = 0.5;
        [self drawUIWithArray:btnInformation rect:frame];
    }
    return self;
}

- (void)drawUIWithArray:(NSArray *)informationArrry rect:(CGRect)rect{
    if (!_btnArray) {
        _btnArray = [@[]mutableCopy];
    }
    for (int i = 0; i < informationArrry.count - 1; i ++) {
        EMBASegumentButton *button = [EMBASegumentButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(rect.size.width/(informationArrry.count - 1)*i, 0, rect.size.width/(informationArrry.count - 1), rect.size.height);
        [button setTitle:informationArrry[i][0] forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0xFFAB48) forState:UIControlStateSelected];
        [button setBackgroundImage:[informationArrry lastObject][1] forState:UIControlStateNormal];
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
            }
        }
    }
}

@end

@implementation EMBASegumentButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

 - (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (self.selected) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, rect.size.height-2, rect.size.width, 2)];
        view.backgroundColor = UIColorFromRGB(0xFFAB48);
        [self addSubview:view];
    }else{
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[UIView class]]) {
                view.frame = CGRectZero;
            }
        }
    }
}

@end