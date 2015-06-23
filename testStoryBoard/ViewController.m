//
//  ViewController.m
//  testStoryBoard
//
//  Created by Jesselin on 2015/6/16.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarItem.badgeValue = @"早安";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) bacToWhite:(UIStoryboardSegue *)segue {
    
}


@end
