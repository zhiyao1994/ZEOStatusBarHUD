//
//  ZEOStatusBarHUD.h
//  ZEOStatusBarHUD
//
//  Created by ZeoLoveTina on 16/9/28.
//  Copyright © 2016年 小巨人_______陈依婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZEOStatusBarHUD : NSObject
/**
 *显示普通信息和图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)msg;
/**
 *显示成功信息
 */
+(void)showSuccess:(NSString *)msg;
/**
 *显示失败信息
 */
+(void)showError:(NSString *)msg;
/**
 *显示正在处理信息
 */
+(void)showLoading:(NSString *)msg;
/**
 *隐藏
 */
+(void)hide;
@end
