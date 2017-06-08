//
//  YGTransition.h
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.



//  这里要注意，YGTransition 是给ViewController 的delegate，必须是强引用类型,如果定义为局部变量，会在函数结束后释放，因为delegate 是 weak类型

#import <UIKit/UIKit.h>
#import "YGAnimator.h"
#import "YGInteractor.h"

typedef NS_ENUM(NSInteger,YGTransitionType) {
    YGTransitionTypePush = 0,
    YGTransitionTypePop,
    YGTransitionTypePresent,
    YGTransitionTypeDismiss
};


@interface YGTransition : NSObject<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) YGAnimator * toAnimator;

@property (nonatomic, strong) YGAnimator * backAnimator;



@end
