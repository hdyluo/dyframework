//
//  DYRouter.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYRouter.h"

@interface DYRouter ()
@property(nonatomic,strong) NSMutableDictionary * classMap;
@property(nonatomic,strong) NSMutableDictionary * funcMap;
@end

@implementation DYRouter
+(instancetype)sharedInstance{
    static DYRouter  * router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[DYRouter alloc] init];
    });
    return router;
}
-(instancetype)init{
    if (self = [super init]) {
        self.classMap = [NSMutableDictionary dictionary];
        self.funcMap = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
