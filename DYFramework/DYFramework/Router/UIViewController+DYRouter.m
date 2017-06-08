//
//  UIViewController+DYRouter.m
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "UIViewController+DYRouter.h"
#import <objc/runtime.h>

@implementation UIViewController (DYRouter)

static char * extraParKey;
static char * blockKey;
- (void)setDy_launchData:(id)dy_launchData{
    objc_setAssociatedObject(self, &extraParKey, dy_launchData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)dy_launchData{
    return objc_getAssociatedObject(self, &extraParKey);
}

- (void)setDy_routerBlock:(void (^)(id))dy_routerBlock{
    objc_setAssociatedObject(self, &blockKey, dy_routerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(id))dy_routerBlock{
    return objc_getAssociatedObject(self, &blockKey);
}


@end
