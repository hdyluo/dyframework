//
//  DYCacheManager.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/7.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DYCacheMode) {
    DYCacheModeFile = 0,
    DYCacheModeUserDefault,
    DYCacheModeCode,     //序列化缓存
    DYCacheModeDB
};

@interface DYCacheManager : NSObject
@property(nonatomic,assign) BOOL isUserCache;
@property(nonatomic,assign) BOOL isVersionCache;

@property(nonatomic,assign) long life;  //缓存周期的管理参考yycache和sdwebImage
@property(nonatomic,assign) DYCacheMode cacheMode;


+(instancetype)fileCache;

+(instancetype)userDefault;

+(instancetype)dbCache;



@end
