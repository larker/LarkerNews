//
//  LKAppDelegate.h
//  larkernews
//
//  Created by cns on 14-6-24.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKAppDelegate : UIResponder <UIApplicationDelegate>
{
    // 导航
    UINavigationController *sosNavigationController;
}

@property (strong, nonatomic) UIWindow *window;

// 当前系统版本
+ (NSInteger)OSVersion;

@end
