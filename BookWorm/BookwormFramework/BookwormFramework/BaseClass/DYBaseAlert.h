//
//  DYBaseAlert.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYBaseAlert : UIView

-(void)show;
-(void)hideWithBlock:(void(^)(id object))block;
@end
