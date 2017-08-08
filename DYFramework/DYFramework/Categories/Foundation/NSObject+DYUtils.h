//
//  NSObject+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DYUtils)

+ (BOOL)dy_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

+ (BOOL)dy_swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

- (void)dy_setAssociateValue:(nullable id)value withKey:(void *)key;

- (void)dy_setAssociateWeakValue:(nullable id)value withKey:(void *)key;

- (nullable id)dy_getAssociatedValueForKey:(void *)key;

- (void)dy_removeAssociatedValues;

- (nullable id)dy_deepCopy;

- (nullable id)dy_deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver;

@end

NS_ASSUME_NONNULL_END
