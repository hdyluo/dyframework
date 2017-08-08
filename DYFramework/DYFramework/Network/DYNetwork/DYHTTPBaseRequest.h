//
//  DYHTTPBaseRequest.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/7.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DYHTTPRequestType) {
    DYHTTPRequestPost = 0,
    DYHTTPRequestGet
};

typedef NSString * (^DYHTTPBodyEncodeBlock)(NSURLRequest *request, id parameters, NSError * *error);    //请求body的编码方式,默认AFN做了URL编码
typedef NSError * (^DYHTTPErrorHandleBlock)(id responseObject);                                         //错误处理的方式
typedef id (^DYHTTPResponseHandleBlock)(id responseObject);                                             //响应处理的方式


@interface DYHTTPBaseRequest : NSObject


@property(nonatomic,assign) DYHTTPRequestType           requestType;            //请求类型，默认Post请求

@property(nonatomic,assign) NSInteger                   timeOut;                //超时时间，默认30s

@property(nonatomic,strong) NSDictionary *              requestHeader;          //请求头，这个是服务约定

@property(nonatomic,strong) NSSet *                     responseSet;            //响应类型，和服务约定

@property(nonatomic,copy)   NSString *                  baseUrlStr;             //请求的URL

@property(nonatomic,strong) id                          parameters;             //请求参数,字典

@property(nonatomic,copy) DYHTTPBodyEncodeBlock         bodyEncodeBlock;        //默认为空

@property (nonatomic,copy) DYHTTPErrorHandleBlock       errorHandleBlock;       //默认为空

@property (nonatomic,copy) DYHTTPResponseHandleBlock    responseHandleBlock;    //默认为空

@end
