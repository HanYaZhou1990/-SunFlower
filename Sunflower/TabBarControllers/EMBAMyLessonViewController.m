//
//  EMBAMyLessonViewController.m
//  Sunflower
//
//  Created by Han_YaZhou on 14/12/17.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMyLessonViewController.h"

@interface EMBAMyLessonViewController ()

@end

@implementation EMBAMyLessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     UIColorFromRGB(0xFFFFFF), UITextAttributeTextColor,
                                                                     [UIFont systemFontOfSize:16.0], UITextAttributeFont,
                                                                     nil]];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
