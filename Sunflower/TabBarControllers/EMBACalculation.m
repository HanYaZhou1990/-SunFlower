//
//  EMBACalculation.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBACalculation.h"

@implementation EMBACalculation
+ (CGFloat)width:(NSString *)contentString heightOfFatherView:(CGFloat)height textFont:(UIFont *)font{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    CGSize size = [contentString sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)];
    return size.width ;
#else
    NSDictionary *attributesDic = @{NSFontAttributeName:font};
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil].size;
    return size.width;
#endif
}

+ (CGFloat)height:(NSString *)contentString widthOfFatherView:(CGFloat)width textFont:(UIFont *)font{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    CGSize size = [contentString sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)];
    return size.height;
#else
    NSDictionary *attributesDic = @{NSFontAttributeName:font};
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil].size;
    return size.height;
#endif
}
@end
