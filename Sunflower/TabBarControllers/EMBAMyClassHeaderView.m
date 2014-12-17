//
//  EMBAMyClassHeaderView.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyClassHeaderView.h"

@implementation EMBAMyClassHeaderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = UIColorFromRGB(0xF6F6F6);
        
        self.contentView.layer.borderColor = [UIColorFromRGB(0xC8C7CC) CGColor];
        self.contentView.layer.borderWidth = 0.5;
        
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:12];
        _titleLable.textColor = UIColorFromRGB(0x666666);
        [self.contentView addSubview:_titleLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.firstLineHeadIndent = 20;//首行缩进
    if ([_titleLable.text length]>0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[_titleLable.text stringClearNull] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x666666)}];
        [_titleLable setAttributedText:attributedString];
    }else{}
    _titleLable.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

@end
