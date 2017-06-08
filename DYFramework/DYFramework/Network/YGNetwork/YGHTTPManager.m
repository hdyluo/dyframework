//
//  YGHTTPManager.m
//  Network
//
//  Created by 黄德玉 on 2017/3/10.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "YGHTTPManager.h"

typedef YGHTTPManager * (^nextTaskBlock)(YGHTTPBaseRequest * request,YGHttpCompletionCallback callback);

typedef void (^YGHTTPSuccessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void (^YGHTTTPErrorBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);

static dispatch_queue_t url_serial_queue() {
    static dispatch_queue_t yg_url_serial_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        yg_url_serial_queue = dispatch_queue_create("com.yiguo.url.queue", DISPATCH_QUEUE_SERIAL);
    });
    
    return yg_url_serial_queue;
}

@interface YGHTTPManager ()
@property(strong) AFHTTPSessionManager * sessionManager;
@property(nonatomic,assign) BOOL canNextRun;

@end

@implementation YGHTTPManager

+ (instancetype)sharedManager{
    static YGHTTPManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YGHTTPManager alloc] init];
        manager.sessionManager = [AFHTTPSessionManager manager];
        //        NSString * const AFURLSessionDownloadTaskDidFailToMoveFileNotification
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(sessionTaskDidResume:) name:AFNetworkingTaskDidResumeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(sessionTaskDidCompleted:) name:AFNetworkingTaskDidCompleteNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(sessionTaskDidSuspend:) name:AFNetworkingTaskDidSuspendNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(sessionTaskDidInvalidate:) name:AFURLSessionDidInvalidateNotification object:nil];
    });
    return manager;
}

- (NSURLSessionDataTask *)queryWithRequest:(YGHTTPBaseRequest *)request
                                completion:(YGHttpCompletionCallback)block{
    [self _dealWithRequest:request];
    YGHTTPSuccessBlock successBlock = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError * error = nil;
        if (request.errorHandleBlock) {
            error = request.errorHandleBlock(responseObject);
        }
        if (error) {
            if (block) {
                block(error,nil);
            }
            return;
        }
        id response = responseObject;
        if (request.responseHandleBlock) {
            response = request.responseHandleBlock(responseObject);
        }
        if (block) {
            block(nil,response);
        }
    };
    YGHTTTPErrorBlock errorBlock = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code != NSURLErrorCancelled) {
            if (block) {
                block(error,nil);
            }
        }
    };
    switch (request.requestType) {
        case YGHTTPRequestGet:
            return [self.sessionManager GET:request.baseUrlStr
                                 parameters:request.parameters
                                   progress:nil
                                    success:successBlock
                                    failure:errorBlock
                    ];
            break;
        case YGHTTPRequestPost:
            return [self.sessionManager POST:request.baseUrlStr
                                  parameters:request.parameters
                                    progress:nil
                                     success:successBlock
                                     failure:errorBlock
                    ];
            break;
        case YGHTTPRequestHead:
            //            return [self.sessionManager HEAD:request.baseUrlStr
            //                                  parameters:request.parameters
            //                                     success:successBlock
            //                                     failure:errorBlock];
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

- (YGHTTPManager *)startWithSerialRequest:(YGHTTPBaseRequest *)request completion:(YGHttpCompletionCallback)block{
    self.canNextRun = NO;
    __weak typeof(self) weakSelf = self;
    dispatch_sync(url_serial_queue(), ^{
        [weakSelf queryWithRequest:request completion:^(NSError *err, id object) {
            block(err,object);
            if (!err) {
                weakSelf.canNextRun = YES;
            }
        }];
    });
    return self;
}

- (YGHTTPManager *(^)(YGHTTPBaseRequest *, YGHttpCompletionCallback))next{
    __weak typeof(self) weakSelf = self;
    return ^id(YGHTTPBaseRequest * request,YGHttpCompletionCallback callback){
        if (weakSelf.canNextRun) {
            dispatch_sync(url_serial_queue(), ^{
                [weakSelf queryWithRequest:request completion:^(NSError *err, id object) {
                    callback(err,object);
                    if (!err) {
                        weakSelf.canNextRun = YES;
                    }else{
                        weakSelf.canNextRun = NO;
                    }
                }];
            });
        }
        return self;
    };
}


#pragma mark - notification

- (void)sessionTaskDidResume:(NSNotification *)notification{
    
}
- (void)sessionTaskDidCompleted:(NSNotification *)notification{
}
- (void)sessionTaskDidSuspend:(NSNotification *)notification{
    
}
- (void)sessionTaskDidInvalidate:(NSNotification *)notification{
    
}



#pragma mark - private methods

- (void)_dealWithRequest:(YGHTTPBaseRequest *)request{
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
