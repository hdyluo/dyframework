//
//  DYBaseViewController.m
//  DYFramework
//
//  Created by 黄德玉 on 2017/6/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import "DYBaseViewController.h"
#import "DYSystemDefine.h"

@interface DYBaseViewController ()

@property (nonatomic, strong) NSMutableArray *tasks;
@end

@implementation DYBaseViewController

- (void)dealloc{
    DLog(@"%@释放",NSStringFromClass([self class]));
    if (self.tasks && self.tasks.count > 0) {
        for (NSURLSessionTask *task in self.tasks) {
            [task cancel];
        }
    }
}

- (instancetype)init {
    if (self = [super init]) {
        self.tasks = [NSMutableArray array];
    }
    return self;
}

- (void)showBackArrow {
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        UIImage * image = [[UIImage imageNamed:@"navigation-back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    }
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showBackArrow];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.fd_willAppearInjectBlock) {
        self.fd_willAppearInjectBlock(self, animated);
    }

}

@end
