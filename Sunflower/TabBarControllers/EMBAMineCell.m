//
//  EMBAMineCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMineCell.h"

@implementation EMBAMineCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        self.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
        self.layer.borderWidth = 0.25;
        
        _nameLable = [[UILabel alloc] init];
        _nameLable.font = [UIFont systemFontOfSize:14];
        _nameLable.text = @"市场宏观经济学";
        _nameLable.textColor = UIColorFromRGB(0x333333);
        _nameLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_nameLable];
        
        
        _somebodyLable = [[UILabel alloc] init];
        _somebodyLable.font = [UIFont systemFontOfSize:13];
        _somebodyLable.text = [EMBAUserId getUserMessage][@"name"];
        _somebodyLable.textColor = UIColorFromRGB(0x555555);
        _somebodyLable.textAlignment = NSTextAlignmentRight;
        _somebodyLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_somebodyLable];
        
        
        _addressLable = [[UILabel alloc] init];
        _addressLable.font = [UIFont systemFontOfSize:13];
        _addressLable.text = @"地点  郑州大学教学楼2栋3单元";
        _addressLable.textColor = UIColorFromRGB(0x666666);
        [self.contentView addSubview:_addressLable];
        
        _timeLable = [[UILabel alloc] init];
        _timeLable.font = [UIFont systemFontOfSize:13];
        _timeLable.text = @"时间  2014年12月17日  09:00－12:00";
        _timeLable.textColor = UIColorFromRGB(0x666666);
        [self.contentView addSubview:_timeLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _nameLable.frame = CGRectMake(LEFT_RIGHT, TOP_BOTTOM_HEIGHT, SCREEN_WIDTH - LEFT_RIGHT*2 - SOMEBODY_WIDTH, TOP_BOTTOM_HEIGHT);
    _somebodyLable.frame = CGRectMake(CGRectGetMaxX(_nameLable.frame), TOP_BOTTOM_HEIGHT, SOMEBODY_WIDTH, TOP_BOTTOM_HEIGHT);
    _addressLable.frame = CGRectMake(LEFT_RIGHT, CGRectGetMaxY(_nameLable.frame)+10, SCREEN_WIDTH - LEFT_RIGHT*2, TOP_BOTTOM_HEIGHT);
    _timeLable.frame = CGRectMake(LEFT_RIGHT, CGRectGetMaxY(_addressLable.frame)+10, SCREEN_WIDTH - LEFT_RIGHT*2, TOP_BOTTOM_HEIGHT);
}

- (void)awakeFromNib {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
