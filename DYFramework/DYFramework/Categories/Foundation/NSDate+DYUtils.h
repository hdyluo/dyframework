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

@property (nonatomic, readonly) NSInteger dy_year; ///< Year component
@property (nonatomic, readonly) NSInteger dy_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger dy_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger dy_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger dy_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger dy_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger dy_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger dy_weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger dy_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger dy_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger dy_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger dy_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger dy_quarter; ///< Quarter component
@property (nonatomic, readonly) BOOL dy_isLeapMonth; ///< Weather the month is leap month
@property (nonatomic, readonly) BOOL dy_isLeapYear; ///< Weather the year is leap year
@property (nonatomic, readonly) BOOL dy_isToday; ///< Weather date is today (based on current locale)
@property (nonatomic, readonly) BOOL dy_isYesterday; ///< Weather date is yesterday (based on current locale)


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
