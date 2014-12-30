//
//  EMBASchoolFellowEntity.h
//  Sunflower
//
//  Created by julong on 14/12/18.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMBASchoolFellowEntity : NSObject

@property (nonatomic,copy) NSString *picture;
@property (nonatomic,copy) NSString *nameString;
@property (nonatomic,copy) NSString *idString;
@property (nonatomic,copy) NSString *loginTimeString;

@end

@interface EMBASchoolFellowClassEntity : NSObject

@property (nonatomic,copy) NSString *classId;
@property (nonatomic,copy) NSString *className;
@property (nonatomic,strong) NSMutableArray *classList;

@end
