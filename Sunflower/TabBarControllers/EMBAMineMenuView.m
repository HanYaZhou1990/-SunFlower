//
//  EMBAMineMenuView.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/16.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMineMenuView.h"

@implementation EMBAMineMenuView{
    NSMutableArray       *btnArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)setBtnInformationAry:(NSMutableArray *)btnInformationAry{
    if (!btnArray) {
        btnArray = [@[]mutableCopy];
    }
    for (int i = 0; i < btnInformationAry.count - 1; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.frame.size.width/(btnInformationAry.count - 1)*i, 0, self.frame.size.width/(btnInformationAry.count - 1), self.frame.size.height);
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitle:btnInformationAry[i][0] forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [button setImage:btnInformationAry[i][1] forState:UIControlStateNormal];
        [button setBackgroundImage:[btnInformationAry lastObject][1] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setMultipleTouchEnabled:YES];
        button.imageEdgeInsets = UIEdgeInsetsMake(6, 30, 24, 30);
        button.titleEdgeInsets = UIEdgeInsetsMake(32, -20, 0, 20);
        /*初始化的时候，设置的默认选中按钮,这个地方不需要，舍弃此方法*/
//        if (i == [[btnInformationAry lastObject][0] intValue]) {button.selected = YES;}
        button.tag = i +10;
        [btnArray addObject:button];
        button.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
        button.layer.borderWidth = 0.25;
        [self addSubview:button];
    }
}

-(void)itemClick:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(view:didSelectIndex:)]) {
        [_delegate view:self didSelectIndex:sender.tag-10];
    }
}

@end
