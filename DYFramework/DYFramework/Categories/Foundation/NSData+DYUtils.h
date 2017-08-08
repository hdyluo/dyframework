//
//  NSData+DYUtils.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DYUtils)

- (NSString *)dy_md2String;

- (NSData *)dy_md2Data;

- (NSString *)dy_md4String;

- (NSData *)dy_md4Data;

- (NSString *)dy_md5String;

- (NSData *)dy_md5Data;

- (NSString *)dy_sha1String;

- (NSData *)dy_sha1Data;

- (NSString *)dy_sha224String;

- (NSData *)dy_sha224Data;

- (NSString *)dy_sha256String;

- (NSData *)dy_sha256Data;

- (NSString *)dy_sha384String;

- (NSData *)dy_sha384Data;

- (NSString *)dy_sha512String;

- (NSData *)dy_sha512Data;

- (NSString *)dy_hmacMD5StringWithKey:(NSString *)key;

- (NSData *)dy_hmacMD5DataWithKey:(NSData *)key;

- (NSString *)dy_hmacSHA1StringWithKey:(NSString *)key;

- (NSData *)dy_hmacSHA1DataWithKey:(NSData *)key;

- (NSString *)dy_hmacSHA224StringWithKey:(NSString *)key;

- (NSData *)dy_hmacSHA224DataWithKey:(NSData *)key;

- (NSString *)dy_hmacSHA256StringWithKey:(NSString *)key;

- (NSData *)dy_hmacSHA256DataWithKey:(NSData *)key;

- (NSString *)dy_hmacSHA384StringWithKey:(NSString *)key;

- (NSData *)dy_hmacSHA384DataWithKey:(NSData *)key;

- (NSString *)dy_hmacSHA512StringWithKey:(NSString *)key;

- (NSData *)dy_hmacSHA512DataWithKey:(NSData *)key;

- (NSString *)dy_crc32String;

- (uint32_t)dy_crc32;


#pragma mark - Encrypt and Decrypt

- (nullable NSData *)dy_aes256EncryptWithKey:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)dy_aes256DecryptWithkey:(NSData *)key iv:(nullable NSData *)iv;


#pragma mark - Encode and decode

- (nullable NSString *)dy_utf8String;

- (nullable NSString *)dy_hexString;

+ (nullable NSData *)dy_dataWithHexString:(NSString *)hexString;


- (nullable NSString *)dy_base64EncodedString;

+ (nullable NSData *)dy_dataWithBase64EncodedString:(NSString *)base64EncodedString;

- (nullable id)dy_jsonValueDecoded;


#pragma mark - Inflate and deflate
- (nullable NSData *)dy_gzipInflate;

- (nullable NSData *)dy_gzipDeflate;

- (nullable NSData *)dy_zlibInflate;

- (nullable NSData *)dy_zlibDeflate;



#pragma mark - 缓存
- (void)dy_saveDataCacheWithIdentifier:(NSString *)identifier;

+ (NSData *)dy_getDataCacheWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
