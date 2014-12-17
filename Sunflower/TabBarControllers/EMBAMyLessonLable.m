//
//  EMBAMyLessonLable.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyLessonLable.h"

@implementation EMBAMyLessonLable{
    __strong UILabel      *_topLable;
    __strong UILabel      *_bottomLable;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.borderColor = [UIColorFromRGB(0xC8C7CC) CGColor];
        self.layer.borderWidth = 0.5;
        
        _topLable = [[UILabel alloc] init];
        _topLable.font = [UIFont systemFontOfSize:14];
        _topLable.textColor = UIColorFromRGB(0x999999);
        _topLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_topLable];
        
        _bottomLable = [[UILabel alloc] init];
        _bottomLable.font = [UIFont systemFontOfSize:14];
        _bottomLable.textColor = UIColorFromRGB(0x999999);
        _bottomLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_bottomLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _topLable.frame = CGRectMake(0, 14, CGRectGetWidth(self.frame), 15);
    _bottomLable.frame = CGRectMake(0, CGRectGetMaxY(_topLable.frame)+10, CGRectGetWidth(self.frame), 15);
    _topLable.text = _titleS[0];
    _bottomLable.text = _titleS[1];
}

@end
