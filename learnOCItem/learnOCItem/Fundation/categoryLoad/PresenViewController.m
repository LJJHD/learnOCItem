//
//  PresenViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/9/10.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "PresenViewController.h"
#import "ljjStu.h"
#import "ljjStu+test.h"
#import <objc/runtime.h>
@interface PresenViewController ()

@end

@implementation PresenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ljjStu *stu = [[ljjStu alloc]init];
//    [stu eat];
//    [stu eat2];
    [self callOldMethod];
}

//分类重写了主类的方法，如果要调用主类的方法需要如下操作，找到最后一个该方法
-(void)callOldMethod{
    Class currentClass = [ljjStu class];
    ljjStu *my = [[ljjStu alloc] init];
    
    if (currentClass) {
        unsigned int methodCount;
        Method *methodList = class_copyMethodList(currentClass, &methodCount);
        IMP lastImp = NULL;
        SEL lastSel = NULL;
        for (NSInteger i = 0; i < methodCount; i++) {
            Method method = methodList[i];
            NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method))
                                                      encoding:NSUTF8StringEncoding];
            if ([@"eat2" isEqualToString:methodName]) {
                lastImp = method_getImplementation(method);
                lastSel = method_getName(method);
            }
        }
        typedef void (*fn)(id,SEL);
        
        if (lastImp != NULL) {
            fn f = (fn)lastImp;
            f(my,lastSel);
        }
        free(methodList);
    }
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
