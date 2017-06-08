//
//  DYRouterState.h
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//任何一个功能模块都可以包装成状态，但是状态必须是实体，如果是类方法，可以不依赖于状态，直接用url标识就行

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DYRouterType) {
    DYRouterTypePage = 1,           //页面跳转的路由
    DYRouterTypeFunc,               //功能模块调用的路由，主要针对于类方法
    DYRouterTypeSingle,             //主要针对于单例
    DYRouterTypeOther               //不能解析的路由类型
};

@interface DYRouterState : NSObject


@property (nonatomic,assign) NSInteger identify;            //状态的唯一标识符，用hash标识

@property (nonatomic,assign) NSInteger tag;                 //状态同名阻止状态，用tag区分

@property (nonatomic,copy) NSString * url;                   //状态url可能一样，但是identify是唯一的,页面的url格式是 DY://home#fragment
                                                             // 函数调用的url格式是：FUNC://modelName/selectorName
                                                             //单例的url格式是：SIG://modelName/singleFunc/selector

@property (nonatomic,copy) NSString * name;                  //状态名字,为控制器名字

@property (nonatomic,weak) id  stateEntity;                  //状态实体，可能是个vc,可能是个单例

@property (nonatomic,assign) DYRouterType routerType;        //路由类型


+ (instancetype)stateWithURLString:(NSString *)urlStr;

@end
