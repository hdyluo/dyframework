//
//  YGCodeScanner.h
//  QMSPad
//
//  Created by 黄德玉 on 2017/4/7.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YGCodeScannerDelegate <NSObject>

@required

- (void)scannerOverWith:(NSString *)str;

@end

@interface YGCodeScanner : NSObject

@property (nonatomic,weak) id<YGCodeScannerDelegate> delegate;

/**
 开始扫码

 @param view 扫码所处的视图
 @param rect 扫码热点区域
 @param block 错误回调
 */
- (void)startScannerInView:(UIView *)view interestRect:(CGRect)rect errorBlock:(void (^)(NSError *)) block;

- (void)cancelScanner;

@end
