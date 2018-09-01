//
//  MemoryManageViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/19.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "MemoryManageViewController.h"

@interface MemoryManageViewController ()

@end

@implementation MemoryManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
//    NSObject *objc = [[[NSObject  alloc]init]autorelease];
//    NSLog(@"retain count == %ld",CFGetRetainCount((__bridge CFTypeRef)(objc)));
//    [pool drain];
    
//    [objc retain];
//    NSLog(@"retain count == %ld",CFGetRetainCount((__bridge CFTypeRef)(objc)));
//    [objc release];
//    NSLog(@"retain count == %ld",CFGetRetainCount((__bridge CFTypeRef)(objc)));
//    [objc release];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    
    //计算代码执行时间
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    
    //在这写入要计算时间的代码
  

    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);

}


-(id)alloscArr{
    id objc = [[NSObject alloc]init];
    return objc;
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
