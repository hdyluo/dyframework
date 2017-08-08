//
//  NSDictionary+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DYUtils)

#pragma mark - RX
- (void)dy_each:(void (^)(id k, id v))block;
- (void)dy_eachKey:(void (^)(id k))block;
- (void)dy_eachValue:(void (^)(id v))block;
- (NSArray *)dy_map:(id (^)(id key, id value))block;
- (NSDictionary *)dy_pick:(NSArray *)keys;
- (NSDictionary *)dy_omit:(NSArray *)key;

@end
