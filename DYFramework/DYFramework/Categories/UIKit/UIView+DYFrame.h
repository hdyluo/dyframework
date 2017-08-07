//
//  UIView+DYFrame.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DYFrame)


@property (nonatomic) CGFloat dy_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat dy_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat dy_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat dy_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat dy_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat dy_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat dy_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat dy_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint dy_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  dy_size;        ///< Shortcut for frame.size.


@end
