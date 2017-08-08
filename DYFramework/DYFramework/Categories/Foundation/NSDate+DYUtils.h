//
//  NSDate+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (DYUtils)

@property (nonatomic, readonly) NSInteger dy_year;
@property (nonatomic, readonly) NSInteger dy_month;
@property (nonatomic, readonly) NSInteger dy_day;
@property (nonatomic, readonly) NSInteger dy_hour;
@property (nonatomic, readonly) NSInteger dy_minute;
@property (nonatomic, readonly) NSInteger dy_second;
@property (nonatomic, readonly) NSInteger dy_nanosecond;
@property (nonatomic, readonly) NSInteger dy_weekday;
@property (nonatomic, readonly) NSInteger dy_weekdayOrdinal;
@property (nonatomic, readonly) NSInteger dy_weekOfMonth;
@property (nonatomic, readonly) NSInteger dy_weekOfYear;
@property (nonatomic, readonly) NSInteger dy_yearForWeekOfYear;
@property (nonatomic, readonly) NSInteger dy_quarter;
@property (nonatomic, readonly) BOOL dy_isLeapMonth;
@property (nonatomic, readonly) BOOL dy_isLeapYear;
@property (nonatomic, readonly) BOOL dy_isToday;
@property (nonatomic, readonly) BOOL dy_isYesterday;


- (nullable NSDate *)dy_dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)dy_dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)dy_dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)dy_dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)dy_dateByAddingHours:(NSInteger)hours;


- (nullable NSDate *)dy_dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)dy_dateByAddingSeconds:(NSInteger)seconds;
- (nullable NSString *)dy_stringWithFormat:(NSString *)format;
- (nullable NSString *)dy_stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;

- (nullable NSString *)dy_stringWithISOFormat;
+ (nullable NSDate *)dy_dateWithString:(NSString *)dateString format:(NSString *)format;
+ (nullable NSDate *)dy_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;
+ (nullable NSDate *)dy_dateWithISOFormatString:(NSString *)dateString;

@end

NS_ASSUME_NONNULL_END
