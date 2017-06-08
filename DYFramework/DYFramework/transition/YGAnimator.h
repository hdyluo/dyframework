//
//  YGAnimator.h
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YGAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) NSTimeInterval timeInterval;           //动画时间

@property (nonatomic,copy) void (^animatorBlock)(id<UIViewControllerContextTransitioning> context);

@end
