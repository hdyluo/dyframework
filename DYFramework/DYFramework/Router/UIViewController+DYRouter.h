//
//  UIViewController+DYRouter.h
//  DYRouter
//
//  Created by 黄德玉 on 2017/6/1.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DYRouter)

@property(nonatomic,copy) void (^dy_routerBlock)(id object);    //给来源模块的数据回调，object为回调数据模型
@property(nonatomic,strong) id  dy_launchData;          //启动模块所需数据模型

@end
