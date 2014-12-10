//
//  EMBAMessageCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/9.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMessageCell.h"

@implementation EMBAMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _headImageView = [[UIImageView alloc] init];
        _headImageView.image = [UIImage imageNamed:@"bg.png"];
        _headImageView.layer.cornerRadius = kIconWH/2;
        _headImageView.clipsToBounds = YES;
        [self.contentView addSubview:_headImageView];
        
        _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _contentBtn.titleLabel.numberOfLines = 0;
        _contentBtn.titleLabel.font = kContentFont;
        [_contentBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [self.contentView addSubview:_contentBtn];
        
        _timeLable = [[UILabel alloc] init];
        _timeLable.textColor = UIColorFromRGB(0x999999);
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textAlignment = NSTextAlignmentCenter;
        _timeLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_timeLable];
    }
    return self;
}

- (void)setMessageFram:(EMBAMessageFram *)messageFram {
    _messageFram = messageFram;
    EMBAMessage *message = _messageFram.message;
//    头像坐标
    _headImageView.frame = _messageFram.iconF;
    
    UIImage *normal;
    if (message.type == EMBAMessageTypeMe) {
        /**自己的文字消息**/
        normal = [UIImage imageNamed:@"selfChat.png"];
//    顶端盖高度   左端盖高度  底端盖高度     右端盖高度
        normal = [normal resizableImageWithCapInsets:UIEdgeInsetsMake(30, 8, 4, 14)];
        _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentTop, kContentRight, kContentBottom, kContentLeft);
        [_contentBtn setTitle:message.content forState:UIControlStateNormal];
    }else if (message.type == EMBAMessageTypeOther) {
/**别人或者群组发过来的消息**/
        normal = [UIImage imageNamed:@"other.png"];
        normal = [normal resizableImageWithCapInsets:UIEdgeInsetsMake(30, 14, 4, 8)];
        _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentTop, kContentLeft, kContentBottom, kContentRight);
        [_contentBtn setTitle:message.content forState:UIControlStateNormal];
    }else{}
    _contentBtn.frame = _messageFram.contentF;
    _timeLable.text = message.time;
    [_contentBtn setBackgroundImage:normal forState:UIControlStateNormal];
    _timeLable.frame = _messageFram.timeF;
}

- (void)awakeFromNib{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{[super setSelected:selected animated:animated];}

@end
