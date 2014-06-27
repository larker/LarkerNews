//
//  LKRootViewController.h
//  larkernews
//
//  Created by cns on 14-6-24.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface LKRootViewController : UIViewController

// 左导航菜单
@property (strong, readonly, nonatomic) RESideMenu *sideMenu;
// 右导航菜单
@property (strong, readonly, nonatomic) RESideMenu *sideMenu2;

@end
