//
//  DYRouter.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYRouter : NSObject

+ (instancetype)sharedInstance;

- (void)openPageWithOrgin:(UIViewController *)orginVC destination:(NSString *)urlString;

- (void)openPageViewOrgin:(UIViewController *)orginVC parmaters:(id)pars routerCallback:(void (^)(id object)) callback;

@end
