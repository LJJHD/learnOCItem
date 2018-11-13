//
//  NSThreadViewController.m
//  learnOCItem
//
//  Created by ljj on 2018/11/13.
//  Copyright © 2018 shanghaiDouke.com. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
//    [thread start];
    
//2、 创建线程后自动启动线程
//    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
    
//    3、隐式创建并启动线程
//    [self performSelectorInBackground:@selector(run) withObject:nil];
}

-(void)run{
    NSLog(@"执行线程=====%@",[NSThread currentThread]);
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
