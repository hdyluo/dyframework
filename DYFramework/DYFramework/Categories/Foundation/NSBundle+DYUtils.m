//
//  NSBundle+DYUtils.m
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import "NSBundle+DYUtils.h"
#import <UIKit/UIKit.h>

@implementation NSBundle (DYUtils)

- (NSString*)dy_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)dy_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self dy_appIconPath]] ;
    return appIcon;
}

@end
