//
//  UIViewController+Router.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Router)
@property(nonatomic,copy) id (^routerBlock)(NSDictionary * dic);    //用户vc和VC之间的通信
@property(nonatomic,strong) NSDictionary * launchData;          //启动VC所需数据结构
@end
