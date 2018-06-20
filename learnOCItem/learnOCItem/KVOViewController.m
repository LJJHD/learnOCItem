//
//  ViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/20.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "KVOViewController.h"
#import <objc/runtime.h>
@interface KVOViewController ()
@property (nonatomic, strong) NSMutableArray *names;
@property (nonatomic, strong) NSString *name;
@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"KVO学习";
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark KVO
    /*
     KVO 设计的槽点
     
     其实作为开发者，大家应该经常听到对 KVO 的吐槽：
     回调方式单一。
     keypath设计容易写错。
     KVO 的回调有一个传递链，子类若不调用父类方法，传递链会中断，这个设计感觉有些繁琐。
     多次移除同一 KVO 会 crash。
     */
    
//    实现KVO
    /*
     self.names = [NSMutableArray arrayWithObject:@"1"];
     self.name = @"123";
     [self addObserver:self forKeyPath:@"names" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionOld context:@"names"];
     [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:@"name"];
     [self addObserver:self forKeyPath:self.name options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionNew context:@"self.name"];//不会走监听方法 因为keyPath 指向第一个字符串的内存空间，当改变的时候name指向另外的内存区域。addObserver还是之前的内存区域。所有observeValueForKeyPath 这个方法不走
     [[self mutableArrayValueForKeyPath:@"names"]addObject:@"2"];
     self.name = @"456";
     */

    
//    KVO基本原理
    /*
     大致原理描述：
     KVO 是基于 runtime 运行时来实现的，当你观察了某个对象的属性，内部会生成一个该对象所属类的子类，然后重写被观察属性的setter方法，当然在重写的方法中会调用父类的setter方法从而不会影响框架使用者的逻辑，之后会将该对象的isa指针指向新创建的这个类，最后会重写-(Class)class;方法，让使用者通过[obj class]查看当前对象所属类的时候会返回其父类，达到移花接木的目的。
     */
  
//    验证 KVO的基本原理
    /*
     通知中心
     self.name = @"123";
     NSLog(@"未添加观察者前class-withOutKVO: %@ \n", object_getClass(self));
     
     NSLog(@"未添加观察者前SET方法setterAdress-withOutKVO: %p \n", [self.name methodForSelector:@selector(setName:)]);
     
     [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:(__bridge void *)(self)];
     self.name = @"456";
     NSLog(@"添加观察者后class-addKVO: %@ \n", object_getClass(self));
     
     NSLog(@"添加观察者后cSET方法setterAdress-addKVO: %p \n", [self.name methodForSelector:@selector(setName:)]);
     
     [self removeObserver:self forKeyPath:@"name"];
     
     NSLog(@"移除观察者后class-removeKVO: %@", object_getClass(self));
     
     NSLog(@"移除观察者后SET方法setterAdress-removeKVO: %p \n", [self.name methodForSelector:@selector(setName:)]);
     */
    
    
#pragma mark NSNotification
     //3、通知线程问题
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"发送通知 currentThread:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"test0" object:nil];
    });
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reserverNotification:) name:@"test0" object:nil];
    //4、是否需要移除通知 ios 9 之后不需要手动在dealloc方法中移除通知
}

-(void)reserverNotification:(NSNotification *)notification{
      NSLog(@"接收通知 currentThread:%@",[NSThread currentThread]);
    /*
     结果输出:
     发送通知 currentThread : <NSThread: 0x60400046aec0>{number = 3, name = (null)}
     响应通知 currentThread : <NSThread: 0x60400046aec0>{number = 3, name = (null)}
     */
    /*
     结论：通知发送线程和通知接收线程是一致的。
     由此看来，如果当我们不是百分之百确认通知的发送队列是在主队列中时，我们最好加上如下代码从而对我们的UI进行处理。
     */
    if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue()))) {
        //dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) 获取当前队列的标签.返回已经创建队列的指定标签。如果队列在创建过程中没有提供标签，则可能返回NULL。
        //strcmp() 比较字符串是否相等
        //在主线程的主队列
        
        
    }else{
        
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@--",keyPath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
