//
//  UIDevice+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (DYUtils)

+ (double)dy_systemVersion;

@property (nonatomic, readonly) BOOL dy_isPad;
@property (nonatomic, readonly) BOOL dy_isSimulator;
@property (nonatomic, readonly) BOOL dy_canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");
@property (nonatomic, readonly) NSDate *dy_systemUptime;
@property (nonatomic, readonly) int64_t dy_diskSpace;
@property (nonatomic, readonly) int64_t dy_diskSpaceFree;
@property (nonatomic, readonly) int64_t dy_diskSpaceUsed;


#pragma mark - Memory Information

@property (nonatomic, readonly) int64_t dy_memoryTotal;
@property (nonatomic, readonly) int64_t dy_memoryUsed;
@property (nonatomic, readonly) int64_t dy_memoryFree;
@property (nonatomic, readonly) int64_t dy_memoryActive;
@property (nonatomic, readonly) int64_t dy_memoryInactive;
@property (nonatomic, readonly) int64_t dy_memoryWired;
@property (nonatomic, readonly) int64_t dy_memoryPurgable;

#pragma mark - CPU Information

@property (nonatomic, readonly) NSUInteger dy_cpuCount;
@property (nonatomic, readonly) float dy_cpuUsage;

@end

NS_ASSUME_NONNULL_END


