//
//  EMBAAnnouncementCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAAnnouncementCell.h"

@interface EMBAAnnouncementCell ()

/*!
 由于需要设置前后左右的缩进，用lable虽然可以设置首行缩紧，行缩进，行间距和尾行缩进，但是上下无法控制
 所以借助UIButton的contentEdgeInsets或者titleEdgeInsets来设置这个cell上边的内容展示方式
 */
@property (nonatomic, strong) UIButton          *contentButton;

@end

@implementation EMBAAnnouncementCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        
        _contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _contentButton.titleLabel.numberOfLines = 0;
        _contentButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _contentButton.userInteractionEnabled = NO;
        _contentButton.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        [_contentButton setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [self.contentView addSubview:_contentButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _contentButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    [_contentButton setTitle:@"2014年1班聚会将于2014年3月4日在汐歌儿大酒店举行，届时有任何问题请大家联系班长：13876658888" forState:UIControlStateNormal];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
