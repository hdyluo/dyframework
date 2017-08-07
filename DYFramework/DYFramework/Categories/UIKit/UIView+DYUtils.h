//
//  UIView+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DYUtils)

- (nullable UIImage *)dy_snapshotImage;

- (nullable UIImage *)dy_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

- (void)dy_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

- (void)dy_removeAllSubviews;

@property (nullable, nonatomic, readonly) UIViewController *dy_viewController;




@end
