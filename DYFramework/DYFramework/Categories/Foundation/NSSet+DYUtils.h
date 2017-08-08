//
//  NSSet+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (DYUtils)


- (void)dy_each:(void (^)(id))block;
- (void)dy_eachWithIndex:(void (^)(id, int))block;
- (NSArray *)dy_map:(id (^)(id object))block;
- (NSArray *)dy_select:(BOOL (^)(id object))block;
- (NSArray *)dy_reject:(BOOL (^)(id object))block;
- (NSArray *)dy_sort;
- (id)dy_reduce:(id(^)(id accumulator, id object))block;
- (id)dy_reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block;


@end
