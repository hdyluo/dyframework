//
//  DYHTTPManager.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYHTTPBaseRequest.h"
#import "AFNetworking.h"

typedef void(^DYHttpCompletionCallback)(NSError * _Nullable err,id _Nullable object);

@interface DYHTTPManager : NSObject

+ (instancetype _Nullable )sharedManager;

- (NSURLSessionDataTask *_Nullable)queryWithRequest:(DYHTTPBaseRequest *_Nullable)request
                                         completion:(DYHttpCompletionCallback _Nullable )block;

//TODO:对于上传和批量上传操作可以考虑使用多session来操作。查询数据操作限制于共享session
- (nullable NSURLSessionDataTask *)uploadWithRequest:(NSString *_Nullable)URLString
                                          parameters:(nullable id)parameters
                           constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> _Nullable formData))block
                                            progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                            callback:(void (^_Nullable)(NSURLSessionDataTask * _Nullable task,id _Nullable responseObject,NSError * _Nullable err)) callback;

@end
