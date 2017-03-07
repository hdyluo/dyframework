//
//  DYRouter.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DYRouterCondition;
typedef id (^routerCallback)(NSDictionary *);
@interface DYRouter : NSObject
+(instancetype)sharedInstance;

-(void)routerWithCondition:(DYRouterCondition *) condition;

-(void)routerWithCondition:(DYRouterCondition *)condition callback:(routerCallback) callback;

-(void)invokeWithCondition:(DYRouterCondition *)condition callback:(routerCallback) callback;

@end
