//
//  YGHTTPManager.h
//  Network
//
//  Created by 黄德玉 on 2017/3/10.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGHTTPBaseRequest.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^YGHttpCompletionCallback)( NSError * _Nullable  err,_Nullable id object);

@interface YGHTTPManager : NSObject


+ (instancetype)sharedManager;

- (NSURLSessionDataTask *)queryWithRequest:(YGHTTPBaseRequest *)request
                                completion:(YGHttpCompletionCallback)block;

- (nullable NSURLSessionDataTask *)uploadWithRequest:(NSString *)URLString
                                          parameters:(nullable id)parameters
                           constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                                            progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                            callback:(void (^)(NSURLSessionDataTask * task,id responseObject,NSError *err)) callback;


- (YGHTTPManager *)startWithSerialRequest:(YGHTTPBaseRequest *)request completion:(YGHttpCompletionCallback)block;

- (YGHTTPManager * (^)(YGHTTPBaseRequest * request,YGHttpCompletionCallback block))next;

@end

NS_ASSUME_NONNULL_END
