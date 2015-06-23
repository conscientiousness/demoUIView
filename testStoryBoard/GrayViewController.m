//
//  GrayViewController.m
//  testStoryBoard
//
//  Created by Jesselin on 2015/6/16.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

#import "GrayViewController.h"

@interface GrayViewController ()

@end

@implementation GrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //新增按鈕:left
    //iOS7扁平化後UIBarButtonItemStyle兩種用法都一樣
    //@selector:把某個方法(method)包裝成變數
    UIBarButtonItem *left1=[[UIBarButtonItem alloc] initWithTitle:@"left1" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    
    UIBarButtonItem *left2=[[UIBarButtonItem alloc] initWithTitle:@"left2" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    
    //self.navigationItem.leftBarButtonItem = left1;
    self.navigationItem.leftBarButtonItems = @[left1,left2];
    
    //Add Indicator to TitleView
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //顏色
    indicatorView.color = [UIColor redColor];
    //讓他動
    [indicatorView startAnimating];
    //取代navigation titleView位置
    //self.navigationItem.titleView = indicatorView;
    
    //取得indicatorView原本的寬高
    CGRect frame = indicatorView.frame;
    //自定義物件位置
    indicatorView.frame = CGRectMake(100, 100, frame.size.width, frame.size.height);
    
    [self.view addSubview:indicatorView];
    
    //Show ToolBar
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    UIBarButtonItem *tool1 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(toolBarButtonPressed:)];
    
     UIBarButtonItem *tool2 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toolBarButtonPressed:)];
    
     UIBarButtonItem *tool3 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(toolBarButtonPressed:)];
    
    UIBarButtonItem *flexiableSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self setToolbarItems:@[tool1,flexiableSpace,tool2,flexiableSpace,tool3] animated:YES];
    
    //自定義上一層不要用預設前一個navigationItem.titleView=>原本gray改成顯示返回(backBarButtonItem)
    self.navigationItem.backBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"是返回不是gray" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (void) toolBarButtonPressed:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) barButtonPressed:(id)sender {
    
    //[self setTitle:@"barButtonHiHIii"];
    [sender setTitle:@"Hi"];
    
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
