//
//  EMBAMineHeaderView.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/16.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMineHeaderView.h"

@implementation EMBAMineHeaderView

- (id)initWithFrame:(CGRect)frame withHeaderImage:(UIImage *)headerImage withText:(NSString*)string{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = UIColorFromRGB(0xF6F6F6);
        if (headerImage) {
            _headerImageView = [[UIImageView alloc] init];
            _headerImageView.image = headerImage;
            [self.contentView addSubview:_headerImageView];
        }
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:13];
        _titleLable.textColor = UIColorFromRGB(0x666666);
        [self.contentView addSubview:_titleLable];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withText:(NSString*)string
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    if (_headerImageView) {
        _headerImageView.frame = CGRectMake(15, -41, 60, 60);
        _titleLable.font = [UIFont systemFontOfSize:12];
        style.firstLineHeadIndent = 7;//首行缩进
        
    }else{
        style.firstLineHeadIndent = 15;//首行缩进
    }
    if ([_titleLable.text length]>0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[_titleLable.text stringClearNull] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x666666)}];
        [_titleLable setAttributedText:attributedString];
    }else{}
    _titleLable.frame = CGRectMake(CGRectGetMaxX(_headerImageView.frame), 0, SCREEN_WIDTH-CGRectGetMaxX(_headerImageView.frame), 35);
}

@end
