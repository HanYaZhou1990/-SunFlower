//
//  EMBACollectionCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/11.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBACollectionCell.h"

@implementation EMBACollectionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = UIColorFromRGB(0x333333);
        self.textLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, rect.size.height-0.5, rect.size.width, 0.5)];
    view.backgroundColor = UIColorFromRGB(0xD9D9D9);
    [self.contentView addSubview:view];
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();//获得处理上下文
    CGContextSetFillColorWithColor(context, [UIColorFromRGB(0xD9D9D9) CGColor]);//设置线条颜色
    CGContextMoveToPoint(context, 0, 1);//设置线的坐标点
    CGContextAddLineToPoint(context, self.bounds.size.width,1.0);//设置线的结束点
    CGContextSetLineCap(context, kCGLineCapRound);//设置线条样式
    CGContextSetLineWidth(context, 0.5);//线的宽度
    CGContextStrokePath(context);//链接上边的坐标点
     */
}

- (void)awakeFromNib{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
