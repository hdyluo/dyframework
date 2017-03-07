//
//  DYRouterCondition.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYRouterCondition.h"

@implementation DYRouterCondition

+(instancetype)defaultConditionWithUrlString:(NSString *)urlStr{
    DYRouterCondition * condition =  [[DYRouterCondition alloc] init];
    condition.needLogin = NO;
    condition.needCacheRouter = YES;
    return condition;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

@end
