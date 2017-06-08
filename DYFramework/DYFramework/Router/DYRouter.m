//
//  DYRouter.m
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYRouter.h"



@interface DYRouter ()
@property (nonatomic,strong) NSMutableArray<DYRouterState *> * stateLists;          //状态堆栈列表
@property (nonatomic,strong) DYRouterState * rootState;
@property (nonatomic,strong) DYRouterState * currentState;                          //当前状态

@end

@implementation DYRouter

+ (DYRouter *(^)())sharedRouter{
    static DYRouter * router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[DYRouter alloc] init];
        router.stateLists = [NSMutableArray array];
    });
    return ^DYRouter *(){
        return router;
    };
}



- (DYRouter *(^)(id))switchToRootState{
    typeof(self) weakSelf = self;
    self.stateLists = [NSMutableArray array];                           //切换根状态的时候，清空状态列表
    return ^DYRouter * (id stateEntity){
        if (!stateEntity || ![stateEntity isKindOfClass:[UIViewController class]]) {
            RRLog(@"切换根状态失败");
            return weakSelf;
        }
        UIViewController * vc = stateEntity;
        self.rootState = [[DYRouterState alloc] init];                  //根据实体创建根状态
        self.rootState.name = NSStringFromClass([vc class]);           //指定状态名
        self.rootState.identify = vc.hash;                              //指定状态的唯一标识符
        self.rootState.stateEntity = vc;                                //指定状态的实体
        self.currentState = self.rootState;                             //当前状态指定为根状态
        [self.stateLists addObject:self.rootState];
        RRLog(@"切换到根状态：%@",self.rootState.name);
        return weakSelf;
    };
}


- (DYRouter *(^)(NSString *, BOOL, DYPageShowType))goToState{
    [self _updateStateList];                                            //每次在状态切换的时候，需要更新状态列表
    typeof(self) weakSelf = self;
    return ^ DYRouter * (NSString * url,BOOL animated,DYPageShowType type){
        DYRouterState * state =  [weakSelf _parseUrl:url];
        if (!state) {
            return weakSelf;
        }
       
        UIViewController * vc = [[NSClassFromString(state.name) alloc] init];
        if (![vc isKindOfClass:[UIViewController class]]) {
            RRLog(@"非viewController无法跳转");
            return weakSelf;
        }
        state.stateEntity = vc;                                         //状态生成后加入状态实体
        state.identify = vc.hash;                                       //生成唯一标识符
        UIViewController * currentVC = weakSelf.currentState.stateEntity;
        if (!currentVC || ![currentVC isKindOfClass:[UIViewController class]]) {
            RRLog(@"当前状态不存在，无法做页面跳转");
            return weakSelf;
        }
        if (state.tag == self.currentState.tag && [state.name isEqualToString:self.currentState.name]) {
            RRLog(@"堆栈列表里的两个状态名相同 tag相同，我这边会认为你重复点击,所以相同状态名处于同一堆栈中要把frmeng修改为不同值,这个方法的作用是阻止连续点击的，很有用");
            return weakSelf;
        }
        if (type == DYPageShowTypePush) {
            if (!currentVC.navigationController) {
                RRLog(@"没有导航栏，无法做页面跳转");
                return weakSelf;
            }
            [currentVC.navigationController pushViewController:vc animated:animated];
        }else if(type == DYPageShowTypePresent){
            [currentVC presentViewController:vc animated:animated completion:^{
            }];
        }
        [self.stateLists addObject:state];                              //添加到状态堆栈里去
        self.currentState = state;                                      //切换状态
        RRLog(@"切换到下级状态:%@",self.currentState.name);
        return weakSelf;
    };
}

- (DYRouter *(^)(BOOL, DYPageShowType))back{
    [self _updateStateList];
    typeof(self) weakSelf = self;
    return ^ DYRouter *(BOOL animated,DYPageShowType type){
        UIViewController * currentVC = weakSelf.currentState.stateEntity;
        if (!currentVC || ![currentVC isKindOfClass:[UIViewController class]]) {
            RRLog(@"当前状态不存在，无法做页面跳转");
            return weakSelf;
        }
        if (type == DYPageShowTypePop) {
            if (!currentVC.navigationController) {
                RRLog(@"没有导航栏，无法做页面跳转");
                return weakSelf;
            }
            if (currentVC.navigationController.viewControllers.count <= 1) {
                RRLog(@"已经是最顶层页面，无法再返回上一层");
                return weakSelf;
            }
            [currentVC.navigationController popViewControllerAnimated:animated];
        }else if(type == DYPageShowTypeDismiss){
            [currentVC dismissViewControllerAnimated:animated completion:^{
            }];
        }
        [self.stateLists removeLastObject];                             //状态切换
        self.currentState = self.stateLists.lastObject;
        RRLog(@"返回上级页面:%@",self.currentState.name);
        return weakSelf;
    };
}

- (DYRouter *(^)(NSString *, BOOL))backToState{
    [self _updateStateList];
    typeof(self) weakSelf = self;
    return ^ DYRouter * (NSString * url,BOOL animated){
        UIViewController * currentVC = weakSelf.currentState.stateEntity;
        if (!currentVC || ![currentVC isKindOfClass:[UIViewController class]]) {
            RRLog(@"当前状态不存在，无法做页面跳转");
            return weakSelf;
        }
        if (!currentVC.navigationController) {
            RRLog(@"没有导航栏，无法做页面跳转");
            return weakSelf;
        }
        if (currentVC.navigationController.viewControllers.count <= 1) {
            RRLog(@"已经是最顶层页面，无法再返回上一层");
            return weakSelf;
        }
        DYRouterState * state =  [weakSelf _parseUrl:url];
        if (!state) {
            RRLog(@"目标状态不存在");
            return weakSelf;
        }
        UIViewController * vc = [[NSClassFromString(state.name) alloc] init];
        if (![vc isKindOfClass:[UIViewController class]]) {
            RRLog(@"没有找到对应的页面");
            return weakSelf;
        }
        [weakSelf.stateLists enumerateObjectsUsingBlock:^(DYRouterState * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.name isEqualToString:state.name] && obj.tag == state.tag) {
                [currentVC.navigationController popToViewController:obj.stateEntity animated:animated];
                * stop = YES;
            }
        }];
        [self.stateLists removeLastObject];                             //状态切换
        self.currentState = self.stateLists.lastObject;
        RRLog(@"返回上级页面:%@",self.currentState.name);
        return weakSelf;
    };
}


- (DYRouter *(^)(id))withPars{
    typeof(self) weakSelf = self;
    return ^ DYRouter *(id pars){
        UIViewController * toVC = (UIViewController *)self.currentState.stateEntity;
        toVC.dy_launchData = pars;
        return weakSelf;
    };
}

- (DYRouter *(^)(id))withAnimator{
    typeof(self) weakSelf = self;
    return ^ DYRouter *(id animator){
        return weakSelf;
    };
}

- (void (^)(routerCompletionBlock))completion{
    return ^(routerCompletionBlock block){
        UIViewController * toVC = (UIViewController *)self.currentState.stateEntity;
        toVC.dy_routerBlock = block;
    };
}



#pragma mark - private methods

- (DYRouterState *) _parseUrl:(NSString *)url{
    DYRouterState * state = [DYRouterState stateWithURLString:url];
    if (state.routerType != DYRouterTypePage) {
        RRLog(@"不是页面跳转类型的路由");
        return nil;
    }
    return state;
}

- (void)_updateStateList{
    if (self.stateLists.count == 0) {
        self.currentState =  nil;
        self.rootState = nil;
        return;
    }
    
    if (self.stateLists[0].hash != self.rootState.hash) {
        self.stateLists = [NSMutableArray array];
        [self.stateLists addObject:self.rootState];
        self.currentState = self.rootState;
        return;
    }
    
    __block NSInteger length = 0;
    [self.stateLists enumerateObjectsUsingBlock:^(DYRouterState * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.stateEntity) {
            length++;
        }
        if (!obj.stateEntity) {             //状态实体不存在
            self.stateLists = [[self.stateLists subarrayWithRange:NSMakeRange(0, length)] mutableCopy];
            self.currentState = self.stateLists.lastObject;
            *stop = YES;
        }
    }];
}


@end
