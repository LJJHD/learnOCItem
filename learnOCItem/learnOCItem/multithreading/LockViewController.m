//
//  LockViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/31.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "LockViewController.h"
#import <pthread.h>
@interface LockViewController ()
@property (nonatomic, assign) int ticketSurplusCount;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, retain) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) NSCondition *xwCondition;

@property (nonatomic, strong) NSMutableArray *conditionArray;

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _lock = [[NSLock alloc]init];
    _semaphore = dispatch_semaphore_create(1);
    _condition = [[NSCondition alloc]init];
  
//    [self initTicketStatusNotSave];
//    [self condition2];
    //线程锁死
    [self threadLock];
    NSConditionLock
}

/**
 * 非线程安全：不使用 semaphore
 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 */
- (void)initTicketStatusNotSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketCondition];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketCondition];
    });
}

/**
 * 售卖火车票(NSlock)
 */
- (void)saleTicketNotSafe{
    while (1) {
        [self.lock lock];
        if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
        [self.lock unlock];
    }
}

/**
 @synchronized
 */
- (void)saleTicketNotSafesynChor{
    while (1) {
        @synchronized(self){
        if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
      }
    }
}

/**
 semaphore lock
 */
-(void)saleTicketSemaphore{
    while (1) {
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
            if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
                self.ticketSurplusCount--;
                NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
                [NSThread sleepForTimeInterval:0.2];
                
            } else { //如果已卖完，关闭售票窗口
                NSLog(@"所有火车票均已售完");
                break;
            }
        dispatch_semaphore_signal(self.semaphore);
    }
}

/**
 condition lock
 wait 是让当前线程等待
 signal 让等待的线程执行
 */
-(void)saleTicketCondition{
    while (1) {
        [self.condition lock];
        if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
        [self.condition unlock];
    }
}

/**
 condition wait 和 signal 的用发
 */
- (void)condition2 {
    
    self.conditionArray = [NSMutableArray array];
    self.xwCondition = [[NSCondition alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.xwCondition lock];
        if (self.conditionArray.count == 0) {
            NSLog(@"等待制作数组");
            [self.xwCondition wait];
        }
        id obj = self.conditionArray[0];
        NSLog(@"获取对象进行操作:%@",obj);
        [self.xwCondition unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.xwCondition lock];
        id obj = @"极客学伟";
        [self.conditionArray addObject:obj];
        NSLog(@"创建了一个对象:%@",obj);
        [self.xwCondition signal];
        [self.xwCondition unlock];
    });
}

//////////////////////递归锁////////////////
/**
 NSrecursiveLock
 */
-(void)recursiveLock{
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveMethod)(int);
        
        RecursiveMethod = ^(int value) {
            
            [lock lock];
            if (value > 0) {
                
                NSLog(@"value = %d", value);
                sleep(2);
                RecursiveMethod(value - 1);
            }
            [lock unlock];
        };
        
        RecursiveMethod(5);
    });
}

/**
 pthread 实现递归锁
 pthread_mutexattr_t 属性解释：
 PTHREAD_PRIO_NONE：线程的优先级和调度不会受到互斥锁拥有权的影响。
 PTHREAD_PRIO_INHERIT：当高优先级的等待低优先级的线程锁定互斥量时，低优先级的线程以高优先级线程的优先级运行。这种方式将以继承的形式传递。当线程解锁互斥量时，线程的优先级自动被降到它原来的优先级。该协议就是支持优先级继承类型的互斥锁，它不是默认选项，需要在程序中进行设置。
 PTHREAD_PRIO_PROTECT：当线程拥有一个或多个使用 PTHREAD_PRIO_PROTECT 初始化的互斥锁时，此协议值会影响其他线程（如 thrd2）的优先级和调度。thrd2 以其较高的优先级或者以 thrd2 拥有的所有互斥锁的最高优先级上限运行。基于被 thrd2 拥有的任一互斥锁阻塞的较高优先级线程对于 thrd2的调度没有任何影响。
 */
-(void)pthreadLock{
    __block pthread_mutex_t recursiveMutex;
    //锁的属性
    pthread_mutexattr_t recursiveMutexattr;
    //初始化锁的属性
    pthread_mutexattr_init(&recursiveMutexattr);
    pthread_mutexattr_settype(&recursiveMutexattr, PTHREAD_MUTEX_RECURSIVE);
    //初始化锁
    pthread_mutex_init(&recursiveMutex, &recursiveMutexattr);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void (^XWRecursiveBlock)(int);
        
        XWRecursiveBlock = ^(int  value) {
            //加锁
            pthread_mutex_lock(&recursiveMutex);
            if (value > 0) {
                NSLog(@"加锁层数: %d",value);
                sleep(1);
                XWRecursiveBlock(--value);
            }
            NSLog(@"程序退出!");
            //解锁
            pthread_mutex_unlock(&recursiveMutex);
        };
        
        XWRecursiveBlock(3);
    });
}

/**
 线程锁死的情况
 */
-(void)threadLock{
    
    NSLock *lock = [[NSLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveMethod)(int);
        
        RecursiveMethod = ^(int value) {
            
            [lock lock];
            if (value > 0) {
                
                NSLog(@"value = %d", value);
                sleep(2);
                RecursiveMethod(value - 1);
            }
            [lock unlock];
        };
        
        RecursiveMethod(5);
    });
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
