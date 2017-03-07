//
//  DYHTTPRequest.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYHTTPRequest.h"

@implementation DYHTTPRequest

+(instancetype)defaultRequestWithParameters:(NSDictionary *)parameters{
    DYHTTPRequest * request = [[DYHTTPRequest alloc] init];
    request.requestBody = parameters;
    return request;
}

-(instancetype)init{
    if (self = [super init]) {
        self.timeout = 30;
        self.requestType = DYRequsetTypeDefaultPost;
        self.requestHeader = @{@"Content-Type": @"application/x-www-form-urlencoded;charset=utf-8"};
        self.retryTimes = 1;
    }
    return self;
}

@end
