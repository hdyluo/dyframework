//
//  UIView+DYFrame.m
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import "UIView+DYFrame.h"

@implementation UIView (DYFrame)

@dynamic dy_left;
@dynamic dy_width;
@dynamic dy_right;
@dynamic dy_origin;
@dynamic dy_size;
@dynamic dy_top;
@dynamic dy_bottom;
@dynamic dy_centerX;
@dynamic dy_centerY;
@dynamic dy_height;

- (CGFloat)dy_left {
    return self.frame.origin.x;
}

- (void)setDy_Left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)dy_top {
    return self.frame.origin.y;
}

- (void)setDy_Top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)dy_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setDy_Right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)dy_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDy_Bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)dy_width {
    return self.frame.size.width;
}

- (void)setDy_Width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)dy_height {
    return self.frame.size.height;
}

- (void)setDy_Height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)dy_centerX {
    return self.center.x;
}

- (void)setDy_CenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)dy_centerY {
    return self.center.y;
}

- (void)setDy_CenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)dy_origin {
    return self.frame.origin;
}

- (void)setDy_Origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)dy_size {
    return self.frame.size;
}

- (void)setDy_Size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
