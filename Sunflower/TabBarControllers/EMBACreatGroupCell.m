//
//  EMBACreatGroupCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBACreatGroupCell.h"

@implementation EMBACreatGroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:16];
        _titleLable.textColor = UIColorFromRGB(0x666666);
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_titleLable];
        
        _contentTextField = [[UITextField alloc] init];
        _contentTextField.borderStyle = UITextBorderStyleNone;
        _contentTextField.font = [UIFont systemFontOfSize:16];
        _contentTextField.textColor = UIColorFromRGB(0x333333);
        [self.contentView addSubview:_contentTextField];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLable.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame));
    _contentTextField.frame = CGRectMake(CGRectGetMaxX(_titleLable.frame), 0, SCREEN_WIDTH-CGRectGetWidth(_titleLable.frame), CGRectGetHeight(self.frame));
}

- (void)awakeFromNib {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
