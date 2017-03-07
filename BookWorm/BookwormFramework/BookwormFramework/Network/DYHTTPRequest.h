//
//  DYHTTPRequest.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,DYRequsetType) {
    DYRequsetTypeDefaultGet = 0,
    DYRequsetTypeDefaultPost,
    DYRequsetTypeCustomGet,
    DYRequsetTypeCustomPost
};

@interface DYHTTPRequest : NSObject
@property(nonatomic,assign) DYRequsetType           requestType;
@property(nonatomic,assign) NSInteger               timeout;
@property(nonatomic,assign) NSInteger               retryTimes;
@property(nonatomic,strong) NSDictionary *          requestHeader;
@property(nonatomic,strong) NSSet *                 responseType;
@property(nonatomic,copy)   NSString *              urlString;
@property(nonatomic,strong) NSDictionary *          requestBody;

+(instancetype)defaultRequestWithParameters:(NSDictionary *)parameters;

@end
