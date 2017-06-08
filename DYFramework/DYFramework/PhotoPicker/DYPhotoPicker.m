//
//  SHPhotoPicker.m
//  Frey
//
//  Created by huangdeyu on 16/4/5.
//  Copyright © 2016年 shcem. All rights reserved.
//

#import "DYPhotoPicker.h"

@interface DYPhotoPicker()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, copy) DidFinishTakeMediaCompledBlock didFinishTakeMediaCompled;
@end

@implementation DYPhotoPicker

- (void)dealloc {
    self.didFinishTakeMediaCompled = nil;
}

- (void)showOnPickerViewControllerSourceType:(UIImagePickerControllerSourceType)sourceType onViewController:(UIViewController *)viewController allowsEditing:(BOOL)allowsEditing compled:(DidFinishTakeMediaCompledBlock)compled {
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        compled(nil, nil);
        return;
    }
    self.didFinishTakeMediaCompled = [compled copy];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.navigationBar.barStyle = UIBarStyleBlack;
    imagePickerController.editing = YES;
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = allowsEditing;
    imagePickerController.sourceType = sourceType;
    [viewController presentViewController:imagePickerController animated:YES completion:NULL];
}

- (void)showOnPickerViewControllerOnViewController:(UIViewController *)viewController completion:(DidFinishTakeImageBlock)completion {
    [self showOnPickerViewControllerSourceType:UIImagePickerControllerSourceTypePhotoLibrary onViewController:viewController allowsEditing:YES compled: ^(UIImage *image, NSDictionary *editingInfo) {
        UIImage *edited = editingInfo[UIImagePickerControllerEditedImage];
        UIImage *origin = editingInfo[UIImagePickerControllerOriginalImage];
        UIImage *finalImage = edited ? edited : (origin ? origin : image);
        if (completion) {
            completion(finalImage);
        }
    }];
}

- (void)dismissPickerViewController:(UIImagePickerController *)picker {
    __weak typeof(self) weakSelf = self;
    [picker dismissViewControllerAnimated : YES completion : ^{
        weakSelf.didFinishTakeMediaCompled = nil;
    }];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if (self.didFinishTakeMediaCompled) {
        UIImage *edited = info[UIImagePickerControllerEditedImage];
        UIImage *origin = info[UIImagePickerControllerOriginalImage];
        UIImage *finalImage = edited ? edited : origin;
        self.didFinishTakeMediaCompled(finalImage, info);
    }
    [self dismissPickerViewController:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissPickerViewController:picker];
}


@end
