//
//  DYUtilities.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


NS_ASSUME_NONNULL_BEGIN


/// Get main screen's scale.
CGFloat DYScreenScale(void);

/// Get main screen's size. Height is always larger than width.
CGSize DYScreenSize(void);


/// Convert degrees to radians.
static inline CGFloat DegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

/// Convert radians to degrees.
static inline CGFloat RadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}

/// Returns the center for the rectangle.
static inline CGPoint CGRectGetCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}


/// Convert point to pixel.
static inline CGFloat CGFloatToPixel(CGFloat value) {
    return value * DYScreenScale();
}

/// Convert pixel to point.
static inline CGFloat CGFloatFromPixel(CGFloat value) {
    return value / DYScreenScale();
}

// main screen's scale
#ifndef kScreenScale
#define kScreenScale DYScreenScale()
#endif

// main screen's size (portrait)
#ifndef kScreenSize
#define kScreenSize DYScreenSize()
#endif

// main screen's width (portrait)
#ifndef kScreenWidth
#define kScreenWidth DYScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kScreenHeight
#define kScreenHeight DYScreenSize().height
#endif

NS_ASSUME_NONNULL_END

