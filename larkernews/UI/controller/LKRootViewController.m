//
//  LKRootViewController.m
//  larkernews
//
//  Created by cns on 14-6-24.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import "LKRootViewController.h"
#import "LKNewsListView.h"
#import "Macros.h"
#import "LKAppDelegate.h"
#import "LKPicNewsViewController.h"
#import "LKVideoNewsViewController.h"

@interface LKRootViewController ()
{
    // 新闻数据列表
    LKNewsListView *sosNewsListView;
}

@end

@implementation LKRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //重载导航条
        [self initTopNavBar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//重载导航条
-(void)initTopNavBar{
    self.title = @"新闻";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStyleBordered target:self action:@selector(showLeftMenu)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"用户" style:UIBarButtonItemStyleBordered target:self action:@selector(showRightMenu)];
}
// 右菜单
- (void)showRightMenu
{
    if (!_sideMenu2) {
        RESideMenuItem *homeItem = [[RESideMenuItem alloc] initWithTitle:@"个人中心" action:^(RESideMenu *menu, RESideMenuItem *item) {
            //回到根视图控制器
            [self.navigationController popToRootViewControllerAnimated:YES];
            [menu hide];
            NSLog(@"Item %@", item);
        }];
        _sideMenu2 = [[RESideMenu alloc] initWithItems:@[homeItem,homeItem,homeItem]];
        _sideMenu2.verticalOffset = IS_WIDESCREEN ? 110 : 76;
        _sideMenu2.horizontalOffset = 100;
        _sideMenu2.hideStatusBarArea = [LKAppDelegate OSVersion] < 7;
        
    }
    [_sideMenu2 showRight];
}
// 左菜单
- (void)showLeftMenu
{
    
    if (!_sideMenu) {
        RESideMenuItem *homeItem = [[RESideMenuItem alloc] initWithTitle:@"新闻" action:^(RESideMenu *menu, RESideMenuItem *item) {
            //回到根视图控制器
            [self.navigationController popToRootViewControllerAnimated:YES];
            [menu hide];
            NSLog(@"Item %@", item);
        }];
        RESideMenuItem *exploreItem = [[RESideMenuItem alloc] initWithTitle:@"图片" action:^(RESideMenu *menu, RESideMenuItem *item) {
            // 图片新闻
            LKPicNewsViewController *viewController = [[LKPicNewsViewController alloc] init];
            viewController.title = item.title;
            [self.navigationController pushViewController:viewController animated:YES];
            [menu hide];
            
        }];
        RESideMenuItem *activityItem = [[RESideMenuItem alloc] initWithTitle:@"视频" action:^(RESideMenu *menu, RESideMenuItem *item) {
            // 视频新闻
            LKVideoNewsViewController *viewController = [[LKVideoNewsViewController alloc] init];
            viewController.title = item.title;
            [self.navigationController pushViewController:viewController animated:YES];
            [menu hide];
        }];
        RESideMenuItem *profileItem = [[RESideMenuItem alloc] initWithTitle:@"跟贴" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
            LKVideoNewsViewController *viewController = [[LKVideoNewsViewController alloc] init];
            viewController.title = item.title;
            [self.navigationController pushViewController:viewController animated:YES];
            NSLog(@"Item %@", item);
        }];
        RESideMenuItem *aroundMeItem = [[RESideMenuItem alloc] initWithTitle:@"设置" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
            NSLog(@"Item %@", item);
        }];
        
        RESideMenuItem *helpPlus1 = [[RESideMenuItem alloc] initWithTitle:@"帮助" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
            [menu hide];
        }];
        
        RESideMenuItem *helpPlus2 = [[RESideMenuItem alloc] initWithTitle:@"版本" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
            [menu hide];
        }];
        
        RESideMenuItem *helpCenterItem = [[RESideMenuItem alloc] initWithTitle:@"关于我们" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
        }];
        helpCenterItem.subItems  = @[helpPlus1,helpPlus2];
        
        RESideMenuItem *itemWithSubItems = [[RESideMenuItem alloc] initWithTitle:@"更多" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
        }];
        itemWithSubItems.subItems = @[aroundMeItem,helpCenterItem];
        
        RESideMenuItem *logOutItem = [[RESideMenuItem alloc] initWithTitle:@"Log out" action:^(RESideMenu *menu, RESideMenuItem *item) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Are you sure you want to log out?" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Log Out", nil];
            [alertView show];
        }];
        
        _sideMenu = [[RESideMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem,itemWithSubItems, logOutItem]];
        _sideMenu.verticalOffset = IS_WIDESCREEN ? 110 : 76;
        _sideMenu.hideStatusBarArea = [LKAppDelegate OSVersion] < 7;
    }
    
    [_sideMenu showLeft];
}
// 初始View
- (void) initView {
    // 判断系统版本
    if (IS_IOS7) {
        self.edgesForExtendedLayout =UIRectEdgeNone ;
    }
    //contentView大小设置
    int vWidth = (int)([UIScreen mainScreen].bounds.size.width);
    int vHeight = (int)([UIScreen mainScreen].bounds.size.height);
    //contentView大小设置
    
    CGRect vViewRect = CGRectMake(0, 0, vWidth, vHeight -44 -20);
    UIView *vContentView = [[UIView alloc] initWithFrame:vViewRect];
    if (sosNewsListView == nil) {
        sosNewsListView = [[LKNewsListView alloc] initWithFrame:vContentView.frame];
    }
    [vContentView addSubview:sosNewsListView];
    
    self.view = vContentView;
    [self setViewFrame];

}

//设置View方向
-(void) setViewFrame{

}


@end
