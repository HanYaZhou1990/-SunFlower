//
//  EMBASchoolFellowTableViewCell.m
//  Sunflower
//
//  Created by julong on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASchoolFellowTableViewCell.h"
@interface EMBASchoolFellowTableViewCell()
{
    UIImageView     *headImageView;
    UILabel         *titleLabel;
    UILabel         *detailLabel;
    UILabel         *timeLabel;

}
@end

@implementation EMBASchoolFellowTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xFFFFFF);
        self.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
        self.layer.borderWidth = 0.5;
        
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 35, 35)];
        headImageView.image = [UIImage imageNamed:@"bg.png"];
        headImageView.layer.cornerRadius = 18;
        headImageView.clipsToBounds = YES;
        headImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:headImageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, SCREEN_WIDTH-170, 20)];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setFont:[UIFont systemFontOfSize:16]];
        titleLabel.textColor =  UIColorFromRGB(0x333333);
        [self.contentView addSubview:titleLabel];
        
        timeLabel = [[UILabel alloc] init];
        timeLabel.frame = CGRectMake(SCREEN_WIDTH-170+55+10, 10, 80, 20);
        timeLabel.textColor = UIColorFromRGB(0x999999);
        timeLabel.font = [UIFont systemFontOfSize:11];
        timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:timeLabel];
        
        
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 37, SCREEN_WIDTH-70, 20)];
        detailLabel.numberOfLines = 1;
        [detailLabel setBackgroundColor:[UIColor clearColor]];
        [detailLabel setTextColor:UIColorFromRGB(0x999999)];
        [detailLabel setFont:[UIFont fontWithName:@"Helvetica" size:13.0]];
        [self.contentView addSubview:detailLabel];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}


-(void)setImage:(NSString *)imageStr andTitleStr:(NSString *)titleStr andDetailStr:(NSString *)detailStr andTimeStr:(NSString *)timeStr
{
    if (imageStr != nil&&![imageStr isEqualToString:@""])
    {
        //headImageView 加载在线图片
    [headImageView setImageWithURL:imageStr placeholderImage:[UIImage imageNamed:@"bg.png"]];
    }
    titleLabel.text = titleStr;
    detailLabel.text = detailStr;
    timeLabel.text = timeStr;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
