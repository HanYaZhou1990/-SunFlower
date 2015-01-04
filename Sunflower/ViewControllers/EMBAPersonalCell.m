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
        [self createSub];
    }
    return self;
}


- (void)createSub
{
    _titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 50, 50)];
    _titleImgView.layer.cornerRadius = _titleImgView.frame.size.width/2;
    _titleImgView.clipsToBounds = YES;
    [self.contentView addSubview:_titleImgView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, self.frame.size.width-90, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:15];
//    _titleLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, self.frame.size.width-90, 20)];
    _detailLabel.font = [UIFont systemFontOfSize:13];
//    _detailLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_detailLabel];
    
    _smallLineView = [[UIView alloc]initWithFrame:CGRectMake(75, 35, self.frame.size.width-80, 1)];
//    _smallLineView.backgroundColor = [UIColor lightGrayColor];
    _smallLineView.hidden = YES;
    [self.contentView addSubview:_smallLineView];
    
    _longLineView = [[UIView alloc]initWithFrame:CGRectMake(3, 85, self.frame.size.width-5, 1)];
//    _longLineView.backgroundColor = [UIColor lightGrayColor];
    _longLineView.hidden = YES;
    [self.contentView addSubview:_longLineView];
    
    _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-50, 45, 20, 20)];
//    deleteButton.backgroundColor = [UIColor redColor];
    [_deleteButton setTitle:@"X" forState:UIControlStateNormal];
    _deleteButton.hidden = YES;
    [self.contentView addSubview:_deleteButton];
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




