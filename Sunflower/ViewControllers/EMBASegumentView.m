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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, rect.size.height-1, rect.size.width, 1)];
    
    [self addSubview:view];
    if (self.selected) {
        view.backgroundColor = UIColorFromRGB(0xFFAB48);
    }else{
        view.backgroundColor = UIColorFromRGB(0xD9D9D9);
    }
}

@end