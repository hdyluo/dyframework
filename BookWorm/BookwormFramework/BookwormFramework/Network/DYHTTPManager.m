//
//  DYHTTPManager.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYHTTPManager.h"


@interface DYHTTPManager ()
@property(strong) AFHTTPSessionManager * sessionManager;
@end

@implementation DYHTTPManager

+(instancetype)sharedManager{
    static DYHTTPManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DYHTTPManager alloc] init];
    });
    return manager;
}

-(instancetype)init{
    if (self = [super init]) {
        self.sessionManager = [AFHTTPSessionManager manager];
    }
    return self;
}

-(void)cancelTask:(NSURLSessionDataTask *)task{
    if (task.state == NSURLSessionTaskStateRunning || task.state == NSURLSessionTaskStateSuspended) {
        [task cancel];
    }
}


-(void)queryWithRequest:(DYHTTPRequest *)request callback:(id)callback{
    
}
@end
