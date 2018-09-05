//
//  GCDPracticeViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/18.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "GCDPracticeViewController.h"

@interface GCDPracticeViewController ()

@end

@implementation GCDPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"GCD";
    dispatch_queue_t concurrentQueue = dispatch_queue_create("ljj.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    dispatch_async(concurrentQueue, ^{
         //异步任务+并发队列
    });
    
    dispatch_async(serialQueue, ^{
        //异步任务+串行队列
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
       //异步任务 + 主队列
    });
    
    
    dispatch_sync(serialQueue, ^{
        //同步任务 + 串行队列
        
    });
    dispatch_sync(concurrentQueue, ^{
       //同步任务+ 并发队列
    });
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//       //同步任务 + 主队列
//    });
    //GCD 栅栏
//    [self barrier];
//    [self after];
//    [self group];
//    [self groupEnterAndLeave];
//    [self semaphoreSync];
    
  
}


//多线程问题1
-(void)questionOne{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1111");
        [self performSelector:@selector(test) withObject:self afterDelay:0.1f];
        NSLog(@"2222");
    });
}
-(void)test{
    NSLog(@"3333333");
}
///////////////////////////////
//问题2
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        NSLog(@"1111111111");
    }];
    [thread start];
    [self performSelector:@selector(test) onThread:thread withObject:self waitUntilDone:.1f];
}


-(void)syncConcurrent{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");
    
}
-(void)barrier{
    dispatch_queue_t queue = dispatch_queue_create("ljj2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_barrier_sync(queue, ^{
        // 追加任务 barrier
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
}

/**
 dispatch_after
 */
-(void)after{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2.0秒后异步追加任务代码到主队列，并开始执行
        NSLog(@"after---%@",[NSThread currentThread]);  // 打印当前线程
    });
}

-(void)apply{
    dispatch_queue_t queue = dispatch_queue_create("ljj3", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, queue, ^(size_t index) {
        
    });
}
-(void)group{
    
    dispatch_group_t groupQueue = dispatch_group_create();
    dispatch_group_async(groupQueue, dispatch_get_global_queue(0, 0), ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_group_async(groupQueue, dispatch_get_global_queue(0, 0), ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_group_notify(groupQueue, dispatch_get_global_queue(0, 0), ^{
        // 等前面的异步任务1、任务2都执行完毕后，回到主线程执行下边任务
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
        NSLog(@"group---end");
    });
    
}

-(void)groupEnterAndLeave{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, queue, ^{
        // 等前面的异步操作都执行完毕后，回到主线程.
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
        NSLog(@"group---end");
    });
}

-(void)semaphoreSync{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block int number = 0;
    dispatch_async(queue, ^{
       //追加任务 1
        [NSThread sleepForTimeInterval:2];
        NSLog(@"%@",[NSThread currentThread]);
        number = 100;
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore -- end,number =%zd",number);
}

/**
 线程死锁
 */
-(void)threadLock{
    dispatch_queue_t queue = dispatch_queue_create("www.", DISPATCH_QUEUE_SERIAL);
    NSLog(@"==========1");
    dispatch_async(queue, ^{
        NSLog(@"===========2");
        dispatch_sync(queue, ^{
            NSLog(@"===========3");
        });
        NSLog(@"===========4");
    });
    NSLog(@"===========5");
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
