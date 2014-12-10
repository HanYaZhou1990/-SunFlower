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
        UIImageView *headImageView = [[UIImageView alloc] init];
        headImageView.tag = 10086;
        headImageView.image = [UIImage imageNamed:@"rumi80"];
        headImageView.layer.cornerRadius = 20;
        headImageView.clipsToBounds = YES;
        [self.contentView addSubview:headImageView];
        
        
        UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        contentBtn.tag = 10087;
        contentBtn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:contentBtn];
        
        UILabel *timeLable = [[UILabel alloc] init];
        timeLable.textColor = [UIColor grayColor];
        timeLable.text = @"17:40";
        timeLable.tag = 10088;
        timeLable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:timeLable];
    }
    return self;
}

- (void)setMessageFram:(EMBAMessageFram *)messageFram {
    
}

- (void)awakeFromNib{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{[super setSelected:selected animated:animated];}

@end
