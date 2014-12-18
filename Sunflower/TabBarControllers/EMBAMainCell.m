//
//  EMBAMainCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/11/30.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMainCell.h"

@implementation EMBAMainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xfafef6);
        self.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
        self.layer.borderWidth = 0.5;
        
        _firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        _firstImageView.image = [UIImage imageNamed:@"1.png"];
        [self.contentView addSubview:_firstImageView];
        
        _headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerButton.frame = CGRectMake(LEFT_RIGHT_TOP_WIDTH, LEFT_RIGHT_TOP_WIDTH, HEADER_WIDTH_HEIGHT, HEADER_WIDTH_HEIGHT);
        [_headerButton setBackgroundImage:[UIImage imageNamed:@"bg.png"] forState:UIControlStateNormal];
        _headerButton.layer.cornerRadius = HEADER_WIDTH_HEIGHT/2;
        _headerButton.clipsToBounds = YES;
        [self.contentView addSubview:_headerButton];
        
        
        
        _numberLable = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_RIGHT_TOP_WIDTH + HEADER_WIDTH_HEIGHT/2, LEFT_RIGHT_TOP_WIDTH/2, HEADER_WIDTH_HEIGHT/3*2, HEADER_WIDTH_HEIGHT/2)];
        _numberLable.layer.cornerRadius = HEADER_WIDTH_HEIGHT/4;
        _numberLable.clipsToBounds = YES;
        _numberLable.text = @"99+";
        _numberLable.adjustsFontSizeToFitWidth = YES;
        _numberLable.textAlignment = NSTextAlignmentCenter;
        _numberLable.backgroundColor = [UIColor redColor];
        _numberLable.textColor = UIColorFromRGB(0xffffff);
        [self.contentView addSubview:_numberLable];
        
        
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_RIGHT_TOP_WIDTH*2+HEADER_WIDTH_HEIGHT, 5, SCREEN_WIDTH - LEFT_RIGHT_TOP_WIDTH*3-HEADER_WIDTH_HEIGHT*2-4 , LABLE_HEIGHT)];
        _nameLable.backgroundColor = [UIColor clearColor];
        _nameLable.textColor = UIColorFromRGB(0x333333);
        _nameLable.text = @"用户或者群组名字";
        _nameLable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLable];
        
        _contentLable = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_RIGHT_TOP_WIDTH*2+HEADER_WIDTH_HEIGHT, 10 + LABLE_HEIGHT, SCREEN_WIDTH - LEFT_RIGHT_TOP_WIDTH*3-HEADER_WIDTH_HEIGHT, LABLE_HEIGHT)];
        _contentLable.backgroundColor = [UIColor clearColor];
        _contentLable.text = @"这里是最后一次的聊天内容";
        _contentLable.textColor = UIColorFromRGB(0x999999);
        _contentLable.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_contentLable];
        
        _timeLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - LEFT_RIGHT_TOP_WIDTH - HEADER_WIDTH_HEIGHT - 4 , 5, HEADER_WIDTH_HEIGHT+4 , LABLE_HEIGHT)];
        _timeLable.backgroundColor = [UIColor clearColor];
        _timeLable.textAlignment = NSTextAlignmentCenter;
        _timeLable.text = @"10:14";
        _timeLable.textColor = UIColorFromRGB(0x999999);
        _timeLable.font = [UIFont systemFontOfSize:12.f];
        [self.contentView addSubview:_timeLable];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)awakeFromNib{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{[super setSelected:selected animated:animated];}

@end
