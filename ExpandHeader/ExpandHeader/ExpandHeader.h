//
//  ExpandHeader.h
//  ExpandHeader
//
//  Created by Han_YaZhou on 14/12/16.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ExpandHeader : NSObject <UIScrollViewDelegate>

+ (id)expandWithScrollView:(UIScrollView*)scrollView expandView:(UIView*)expandView;

@end
