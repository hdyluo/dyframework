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

/// Whether the device is iPad/iPad mini.
@property (nonatomic, readonly) BOOL dy_isPad;

/// Whether the device is a simulator.
@property (nonatomic, readonly) BOOL dy_isSimulator;

/// Wherher the device can make phone calls.
@property (nonatomic, readonly) BOOL dy_canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");


/// The System's startup time.
@property (nonatomic, readonly) NSDate *dy_systemUptime;

#pragma mark - Disk Space

@property (nonatomic, readonly) int64_t dy_diskSpace;

/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_diskSpaceFree;

/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_diskSpaceUsed;


#pragma mark - Memory Information
///=============================================================================
/// @name Memory Information
///=============================================================================

/// Total physical memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryTotal;

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryUsed;

/// Free memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryFree;

/// Acvite memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryActive;

/// Inactive memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryInactive;

/// Wired memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryWired;

/// Purgable memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t dy_memoryPurgable;

#pragma mark - CPU Information

/// Avaliable CPU processor count.
@property (nonatomic, readonly) NSUInteger dy_cpuCount;

/// Current CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float dy_cpuUsage;

@end

NS_ASSUME_NONNULL_END


