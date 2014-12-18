//
//  EMBAMineMenuCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMineMenuCell.h"

@implementation EMBAMineMenuCell{
    EMBAMineMenuView *menuView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xC8C7CC);
        self.layer.borderColor = UIColorFromRGB(0xC8C7CC).CGColor;
        self.layer.borderWidth = 0.5;
        
        menuView = [[EMBAMineMenuView alloc] init];
        menuView.delegate = self;
        [self.contentView addSubview:menuView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    menuView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    menuView.btnInformationAry = @[
                                   @[@"我的班级",[UIImage imageNamed:@"myClass.png"]],
                                   @[@"我的课程",[UIImage imageNamed:@"myLesson.png"]],
                                   @[@"我的活动",[UIImage imageNamed:@"myActivity.png"]],
                                   @[[NSString stringWithFormat:@"%d",0],[UIImage initWithColor:UIColorFromRGB(0xFFFFFF)]]];
}

#pragma mark -
#pragma mark EMBAMineMenuViewDelegate -
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton{
    if ([_delegate respondsToSelector:@selector(view:didSelectIndex:)]) {
        [_delegate view:view didSelectIndex:indexOfButton];
    }
}

- (void)awakeFromNib {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {[super setSelected:selected animated:animated];}

@end
