//
//  EMBAGroupInformationCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/19.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAGroupInformationCell.h"

@implementation EMBAGroupInformationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:13];
        _titleLable.textColor = UIColorFromRGB(0x666666);
        _titleLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_titleLable];
        
        _detailLable = [[UILabel alloc] init];
        _detailLable.font = [UIFont systemFontOfSize:14];
        _detailLable.textColor = UIColorFromRGB(0x333333);
        _detailLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_detailLable];
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
    if ([_detailLable.text length]>0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[_detailLable.text stringClearNull] attributes:@{NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColorFromRGB(0x333333)}];
        [_detailLable setAttributedText:attributedString];
    }else{}
    _titleLable.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(self.frame)/2);
    _detailLable.frame = CGRectMake(0, CGRectGetHeight(self.frame)/2, SCREEN_WIDTH, CGRectGetHeight(self.frame)/2);
}

- (void)awakeFromNib {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
