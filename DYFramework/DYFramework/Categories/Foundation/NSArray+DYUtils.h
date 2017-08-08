//
//  NSArray+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (DYUtils)

- (void)dy_each:(void (^)(id object))block;

- (void)dy_eachWithIndex:(void (^)(id object, NSUInteger index))block;

- (NSArray *)dy_map:(id (^)(id object))block;

- (NSArray *)dy_filter:(BOOL (^)(id object))block;

- (NSArray *)dy_reject:(BOOL (^)(id object))block;

- (id)dy_detect:(BOOL (^)(id object))block;

- (id)dy_reduce:(id (^)(id accumulator, id object))block;

- (id)dy_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;

@end

NS_ASSUME_NONNULL_END
