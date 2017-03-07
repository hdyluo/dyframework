//
//  DYBaseAlert.m
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/3/6.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "DYBaseAlert.h"


@interface DYBaseAlert ()
@property(nonatomic,strong) UIWindow * containWindow;
@end

@implementation DYBaseAlert

-(instancetype)init{
    if (self = [super init]) {
        [self.containWindow addSubview:self];
    }
    return self;
}


-(void)show{
    [self.containWindow makeKeyAndVisible];
}

-(void)hideWithBlock:(void (^)(id))block{
    self.containWindow.hidden = YES;
    if (block) {
        block(nil);
    }
}

#pragma mark - 初始化

-(UIWindow *)containWindow{
    if (!_containWindow) {
        _containWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _containWindow.windowLevel = UIWindowLevelAlert - 1;
        _containWindow.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    }
    return _containWindow;
}

@end
