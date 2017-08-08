//
//  DYHTTPManager.m
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import "DYHTTPManager.h"

typedef void (^DYHTTPSuccessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void (^DYHTTTPErrorBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);

@interface DYHTTPManager ()

@property (strong,nonatomic) AFHTTPSessionManager * sessionManager;

@end

@implementation DYHTTPManager



+ (instancetype)sharedManager{
    static DYHTTPManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DYHTTPManager alloc] init];
        manager.sessionManager = [AFHTTPSessionManager manager];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        self.sessionManager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (NSURLSessionDataTask *)queryWithRequest:(DYHTTPBaseRequest *)request
                                completion:(DYHttpCompletionCallback)block{
    [self _dealWithRequest:request];
    DYHTTPSuccessBlock successBlock = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError * error = nil;
        if (request.errorHandleBlock) {
            error = request.errorHandleBlock(responseObject);
        }
        if (error) {
            if (block) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(error,nil);
                });
            }
            return;
        }
        id response = responseObject;
        if (request.responseHandleBlock) {
            response = request.responseHandleBlock(responseObject);
        }
        if (block) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(nil,response);
            });
        }
    };
    DYHTTTPErrorBlock errorBlock = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code != NSURLErrorCancelled) {
            if (block) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(error,nil);
                });
            }
        }
    };
    switch (request.requestType) {
        case DYHTTPRequestGet:
            return [self.sessionManager GET:request.baseUrlStr
                                 parameters:request.parameters
                                   progress:nil
                                    success:successBlock
                                    failure:errorBlock
                    ];
            break;
        case DYHTTPRequestPost:
            return [self.sessionManager POST:request.baseUrlStr
                                  parameters:request.parameters
                                    progress:nil
                                     success:successBlock
                                     failure:errorBlock
                    ];
            break;
            
            break;
        default:
            break;
    }
    return nil;
}

- (NSURLSessionTask *)uploadWithRequest:(NSString *)URLString
                             parameters:(id)parameters
              constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
                               progress:(void (^)(NSProgress *))up
                               callback:(void (^)(NSURLSessionDataTask *, id, NSError *))callback{
    return [self.sessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        block(formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        up(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        callback(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(task,nil,error);
    }];
}



#pragma mark - private methods

- (void)_dealWithRequest:(DYHTTPBaseRequest *)request{
    
    if (request.responseSet) {
        self.sessionManager.responseSerializer.acceptableContentTypes = request.responseSet;
    }
    
    if (request.timeOut) {
        self.sessionManager.requestSerializer.timeoutInterval = request.timeOut;
    }
    
    if (request.requestHeader) {
        [request.requestHeader enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.sessionManager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    [self.sessionManager.requestSerializer setQueryStringSerializationWithBlock:request.bodyEncodeBlock];
}



@end
