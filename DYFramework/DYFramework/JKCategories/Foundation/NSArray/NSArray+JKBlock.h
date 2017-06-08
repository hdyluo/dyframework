//
//  NSArray+Block.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JKBlock)
/**
 对每个元素做映射

 @param block 映射方式
 @return 新数组
 */
- (NSArray *)jk_map:(id (^)(id object))block;
/**
 对当前数组进行过滤

 @param block 过滤方法
 @return 过滤后的数组
 */
- (NSArray *)jk_filter:(BOOL (^)(id object))block;
/**
 过滤的反操作

 @param block 反过滤方法
 @return 反过滤的数组
 */
- (NSArray *)jk_reject:(BOOL (^)(id object))block;
/**
 查找指定的元素

 @param block 查找方式
 @return 查找的元素
 */
- (id)jk_detect:(BOOL (^)(id object))block;

@end
