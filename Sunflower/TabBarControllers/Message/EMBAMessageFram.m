//
//  EMBAMessageFram.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/9.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMessageFram.h"

@implementation EMBAMessageFram

- (void)setMessage:(EMBAMessage *)message{
    
    _message = message;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    CGSize contentSize = [_message.content sizeWithFont:kContentFont constrainedToSize:CGSizeMake(kContentW, CGFLOAT_MAX)];
#else
    NSDictionary *attributesDic = @{NSFontAttributeName:kContentFont};
    CGSize contentSize = [_message.content boundingRectWithSize:CGSizeMake(kContentW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil].size;
#endif
    
    if (_message.type == EMBAMessageTypeMe) {
        _iconF = CGRectMake(SCREEN_WIDTH - kMargin - kIconWH, kTime_ContentMargin, kIconWH, kIconWH);
        
        _contentF = CGRectMake(SCREEN_WIDTH - kIconWH - kMargin - contentSize.width - kContentLeft - kContentRight - kIcon_ContentMargin, kTime_ContentMargin, contentSize.width + kContentLeft + kContentRight, contentSize.height+ kContentTop + kContentBottom);
    }else{
        _iconF = CGRectMake(kMargin, kTime_ContentMargin, kIconWH, kIconWH);
        
        _contentF = CGRectMake(_iconF.size.width + kMargin + kIcon_ContentMargin, kTime_ContentMargin, contentSize.width + kContentLeft + kContentRight, contentSize.height+ kContentTop + kContentBottom);
    }
    CGFloat a = MAX(CGRectGetMaxY(_contentF), CGRectGetMaxY(_iconF));
    _timeF = CGRectMake(kMargin , a + kContent_TimeMargin, SCREEN_WIDTH - kMargin*2, 20);
    _cellHeight = MAX(CGRectGetMaxY(_contentF), CGRectGetMaxY(_timeF))  + kMargin;
}

@end

@implementation EMBAMessage

- (void)setDictionary:(NSDictionary *)dictionary{
    _dictionary = dictionary;
    self.icon = dictionary[@"icon"];
    self.time = dictionary[@"time"];
    self.content = dictionary[@"content"];
    self.type = [dictionary[@"type"] intValue];
}

@end