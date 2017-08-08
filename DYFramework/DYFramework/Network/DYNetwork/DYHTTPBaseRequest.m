//
//  DYHTTPBaseRequest.m
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import "DYHTTPBaseRequest.h"

@implementation DYHTTPBaseRequest

- (instancetype)init{
    if (self = [super init]) {
        _requestType                = DYHTTPRequestPost;
        _timeOut                    = 10;
        _requestHeader              = @{@"Content-Type": @"application/x-www-form-urlencoded;charset=utf-8"};
        _responseSet                = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain",nil];
        self.bodyEncodeBlock = ^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
            if ([parameters isKindOfClass:[NSDictionary class]]) {
                NSDictionary * dic = (NSDictionary *)parameters;
                NSError *error;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                NSLog(@"%@", jsonString);
                return jsonString;
            }
            return parameters;
        };
    }
    return self;
}

@end
