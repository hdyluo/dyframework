//
//  DYHTTPManager.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>
#import "DYHTTPRequest.h"
#import "DYHTTPResponse.h"

@interface DYHTTPManager : NSObject

+(instancetype)sharedManager;

-(void)cancelTask:(NSURLSessionDataTask *)task;

@end
