//
//  ljjStu.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/9/10.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ljjStu.h"

@implementation ljjStu
-(instancetype)init{
    self = [super init];
    if (self) {
//        [self eat2];
    }
    return self;
}

+(void)load{
    NSLog(@"student1");
}
//+(void)initialize{
//    NSLog(@"initialize===student1");
//}
-(void)eat{
    NSLog(@"student1===eat");
}
-(void)eat2{
      NSLog(@"student1===eat2");
}
@end
