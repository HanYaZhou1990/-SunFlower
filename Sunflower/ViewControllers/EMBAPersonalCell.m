//
//  EMBAPersonalCell.m
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-5.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAPersonalCell.h"

@implementation EMBAPersonalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)createSub
{
    _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    _titleImgView.layer.cornerRadius = _titleImgView.frame.size.width/2;
//    _titleImgView.layer.c
    _titleImgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_titleImgView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 5, 30, 30)];
    _titleLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_titleLabel];
    
    _smallLineView = [[UIView alloc]initWithFrame:CGRectMake(75, 35, self.frame.size.width-80, 1)];
    _smallLineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_smallLineView];
    
    _longLineView = [[UIView alloc]initWithFrame:CGRectMake(3, 85, self.frame.size.width-5, 1)];
    _longLineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_longLineView];
    
    UIButton * deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-50, 45, 20, 20)];
    deleteButton.backgroundColor = [UIColor redColor];
    [deleteButton setTitle:@"X" forState:UIControlStateNormal];
    [self.contentView addSubview:deleteButton];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end



@implementation EMBAPersonalContentCell

- (id)initWithPersoalStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createContentSub];
    }
    return self;
}


- (void)createContentSub
{
    _titleContentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
    _titleContentLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_titleContentLabel];
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(45, 10, 15, 30)];
    _imgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imgView];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(70, 2, 1, self.frame.size.height-4)];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_lineView];
    
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, self.frame.size.width-85, 30)];
    _contentLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_contentLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end




