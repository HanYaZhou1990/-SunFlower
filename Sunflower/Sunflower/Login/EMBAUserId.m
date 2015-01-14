//
//  EMBAUserId.m
//  Sunflower
//
//  Created by hanyazhou on 14/12/30.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAUserId.h"

@implementation EMBAUserId

+ (NSString *)getUserId{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"sessionId"];
}
+ (NSDictionary *)getUserMessage{
    NSData *data = [[[NSUserDefaults standardUserDefaults] valueForKey:@"userMessage"] dataUsingEncoding:NSUTF8StringEncoding];
    return [WTRequestCenter JSONObjectWithData:data];
}

@end
