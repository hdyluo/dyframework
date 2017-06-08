//
//  YGInteractor.m
//  YGTranslation
//
//  Created by 黄德玉 on 2017/3/29.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#import "YGInteractor.h"

@interface YGInteractor ()<UIGestureRecognizerDelegate>{
    CGFloat _percent;               //手势运行的百分比
    CGPoint _startPoint;            //手势开始的位置
}

@property (nonatomic,strong) UIPanGestureRecognizer * panGesture;           //手势

@property (nonatomic,assign) CGFloat edgeSpacing;                           //从边界多少范围内才可以侧滑

@property (nonatomic,assign) YGInteractorDirection direction;               //侧滑方向


@end

@implementation YGInteractor

- (void)dealloc{
    NSLog(@"交互控制器释放");
}

- (instancetype)initWithDirection:(YGInteractorDirection)direction edgeSpacing:(CGFloat)spacing forView:(UIView *)view{
    if (self = [super init]) {
        self.edgeSpacing = spacing;
        self.direction  = direction;
        self.canInteracive = NO;
        self.speedControl = 1;
        self.canOverPercent = .5;
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
        [view addGestureRecognizer:self.panGesture];
    }
    return self;
}

#pragma mark - 手势 action
- (void)panGestureAction:(UIPanGestureRecognizer *)panGesture{
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            _startPoint = [panGesture translationInView:panGesture.view];                       //不能用localtionInView   -------------超级大坑
            _percent = 0;
            self.canInteracive = YES;
            if (self.transitionAction) {
                self.transitionAction();
            }
            break;
        case UIGestureRecognizerStateChanged:{
            [self _calculatePercentWithGesture:panGesture];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            [self _calculateEndWithGesture:panGesture];
            self.canInteracive = NO;
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStatePossible:
            self.canInteracive = NO;
            NSLog(@"这个手势因为些许问题取消了");
            break;
        default:
            break;
    }
}

- (void)_calculatePercentWithGesture:(UIPanGestureRecognizer *)gesture{
    UIView * view = gesture.view;
    CGPoint point = [gesture translationInView:view];
    switch (self.direction) {
        case YGInteractorDirectionTop:
            _percent = (_startPoint.y - point.y) / view.frame.size.height;
            break;
        case YGInteractorDirectionLeft:
            _percent = (_startPoint.x - point.x) / view.frame.size.width;
            break;
        case YGInteractorDirectionBottom:
            _percent = (point.y - _startPoint.y)/ view.frame.size.height;
            break;
        case YGInteractorDirectionRight:
            _percent = (point.x - _startPoint.x) / view.frame.size.width;
            break;
        default:
            break;
    }
    _percent = _percent * self.speedControl;        //根据速率计算当前percent
    
    _percent = _percent < 0 ? 0:_percent;
    
    _percent = _percent > 1 ? 1:_percent;
    
    [self updateInteractiveTransition:_percent];
}

- (void)_calculateEndWithGesture:(UIPanGestureRecognizer *)gesture{
    if (_percent > self.canOverPercent) {
        [self finishInteractiveTransition];
    }else{
        [self cancelInteractiveTransition];
    }
}
#pragma mark - 手势 delegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.edgeSpacing <=0) {
        return YES;
    }
    CGPoint startPoint = [gestureRecognizer locationInView:gestureRecognizer.view];
    BOOL canBegin = NO;
    switch (self.direction) {
        case YGInteractorDirectionTop:              //从下向上滑
            if (startPoint.y > self.edgeSpacing) {
                return YES;
            }
            break;
        case YGInteractorDirectionLeft:             //从右向左滑
            if (startPoint.x + self.edgeSpacing > gestureRecognizer.view.frame.size.width) {
                return YES;
            }
            break;
        case YGInteractorDirectionRight:              //从左向右滑
            if (startPoint.x - self.edgeSpacing < 0) {
                return YES;
            }
            break;
        case YGInteractorDirectionBottom:           //从上向下滑
            if (startPoint.y < self.edgeSpacing) {
                return YES;
            }
            break;
        default:
            break;
    }
    return canBegin;
}

@end
