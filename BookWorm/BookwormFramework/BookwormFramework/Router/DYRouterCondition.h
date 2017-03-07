//
//  DYRouterCondition.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,DYRouterTranslateType){
    PUSH = 0,
    POP,
    PRESENT,
    DISMISS
};

@interface DYRouterCondition : NSObject
@property(nonatomic,strong) NSURL * url;
@property(nonatomic,copy)   NSString * urlString;
@property(nonatomic,assign) BOOL needLogin;
@property(nonatomic,assign) BOOL needCacheRouter;

@property(nonatomic,copy) NSString * className;

@property(nonatomic,assign) DYRouterTranslateType translateType;
@property(nonatomic,copy) NSDictionary * parameters;

//url格式  yg://home?body={par1:xxx,par2:xxx}        home 是className body里的json是参数列表 
+(instancetype)defaultConditionWithUrlString:(NSString * )urlStr;
@end
