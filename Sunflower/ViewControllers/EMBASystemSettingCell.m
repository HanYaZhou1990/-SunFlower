//
//  EMBASystemSettingCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/11.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBASystemSettingCell.h"

@implementation EMBASystemSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = UIColorFromRGB(0x333333);
        self.textLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.settingType == EMBASystemSettingCellTypeSwitch) {
        UISwitch*  switchButton = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 6, 50, 0)];
        [switchButton addTarget:self action:@selector(beiwangluSetAwoke:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:switchButton];
    }else {
        
    }
}

- (void)beiwangluSetAwoke:(UISwitch *)mySwitch{
    mySwitch.on =!mySwitch.on;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, rect.size.height-0.5, rect.size.width, 0.5)];
    view.backgroundColor = UIColorFromRGB(0xD9D9D9);
    [self.contentView addSubview:view];
}

- (void)awakeFromNib{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{[super setSelected:selected animated:animated];}

@end
