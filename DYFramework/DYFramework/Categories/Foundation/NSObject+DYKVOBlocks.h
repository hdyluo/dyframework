//
//  NSObject+DYKVOBlocks.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DYKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (DYKVOBlocks)

- (void)dy_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(DYKVOBlock)block;

-(void)dy_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

-(void)dy_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(DYKVOBlock)block;

-(void)dy_removeBlockObserverForKeyPath:(NSString *)keyPath;

@end
