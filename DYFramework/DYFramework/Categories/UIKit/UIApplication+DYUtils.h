//
//  UIApplication+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (DYUtils)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *dy_documentsURL;
@property (nonatomic, readonly) NSString *dy_documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *dy_cachesURL;
@property (nonatomic, readonly) NSString *dy_cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *dy_libraryURL;
@property (nonatomic, readonly) NSString *dy_libraryPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *dy_appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *dy_appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *dy_appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *dy_appBuildVersion;


/// Whether this app is being debugged (debugger attached).
@property (nonatomic, readonly) BOOL dy_isBeingDebugged;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float dy_cpuUsage;



@end

NS_ASSUME_NONNULL_END
