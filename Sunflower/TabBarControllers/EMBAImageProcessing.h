//
//  EMBAImageProcessing.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/16.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <Foundation/Foundation.h>
/*图片处理类，传过来一个图片，修改成圆图*/
@interface EMBAImageProcessing : NSObject
/*!
 专门用来将图片处理成圆图，并加圈，只需要传进来一个图片即可
*/
+ (UIImage*)changeImage:(UIImage*) image;
/*!
 专门用来将图片处理成圆图，并加圈，只需要传进来一个图片即可,用于处理列表前边的头像
 */
+ (UIImage*)fixImage:(UIImage*) image;
@end
