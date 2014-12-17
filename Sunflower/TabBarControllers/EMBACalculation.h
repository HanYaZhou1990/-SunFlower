//
//  EMBACalculation.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMBACalculation : NSObject

+ (CGFloat)width:(NSString *)contentString heightOfFatherView:(CGFloat)height textFont:(UIFont *)font;
+ (CGFloat)height:(NSString *)contentString widthOfFatherView:(CGFloat)width textFont:(UIFont *)font;

@end
