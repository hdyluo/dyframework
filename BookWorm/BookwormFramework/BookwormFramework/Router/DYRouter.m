//
//  DYRouter.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYRouter.h"

#import "UIViewController+Router.h"

@interface DYRouter ()
//@property(nonatomic,strong) NSMutableDictionary * classMap;
//@property(nonatomic,strong) NSMutableDictionary * funcMap;
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
        //self.classMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)openPageWithOrgin:(UIViewController *)orginVC{
    [self openPageViewOrgin:orginVC parmaters:nil routerCallback:nil];
}
- (void)openPageViewOrgin:(UIViewController *)orginVC parmaters:(id)pars routerCallback:(void (^)(id))callback{
    if (!str) {
        NSLog(@"urlString不合法");
        return;
    }
    NSURL * url = [NSURL URLWithString:str];
    if (!url) {
        NSLog(@"url 解析失败");
        return;
    }
    [self openWithURL:url parmaters:pars dataCallback:callback];

}

- (void)openWithURLString:(NSString *)str parmaters:(NSDictionary *)pars dataCallback:(void (^)(id))callback{
   }

-(void)openWithURL:(NSURL *)url parmaters:(NSDictionary *)pars dataCallback:(void (^)(id))callback{
    
}

#pragma mark - private methods

- (void) parseURL:(NSURL *)url parmaters:(NSDictionary *)pars dataCallback:(void(^)(NSDictionary * object)) callback{
    NSString * scheme = url.scheme;
    NSString * host = url.host;
    NSString * fragment = url.fragment;
    NSString * queryString = url.query;
    if ([scheme isEqualToString:@"YG"]) {       //决定页面跳转
        if (!host) {
            NSLog(@"路由host不能为空");
            return;
        }
        if (host) {                             //决定页面样式
            host = [NSString stringWithFormat:@"%@%@Controller",scheme,host];
            Class class = NSClassFromString(host);
            if (!class) {
                NSLog(@"当前路由所指向的页面不存在");
            }
            UIViewController * vc = [[class alloc] init];
            if (pars) {
                vc.launchData = pars;
            }
            if (callback) {
                vc.routerBlock = [callback copy];
            }
        }
        if (!queryString) {                    //决定页面展示的内容
            
        }
        if (!fragment) {                        //nav正常跳转
            
        } else {                                //自定义转场跳转
            if ([fragment isEqualToString:@"M"]) {
                return;
            }
            if ([fragment isEqualToString:@"MC"]) {
                return;
            }
            if ([fragment isEqualToString:@"NC"]) {
                return;
            }
        }
       
    }

}



@end
