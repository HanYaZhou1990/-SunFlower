//
//  EMBAMyLessonCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyLessonCell.h"

@implementation EMBAMyLessonCell{
    __strong EMBAMyLessonLable   *_lessonLable;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        
        self.contentView.layer.borderColor = [UIColorFromRGB(0xC8C7CC) CGColor];
        self.contentView.layer.borderWidth = 0.5;
        
        _lessonLable = [[EMBAMyLessonLable alloc] init];
        [self.contentView addSubview:_lessonLable];
        
        
        _contentLable = [[UILabel alloc] init];
        _contentLable.font = [UIFont systemFontOfSize:14];
        _contentLable.textColor = UIColorFromRGB(0x333333);
        _contentLable.text = @"    市场经济学";
        [self.contentView addSubview:_contentLable];
        
        _detailLable = [[UILabel alloc] init];
        _detailLable.font = [UIFont systemFontOfSize:13];
        _detailLable.textColor = UIColorFromRGB(0x666666);
        _detailLable.text = @"    刘一阳 教授";
        [self.contentView addSubview:_detailLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _lessonLable.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame));
    _lessonLable.titleS = _titleArray[0];
    
    _contentLable.frame = CGRectMake(CGRectGetMaxX(_lessonLable.frame), CGRectGetHeight(self.frame)/2-20, SCREEN_WIDTH - CGRectGetMaxX(_lessonLable.frame)-10, 15);
    
    _detailLable.frame = CGRectMake(CGRectGetMaxX(_lessonLable.frame), CGRectGetHeight(self.frame)/2+5, SCREEN_WIDTH - CGRectGetMaxX(_lessonLable.frame)-10, 15);
}

- (void)awakeFromNib {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end



@implementation EMBAMyLessonTwoCell{
    __strong EMBAMyLessonLable   *_lessonTopLable;
    __strong EMBAMyLessonLable   *_lessonBottomLable;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        
        self.contentView.layer.borderColor = [UIColorFromRGB(0xC8C7CC) CGColor];
        self.contentView.layer.borderWidth = 0.25;
        
        
        _lessonTopLable = [[EMBAMyLessonLable alloc] init];
        [self.contentView addSubview:_lessonTopLable];
        
        _lessonBottomLable = [[EMBAMyLessonLable alloc] init];
        [self.contentView addSubview:_lessonBottomLable];
        
        _contentLable = [[UILabel alloc] init];
        _contentLable.font = [UIFont systemFontOfSize:14];
        _contentLable.textColor = UIColorFromRGB(0x333333);
        _contentLable.text = @"    市场经济学";
        [self.contentView addSubview:_contentLable];
        
        _detailLable = [[UILabel alloc] init];
        _detailLable.font = [UIFont systemFontOfSize:13];
        _detailLable.textColor = UIColorFromRGB(0x666666);
        _detailLable.text = @"    刘一阳 教授";
        [self.contentView addSubview:_detailLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _lessonTopLable.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)/2);
    _lessonTopLable.titleS = _titleArray[0];
    
    _lessonBottomLable.frame = CGRectMake(0, CGRectGetMaxY(_lessonTopLable.frame), CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)/2);
    _lessonBottomLable.titleS = _titleArray[1];
    
    _contentLable.frame = CGRectMake(CGRectGetMaxX(_lessonTopLable.frame), CGRectGetHeight(self.frame)/2-20, SCREEN_WIDTH - CGRectGetMaxX(_lessonTopLable.frame)-10, 15);
    
    _detailLable.frame = CGRectMake(CGRectGetMaxX(_lessonTopLable.frame), CGRectGetHeight(self.frame)/2+5, SCREEN_WIDTH - CGRectGetMaxX(_lessonTopLable.frame)-10, 15);
}

- (void)drawRect:(CGRect)rect{
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.image = [UIImage imageNamed:@"To.png"];
    imageview.bounds = CGRectMake(0, 0, 16, 16);
    imageview.center = CGPointMake(CGRectGetWidth(rect)/8, CGRectGetHeight(rect)/2);
    [self.contentView addSubview:imageview];
    [super drawRect:rect];
}

- (void)awakeFromNib {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
