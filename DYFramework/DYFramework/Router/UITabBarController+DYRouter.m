//
//  UITabBarController+DYRouter.m
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "UITabBarController+DYRouter.h"
#import <objc/runtime.h>
#import "DYRouter.h"

@implementation UITabBarController (DYRouter)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method sourceMethod = class_getInstanceMethod(self, @selector(setSelectedIndex:));
        Method targetMethod = class_getInstanceMethod(self, @selector(dy_setSelectedIndex:));
        method_exchangeImplementations(sourceMethod, targetMethod);
        
        Method sourceMethod1 = class_getInstanceMethod(self, @selector(setSelectedViewController:));
        Method targetMethod1 = class_getInstanceMethod(self, @selector(dy_setSelectedViewController:));
        method_exchangeImplementations(sourceMethod1, targetMethod1);
        
    });
}

- (void)dy_setSelectedIndex:(NSInteger)index{
    [self dy_setSelectedIndex:index];
    NSLog(@"当前选中的索引是%ld",index);
}

- (void)dy_setSelectedViewController:(UIViewController *)vc{
    [self dy_setSelectedViewController:vc];
    NSLog(@"当前点选的控制器是%@",NSStringFromClass([vc class]));
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController * nav = (UINavigationController *)vc;
        if (nav.viewControllers.count > 0) {
            DYRouter.sharedRouter().switchToRootState(nav.viewControllers[0]);
        }
        return;
    }
    DYRouter.sharedRouter().switchToRootState(vc);
}


@end
