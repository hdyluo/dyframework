//
//  DYRouter.h
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYRouterState.h"
#import "UIViewController+DYRouter.h"


#ifdef DEBUG
#define RRLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define RRLog(...)
#endif

typedef void(^routerCompletionBlock)(id object);

typedef NS_ENUM(NSInteger,DYPageShowType) {
    DYPageShowTypePush,
    DYPageShowTypePop,
    DYPageShowTypePresent,
    DYPageShowTypeDismiss
};

@interface DYRouter : NSObject

+ (DYRouter *(^)())sharedRouter;

/**
    切换到一个根状态，传入根状态实体，默认是个控制器
 */
- (DYRouter *(^)(id stateEntity))switchToRootState;

/**
 跳转到指定的状态 可选push 或者 present
 */
- (DYRouter *(^)(NSString *url,BOOL animated,DYPageShowType type))goToState;

/**
 返回上级状态，可选dismiss 或者 pop
 */
- (DYRouter *(^)(BOOL animated,DYPageShowType type))back;

/**
 返回到指定的状态，必须是pop
 */
- (DYRouter *(^)(NSString *url,BOOL animated))backToState;

/**
 状态跳转的时候传递的参数
 */
- (DYRouter *(^)(id pars))withPars;

/**
 状态跳转携带的动画方式，为了考虑路由和转场耦合性，这个不予实现
 */
- (DYRouter *(^)(id animator))withAnimator;

/**
 页面返回回调
 */
- (void(^)(routerCompletionBlock block))completion;


@end
