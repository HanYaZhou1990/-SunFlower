//
//  EMBASystemSettingCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/11.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    EMBASystemSettingCellTypeSwitch = 0,   /*带开关*/
    EMBASystemSettingCellTypeUnSwitch = 1 /*不带开关*/
} EMBASystemSettingCellType;

@interface EMBASystemSettingCell : UITableViewCell

@property (nonatomic, assign) EMBASystemSettingCellType         settingType;/**cell类型***/

@end
