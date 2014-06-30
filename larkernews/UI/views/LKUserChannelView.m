//
//  LKUserChannelView.m
//  larkernews
//
//  Created by cns on 14-6-26.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import "LKUserChannelView.h"

@implementation LKUserChannelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        UIButton  *saveChannelButton = [[UIButton alloc] initWithFrame:CGRectMake(200,10,30, 20)];
        [saveChannelButton setTitle:@"-" forState:UIControlStateNormal];
        [saveChannelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [saveChannelButton setBackgroundColor:[UIColor blackColor]];
        [saveChannelButton addTarget:self action:@selector(doSaveUserChannel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:saveChannelButton];
        [self setAlpha:0.9]a;
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

#pragma mark - 其他辅助功能
// 保存频道
-(void)doSaveUserChannel:(id)sender
{
    // 禁用当前的手势
    //    NSArray *swapList = [NSMutableArray arrayWithArray:self.gestureRecognizers];
    //    for (UIGestureRecognizer * gr in swapList) {
    //        [self removeGestureRecognizer:gr];
    //    }
    NSLog(@"关闭频道订制页面");
    [self removeFromSuperview];
}

@end
