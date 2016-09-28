//
//  ViewController.m
//  ZEOStatusBarHUDExample
//
//  Created by ZeoLoveTina on 16/9/28.
//  Copyright © 2016年 小巨人_______陈依婷. All rights reserved.
//

#import "ViewController.h"
#import "ZEOStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    [ZEOStatusBarHUD showSuccess:@"加载成功!"];
}

- (IBAction)error:(id)sender {
    [ZEOStatusBarHUD showError:@"加载失败!"];
}

- (IBAction)loading:(id)sender {
    [ZEOStatusBarHUD showLoading:@"正在加载中..."];
}

- (IBAction)hide:(id)sender {
    [ZEOStatusBarHUD hide];
}

- (IBAction)message:(id)sender {
    [ZEOStatusBarHUD showMessage:@"没有什么事!!!"];
}

@end
