//
//  NSHTTPCookieStorage+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPCookieStorage (DYUtils)

- (void)dy_saveCookie;
- (void)dy_loadCookie;

@end
