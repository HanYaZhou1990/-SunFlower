//
//  EMBAMineMenuCell.h
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMBAMineMenuView.h"

@protocol EMBAMineMenuCellDelegate <NSObject>

@required
- (void)view:(UIView *)view didSelectIndex:(NSInteger)indexOfButton;

@end

@interface EMBAMineMenuCell : UITableViewCell<EMBAMineMenuViewDelegate>

@property (nonatomic, assign) id <EMBAMineMenuCellDelegate> delegate;

@end
