//
//  DYRouterState.m
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYRouterState.h"

@interface DYRouterState ()

@property(nonatomic,copy) NSString * scheme;
@property(nonatomic,copy) NSString * host;
@property(nonatomic,copy) NSString * frament;
@property(nonatomic,copy) NSString * parameters;

@end

@implementation DYRouterState

+ (instancetype)stateWithURLString:(NSString *)urlStr{
    if (!urlStr) {
        NSLog(@"状态不能为空");
        return nil;
    }
    
    NSURL * url = [NSURL URLWithString:urlStr];
    if (!url) {
        NSLog(@"url解析失败");
        return nil;
    }
    DYRouterState * state = [[DYRouterState alloc] init];
    state.url = urlStr;
    state.scheme = url.scheme;
    state.frament = url.fragment;
    state.host = url.host;
    state.parameters = url.parameterString;
    [state _parseWithScheme];
    [state _parseWithFrament];
    return state;
}

- (void)_parseWithScheme{
    if (!self.scheme) {
        self.routerType = DYRouterTypeOther;
        NSLog(@"不能解析的scheme");
        return;
    }
    if ([self.scheme.uppercaseString isEqualToString:@"DY"]) {  //页面模块
        NSString * vcStr = [NSString stringWithFormat:@"%@%@VC",self.scheme.uppercaseString,self.host];
        self.name = vcStr;
        self.routerType = DYRouterTypePage;
        return;
    }
    if ([self.scheme.uppercaseString isEqualToString:@"FUNC"]) {
        self.routerType = DYRouterTypeFunc;
        return;
    }
    if ([self.scheme.uppercaseString isEqualToString:@"SIG"]) {
        self.routerType = DYRouterTypeSingle;
        return;
    }
}

- (void)_parseWithFrament{
    if (!self.frament) {
        self.tag = 0;
        return;
    }
    NSInteger tag = self.frament.integerValue;
    self.tag = tag;
}

@end
