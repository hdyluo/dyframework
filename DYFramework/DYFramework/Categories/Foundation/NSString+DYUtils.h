//
//  NSString+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSString (DYUtils)

- (nullable NSString *)dy_md2String;

- (nullable NSString *)dy_md4String;

- (nullable NSString *)dy_md5String;

- (nullable NSString *)dy_sha1String;

- (nullable NSString *)dy_sha224String;

- (nullable NSString *)dy_sha256String;

- (nullable NSString *)dy_sha384String;

- (nullable NSString *)dy_sha512String;

- (nullable NSString *)dy_hmacMD5StringWithKey:(NSString *)key;

- (nullable NSString *)dy_hmacSHA1StringWithKey:(NSString *)key;

- (nullable NSString *)dy_hmacSHA224StringWithKey:(NSString *)key;

- (nullable NSString *)dy_hmacSHA256StringWithKey:(NSString *)key;

- (nullable NSString *)dy_hmacSHA384StringWithKey:(NSString *)key;

- (nullable NSString *)dy_hmacSHA512StringWithKey:(NSString *)key;

- (nullable NSString *)dy_crc32String;


#pragma mark - Encode and decode

- (nullable NSString *)dy_base64EncodedString;

+ (nullable NSString *)dy_stringWithBase64EncodedString:(NSString *)base64EncodedString;

- (NSString *)dy_stringByURLEncode;

- (NSString *)dy_stringByURLDecode;

- (NSString *)dy_stringByEscapingHTML;

#pragma mark - Drawing

- (CGSize)dy_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;


- (CGFloat)dy_widthForFont:(UIFont *)font;


- (CGFloat)dy_heightForFont:(UIFont *)font width:(CGFloat)width;


#pragma mark - Regular Expression

- (BOOL)dy_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;


- (void)dy_enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;


- (NSString *)dy_stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement;


#pragma mark - Utilities

+ (NSString *)dy_stringWithUUID;

+ (NSString *)dy_stringWithUTF32Char:(UTF32Char)char32;

+ (NSString *)dy_stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length;

- (void)dy_enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block;

- (NSString *)dy_stringByTrim;

- (NSString *)dy_stringByAppendingNameScale:(CGFloat)scale;

- (NSString *)dy_stringByAppendingPathScale:(CGFloat)scale;

- (CGFloat)dy_pathScale;

/**
 nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 */
- (BOOL)dy_isNotBlank;


- (BOOL)dy_containsString:(NSString *)string;


- (BOOL)dy_containsCharacterSet:(NSCharacterSet *)set;




- (NSData *)dy_dataValue;


- (NSRange)dy_rangeOfAll;


- (id)dy_jsonValueDecoded;

+ (NSString *)dy_stringNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
