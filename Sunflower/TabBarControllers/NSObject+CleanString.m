//
//  NSObject+CleanString.m
//  RuMi
//
//  Created by hanyazhou on 14-9-10.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "NSObject+CleanString.h"

@implementation NSObject(clearnString)
- (NSString *)stringClearNull{
    if ([self isKindOfClass:[NSNull class]] || self == nil) {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@",self];
    }
}

@end
