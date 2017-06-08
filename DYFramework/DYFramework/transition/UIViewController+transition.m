//
//  UIViewController+transition.m
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "UIViewController+transition.h"
#import <objc/runtime.h>

const char * kTransitionKey;            //给下级页面关联的转场对象的key

const char * kToInteractorKey;          //去向手势关联对象

const char * kBackInteractorKey;        //回来手势关联对象

@implementation UIViewController (transition)

- (void)yg_presentViewController:(UIViewController *)vc withTransition:(YGTransition *)transition{
    // vc.modalPresentationStyle = UIModalPresentationCustom;                                            //如果指定为custom的话手势驱动只能驱动fromVC.view,-----------大坑
    vc.transitioningDelegate = transition;
    [self _yg_setTransitionWithVC:vc transition:transition];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)yg_presentCustomViewController:(UIViewController *)controller withTransition:(YGTransition *)transition{
    controller.modalPresentationStyle = UIModalPresentationCustom;
    [self yg_presentViewController:controller withTransition:transition];
}

- (void)yg_pushViewController:(UIViewController *)vc withTransition:(YGTransition *)transition{
    self.navigationController.delegate = transition;
    [self _yg_setTransitionWithVC:vc transition:transition];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)_yg_setTransitionWithVC:(UIViewController *)vc transition:(YGTransition *)transition{
    objc_setAssociatedObject(vc, &kTransitionKey, transition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);       //给 toVC关联一个转场对象,避免delegate 释放，delegate 是弱引用类型的 --------大坑
    YGInteractor * toInterActor = objc_getAssociatedObject(self, &kToInteractorKey);
    if (toInterActor) {
        [transition setValue:toInterActor forKey:@"toInteractor"];
    }
    YGInteractor * backInteractor = objc_getAssociatedObject(vc, &kBackInteractorKey);
    if (backInteractor) {
        [transition setValue:backInteractor forKey:@"backInteractor"];
    }
}

- (void)yg_addToInteractor:(YGInteractor *)interactor action:(void (^)())block {
    objc_setAssociatedObject(self, &kToInteractorKey, interactor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);                //去向手势一定先于转场对象创建，所以直接关联
    interactor.transitionAction = block;
}

- (void)yg_addBackInteractor:(YGInteractor *)interactor action:(void (^)())block{                                   //为当前对象关联返回手势
    interactor.transitionAction = block;
    YGTransition * transition = objc_getAssociatedObject(self, &kTransitionKey);
    if (transition && [transition isKindOfClass:[YGTransition class]]) {    //如果转场对象存在，表明手势是在下级页面添加的，这里直接添加就行
        [transition setValue:interactor forKey:@"backInteractor"];
        return;
    }
    objc_setAssociatedObject(self, &kBackInteractorKey, interactor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);//如果转场对象不存在，表明手势是在present 或者 push 之前添加的，需要关联一下，在添加transition的时候将手势加进去
    
}






@end
