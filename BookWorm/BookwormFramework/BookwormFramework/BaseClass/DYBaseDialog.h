//
//  DYBaseDialog.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,DYDialogTranslateType) {
    DYDialogTranslateTypePush = 0,
    DYDialogTranslateTypePop,
    DYDialogTranslateTypePresent,
    DYDialogTranslateTypeDismiss
};

@interface DYBaseDialog : UIViewController<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
@end

@interface DYBaseDialogAnimator : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithTranslateType:(DYDialogTranslateType)type;


@end
