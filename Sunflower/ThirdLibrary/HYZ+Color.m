//
//  HYZ+Color.m
//  User
//
//  Created by hanyazhou on 14-8-28.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "HYZ+Color.h"

@implementation UIImage(barColor)

+ (UIImage *)initWithColor:(UIColor *)color
{
    CGRect myRect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(myRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, myRect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
