//
//  ReactCocoaViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/9/10.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ReactCocoaViewController.h"
#import <ReactiveCocoa.h>
@interface ReactCocoaViewController ()

@end

@implementation ReactCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"你好"];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    [signal subscribeNext:^(NSString *x) {
        NSLog(@"======%@",x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
