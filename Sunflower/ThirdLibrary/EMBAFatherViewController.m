//
//  EMBAFatherViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-10-24.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAFatherViewController.h"

@interface EMBAFatherViewController ()

@end

@implementation EMBAFatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationController.navigationBar.translucent = NO;
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navB.png"] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage initWithColor:[UIColor clearColor]]];
        
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}

@end
