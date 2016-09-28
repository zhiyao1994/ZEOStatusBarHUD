//
//  ZEOStatusBarHUD.m
//  ZEOStatusBarHUD
//
//  Created by ZeoLoveTina on 16/9/28.
//  Copyright © 2016年 小巨人_______陈依婷. All rights reserved.
//

#import "ZEOStatusBarHUD.h"
#define ZEOMessageFont [UIFont systemFontOfSize:12]

static CGFloat const ZEOMessageDuration = 2.0;

static CGFloat const ZEOMAnimationDuration = 0.25;
@implementation ZEOStatusBarHUD

/**全局窗口*/
static UIWindow *window_;
static NSTimer *timer_;

+(void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelAlert;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:ZEOMAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *显示普通信息和图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image{
    [timer_ invalidate];
    [self showWindow];
    //    添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = ZEOMessageFont;
    if(image){
          [button setImage:image forState:UIControlStateNormal];
          button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
//    定时消失
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZEOMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}

/**
 *显示成功信息
 */
+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"ZEOStatusBarHUD.bundle/check"]];
}

/**
 *显示失败信息
 */
+(void)showError:(NSString *)msg{
 [self showMessage:msg image:[UIImage imageNamed:@"ZEOStatusBarHUD.bundle/error"]];
}

/**
 *显示正在处理信息
 */
+(void)showLoading:(NSString *)msg{
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
   
    UILabel *label = [[UILabel alloc]init];
    label.font = ZEOMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : ZEOMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 *隐藏
 */
+(void)hide{
    [UIView animateWithDuration:ZEOMAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
