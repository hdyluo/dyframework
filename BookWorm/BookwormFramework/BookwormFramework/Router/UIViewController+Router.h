//
//  UIViewController+Router.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/17.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Router)
@property(nonatomic,copy) id (^callback)(NSDictionary * dic);
@property(nonatomic,strong) NSDictionary * extraParameters;
@end
