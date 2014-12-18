//
//  EMBAPersonalCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14-12-5.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMBAPersonalCell : UITableViewCell
@property (nonatomic, strong) UILabel                         * titleLabel;
@property (nonatomic, strong) UILabel                         * detailLabel;
@property (nonatomic, strong) UIImageView                * titleImgView;
@property (nonatomic, strong) UIView                          * smallLineView;
@property (nonatomic, strong) UIView                          * longLineView;
@property (nonatomic, strong) UIButton                       * deleteButton;
@end



@interface EMBAPersonalContentCell : UITableViewCell
@property (nonatomic, strong)UILabel                         * titleContentLabel;
@property (nonatomic, strong)UIImageView                * imgView;
@property (nonatomic, strong)UIView                          * lineView;
@property (nonatomic, strong)UILabel                         * contentLabel;
@end