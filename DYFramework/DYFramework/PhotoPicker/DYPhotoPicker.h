//
//  SHPhotoPicker.h
//  Frey
//
//  Created by huangdeyu on 16/4/5.
//  Copyright © 2016年 shcem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^DidFinishTakeMediaCompledBlock)(UIImage *image, NSDictionary *editingInfo);
typedef void (^DidFinishTakeImageBlock)(UIImage *image);

@interface DYPhotoPicker : NSObject


- (void)showOnPickerViewControllerSourceType:(UIImagePickerControllerSourceType)sourceType onViewController:(UIViewController *)viewController allowsEditing:(BOOL)allowsEditing compled:(DidFinishTakeMediaCompledBlock)compled;

- (void)showOnPickerViewControllerOnViewController:(UIViewController *)viewController completion:(DidFinishTakeImageBlock)completion;

@end
