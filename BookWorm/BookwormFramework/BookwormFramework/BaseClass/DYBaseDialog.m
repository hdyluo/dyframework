//
//  DYBaseDialog.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYBaseDialog.h"

@interface DYBaseDialog ()

@end

@implementation DYBaseDialog

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[DYBaseDialogAnimator alloc] initWithTranslateType:DYDialogTranslateTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[DYBaseDialogAnimator alloc] initWithTranslateType:DYDialogTranslateTypeDismiss];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    DYDialogTranslateType type = (operation == UINavigationControllerOperationPush) ? DYDialogTranslateTypePush:DYDialogTranslateTypePop;
    return [[DYBaseDialogAnimator alloc] initWithTranslateType:type];
}

@end

@interface DYBaseDialogAnimator ()
@property(nonatomic,assign)DYDialogTranslateType translateType;
@end

@implementation DYBaseDialogAnimator

-(instancetype)initWithTranslateType:(DYDialogTranslateType)type{
    if (self = [super init]) {
        self.translateType = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.8;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    switch (self.translateType) {
        case DYDialogTranslateTypePush:
            break;
        case DYDialogTranslateTypePop:
            break;
        case DYDialogTranslateTypePresent:
            break;
        case DYDialogTranslateTypeDismiss:
            break;
        default:
            break;
    }
}

-(void)addBgViewToView:(UIView *)view{
    UIView * bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgView.tag = 100;
    bgView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [view addSubview:bgView];
}

- (void)pushAnimatorWithContext:(id <UIViewControllerContextTransitioning>)transitionContext{
    
}
- (void)popAnimatorWithContext:(id <UIViewControllerContextTransitioning>)transitionContext{
    
}
- (void)presentAnimatorWithContext:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    [self addBgViewToView:containerView];
    [containerView addSubview:toVC.view];
    toVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
- (void)dismissAnimatorWithContext:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


@end
