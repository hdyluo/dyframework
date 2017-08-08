//
//  DYSystemDefine.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#ifndef DYSystemDefine_h
#define DYSystemDefine_h



#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

// 设备系统版本号
#define SYSTEM_VERSION  [[UIDevice currentDevice] systemVersion]

// 应用程序版本号
#define APP_VERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;



#endif /* DYSystemDefine_h */
