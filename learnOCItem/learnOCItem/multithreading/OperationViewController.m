//
//  OperationViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/31.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "OperationViewController.h"
#import <Masonry.h>

@interface OperationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSOperationQueue *backQueue = [[NSOperationQueue alloc]init];
    backQueue.maxConcurrentOperationCount = 1;
    [backQueue addOperationWithBlock:^{
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:4]];
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
             self.testLabel.text = @"张三";
        }];
        NSLog(@"%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op1");
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op2");
    }];
  
    [op1 addDependency:op2];
    [backQueue addOperation:op1];
    [backQueue addOperation:op2];
    NSLog(@"op3");
    [backQueue waitUntilAllOperationsAreFinished];
    NSLog(@"执行4");
    
  
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
