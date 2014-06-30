//
//  LKNewsListView.m
//  larkernews
//
//  Created by cns on 14-6-24.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import "LKNewsListView.h"
#import "UIConfig.h"
#import "LKUserChannelView.h"

@implementation LKNewsListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self channelInit];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark UI初始化频道
-(void)channelInit{
    NSArray *vButtonItemArray = @[@{NOMALKEY: @"normal.png",
                                    HEIGHTKEY:@"helight.png",
                                    TITLEKEY:@"头条",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal.png",
                                    HEIGHTKEY:@"helight.png",
                                    TITLEKEY:@"推荐",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"娱乐",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"体育",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"科技",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH4]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"新闻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"美女",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"帅哥",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"帅哥",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"帅哥",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"帅哥",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    TITLEKEY:@"帅哥",
                                    TITLEWIDTH:[NSNumber numberWithFloat:CHANNEL_MENU_WIDTH2]
                                    },
                                  ];
    
    if (sosMenuHriZontal == nil) {
        sosMenuHriZontal = [[MenuHrizontal alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-CHANNEL_SET_WIDTH, CHANNEL_MENU_HEIHT) ButtonItems:vButtonItemArray];
        sosMenuHriZontal.delegate = self;
        
        sosSetChannelButton = [[UIButton alloc] initWithFrame:CGRectMake(sosMenuHriZontal.layer.frame.size.width,0,CHANNEL_SET_WIDTH, CHANNEL_MENU_HEIHT)];
        [sosSetChannelButton setTitle:@"+" forState:UIControlStateNormal];
        [sosSetChannelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sosSetChannelButton setBackgroundColor:[UIColor blackColor]];
        [sosSetChannelButton addTarget:self action:@selector(doSetUserChannel:) forControlEvents:UIControlEventTouchUpInside];
    }
    //初始化滑动列表
    if (sosScrollPageView == nil) {
        sosScrollPageView = [[ScrollPageView alloc] initWithFrame:CGRectMake(0, CHANNEL_MENU_HEIHT, self.frame.size.width, self.frame.size.height - CHANNEL_MENU_HEIHT)];
        sosScrollPageView.delegate = self;
    }
    [sosScrollPageView setContentOfTables:vButtonItemArray.count];
    //默认选中第一个button
    [sosMenuHriZontal clickButtonAtIndex:0];
    //-------
    [self addSubview:sosScrollPageView];
    [self addSubview:sosMenuHriZontal];
    [self addSubview:sosSetChannelButton];
}

#pragma mark - 其他辅助功能
-(void)doSetUserChannel:(id)sender
{
    // 禁用当前的手势
//    NSArray *swapList = [NSMutableArray arrayWithArray:self.gestureRecognizers];
//    for (UIGestureRecognizer * gr in swapList) {
//        [self removeGestureRecognizer:gr];
//    }
    NSLog(@"打开频道订制页面");
    LKUserChannelView *userChannelView = [[LKUserChannelView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-80)];
    [self addSubview:userChannelView];
}

#pragma mark MenuHrizontalDelegate
-(void)didMenuHrizontalClickedButtonAtIndex:(NSInteger)aIndex{
    NSLog(@"第%d个Button点击了",aIndex);
    [sosScrollPageView moveScrollowViewAthIndex:aIndex];
}

#pragma mark ScrollPageViewDelegate
-(void)didScrollPageViewChangedPage:(NSInteger)aPage{
    NSLog(@"CurrentPage:%d",aPage);
    [sosMenuHriZontal changeButtonStateAtIndex:aPage];
    //    if (aPage == 3) {
    //刷新当页数据
    [sosScrollPageView freshContentTableAtIndex:aPage];
    //    }
}

@end
