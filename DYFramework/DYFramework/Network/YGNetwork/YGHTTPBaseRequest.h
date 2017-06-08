//
//  YGHTTPRequest.h
//  Network
//
//  Created by 黄德玉 on 2017/3/10.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,YGHTTPRequestType) {
    YGHTTPRequestPost = 0,
    YGHTTPRequestGet,
    YGHTTPRequestHead
};

typedef NSString * (^YGHTTPBodyEncodeBlock)(NSURLRequest *request, id parameters, NSError * *error);    //请求body的编码方式,默认AFN做了URL编码
typedef NSError * (^YGHTTPErrorHandleBlock)(id responseObject);                                         //错误处理的方式
typedef id (^YGHTTPResponseHandleBlock)(id responseObject);                                             //响应处理的方式


@interface YGHTTPBaseRequest : NSObject

@property(nonatomic,assign) YGHTTPRequestType           requestType;            //请求类型，默认Post请求

@property(nonatomic,assign) NSInteger                   timeOut;                //超时时间，默认30s

@property(nonatomic,strong) NSDictionary *              requestHeader;          //请求头，这个是服务约定

@property(nonatomic,strong) NSSet *                     responseSet;            //响应类型，和服务约定

@property(nonatomic,copy)   NSString *                  baseUrlStr;             //请求的URL

@property(nonatomic,strong) id                          parameters;             //请求参数,字典

@property(nonatomic,copy) YGHTTPBodyEncodeBlock         bodyEncodeBlock;        //默认为空

@property (nonatomic,copy) YGHTTPErrorHandleBlock       errorHandleBlock;       //默认为空

@property (nonatomic,copy) YGHTTPResponseHandleBlock    responseHandleBlock;    //默认为空

@end
