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


@property (nonatomic, readonly) NSURL *dy_documentsURL;
@property (nonatomic, readonly) NSString *dy_documentsPath;

@property (nonatomic, readonly) NSURL *dy_cachesURL;
@property (nonatomic, readonly) NSString *dy_cachesPath;

@property (nonatomic, readonly) NSURL *dy_libraryURL;
@property (nonatomic, readonly) NSString *dy_libraryPath;

@property (nullable, nonatomic, readonly) NSString *dy_appBundleName;

@property (nullable, nonatomic, readonly) NSString *dy_appBundleID;
@property (nullable, nonatomic, readonly) NSString *dy_appVersion;
@property (nullable, nonatomic, readonly) NSString *dy_appBuildVersion;

@property (nonatomic, readonly) BOOL dy_isBeingDebugged;
@property (nonatomic, readonly) int64_t dy_memoryUsage;
@property (nonatomic, readonly) float dy_cpuUsage;



@end

NS_ASSUME_NONNULL_END
