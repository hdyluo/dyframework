//
//  UIViewController+Router.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "UIViewController+Router.h"
#import <objc/runtime.h>

@implementation UIViewController (Router)

static char * extraParKey;
-(void)setExtraParameters:(NSDictionary *)extraParameters{
    objc_setAssociatedObject(self, &extraParKey, extraParameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSDictionary *)extraParameters{
   return objc_getAssociatedObject(self, extraParKey);
}

static char * blockKey;
-(void)setCallback:(id (^)(NSDictionary *))callback{
    objc_setAssociatedObject(self, &blockKey, callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(id (^)(NSDictionary *))callback{
    return objc_getAssociatedObject(self, blockKey);
}

@end