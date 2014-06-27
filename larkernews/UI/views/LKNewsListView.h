//
//  LKNewsListView.h
//  larkernews
//
//  Created by cns on 14-6-24.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuHrizontal.h"
#import "ScrollPageView.h"

@interface LKNewsListView : UIView<MenuHrizontalDelegate,ScrollPageViewDelegate>
{
    MenuHrizontal *sosMenuHriZontal;
    ScrollPageView *sosScrollPageView;
    UIButton  *sosSetChannelButton;
}

@end
