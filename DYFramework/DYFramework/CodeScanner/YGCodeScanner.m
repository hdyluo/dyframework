//
//  YGCodeScanner.m
//  QMSPad
//
//  Created by 黄德玉 on 2017/4/7.
//
//

#import "YGCodeScanner.h"
#import <AVFoundation/AVFoundation.h>
#import "YGSystemDefine.h"

static  NSString * const codeScannerErrorDomain = @"code_scanner_error_domain";

@interface YGCodeScanner ()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *session;

@property (nonatomic, strong) AVCaptureVideoPreviewLayer * previewLayer;

@property (nonatomic, strong) AVCaptureDevice * device;

@property (nonatomic, strong) AVCaptureDeviceInput * input;

@property (nonatomic, strong) AVCaptureMetadataOutput * output;

@end

@implementation YGCodeScanner

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init{
    if (self = [super init]) {
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark - public methods

- (void)startScannerInView:(UIView *)view interestRect:(CGRect)rect errorBlock:(void (^)(NSError *))block{
    //获取摄像设备
    if (!self.device) {
        NSError * err = [NSError errorWithDomain:codeScannerErrorDomain code:-601 userInfo:@{NSLocalizedDescriptionKey:@"打开相机失败"}];
        if (block) {
            block(err);
        }
        DLog(@"获取摄像设备失败");
        return;
    }
    //创建输入流
    if (!self.input) {
        NSError * err = [NSError errorWithDomain:codeScannerErrorDomain code:-602 userInfo:@{NSLocalizedDescriptionKey:@"创建输入流失败"}];
        if (block) {
            block(err);
        }
        DLog(@"创建输入流失败");
        return;
    }
    if (![self.session canAddInput:self.input]) {
        NSError * err = [NSError errorWithDomain:codeScannerErrorDomain code:-603 userInfo:@{NSLocalizedDescriptionKey:@"添加输入流失败"}];
        if (block) {
            block(err);
        }
        DLog(@"添加输入流失败");
        return;
    }
    [self.session addInput:self.input];
    
    if (![self.session canAddOutput:self.output]) {
        NSError * err = [NSError errorWithDomain:codeScannerErrorDomain code:-603 userInfo:@{NSLocalizedDescriptionKey:@"添加输出流失败"}];
        if (block) {
            block(err);
        }
        DLog(@"添加输出流失败");
        return;
    }
    [self.session addOutput:self.output];
    //self.output.rectOfInterest = CGRectMake(.5 - 150.0 / SCREEN_WIDTH, .5 - 150.0 / SCREEN_HEIGHT, 300.0 / SCREEN_WIDTH, 300.0 / SCREEN_WIDTH);
    
    //这种，扫描条形码
     self.output.metadataObjectTypes = @[AVMetadataObjectTypeEAN13Code,
                                         AVMetadataObjectTypeEAN8Code,
                                         AVMetadataObjectTypeCode128Code,
                                         AVMetadataObjectTypeCode39Code,
                                         AVMetadataObjectTypeCode93Code];
    self.previewLayer.frame = view.bounds;
    [view layoutIfNeeded];
    [view.layer insertSublayer: self.previewLayer atIndex:0];
//#ifdef DEBUG
//    UIView * testView = [[UIView alloc] initWithFrame:rect];
//    testView.layer.borderColor = [UIColor blueColor].CGColor;
//    testView.layer.borderWidth = onePix;
//    [view addSubview:testView];
//#endif
    //开始捕获图像:
    [self.session startRunning];
    
    CGRect intertRect = [self.previewLayer metadataOutputRectOfInterestForRect:rect];
  //  CGRect layerRect = [self.previewLayer rectForMetadataOutputRectOfInterest:intertRect];
    self.output.rectOfInterest = intertRect;
    DLog(@"扫码的热点区域是%@",NSStringFromCGRect(self.output.rectOfInterest));
}

- (void)cancelScanner{
    [self.session stopRunning];
    [self.session removeInput:self.input];
    [self.session removeOutput:self.output];
    [self.previewLayer removeFromSuperlayer];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - 扫面结果在这个代理方法里获取到
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        [self cancelScanner];
        AVMetadataMachineReadableCodeObject *metaDataObject = [metadataObjects objectAtIndex:0];
        //输出扫描字符串:
        DLog(@"%@", metaDataObject.stringValue);
        if ([self.delegate respondsToSelector:@selector(scannerOverWith:)]) {
            [self.delegate scannerOverWith:[metaDataObject stringValue]];
        }
    }
}

#pragma mark - notification
- (void)orientationChanged:(NSNotification *)notification{
    UIInterfaceOrientation orientation =  [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        [self.previewLayer connection].videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
    }
    if (orientation == UIInterfaceOrientationLandscapeRight) {
        [self.previewLayer connection].videoOrientation = AVCaptureVideoOrientationLandscapeRight;
    }
}

#pragma mark - 初始化

- (AVCaptureSession *)session{
    if (!_session) {
        _session  = [[AVCaptureSession alloc] init];
        [_session setSessionPreset:AVCaptureSessionPresetHigh];
    }
    return _session;
}

- (AVCaptureDevice *)device{
    if (!_device) {
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    return _device;
}

- (AVCaptureDeviceInput *)input{
    if (!_input) {
        _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    }
    return _input;
}

- (AVCaptureMetadataOutput *)output{
    if (!_output) {
        _output = [[AVCaptureMetadataOutput alloc] init];
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
    }
    return _output;
}

- (AVCaptureVideoPreviewLayer *)previewLayer{
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        UIInterfaceOrientation orientation =  [UIApplication sharedApplication].statusBarOrientation;
        if (orientation == UIInterfaceOrientationLandscapeLeft) {
            [_previewLayer connection].videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
        }
        if (orientation == UIInterfaceOrientationLandscapeRight) {
            [_previewLayer connection].videoOrientation = AVCaptureVideoOrientationLandscapeRight;
        }
    }
    return _previewLayer;
}



@end
