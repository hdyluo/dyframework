//
//  UIViewController+transition.h
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGTransition.h"

@interface UIViewController (transition)

/**
 自定义modal转场,fullScreen转场:转场结束后，fromVC.view会移除视图,对于手势驱动完全支持

 @param controller 下级页面
 @param transition 转场对象
 */
- (void)yg_presentViewController:(UIViewController *)controller withTransition:(YGTransition *)transition;


/**
 自定义modal转场，custom转场，转场结束后fromVC.view不会移除视图，对于手势驱动只支持一半

 @param controller 下级页面
 @param transition 转场对象
 */
- (void)yg_presentCustomViewController:(UIViewController *)controller withTransition:(YGTransition *)transition;

/**
 添加去向交互转场

 @param interactor 交互对象
 @param block 页面跳转方式回调
 */
- (void)yg_addToInteractor:(YGInteractor *)interactor action:(void(^)())block;

/**
 添加返回交互转场

 @param interactor 交互对象
 @param block 页面跳转方式回调
 */
- (void)yg_addBackInteractor:(YGInteractor *)interactor action:(void(^)())block;

/**
 自定义navigation转场

 @param vc 下级页面
 @param trnasition 转场对象
 */
- (void)yg_pushViewController:(UIViewController *)vc withTransition:(YGTransition *)trnasition;

@end
