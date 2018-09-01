//
//  student.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/26.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "student.h"
#import "goodStudent.h"
@implementation student

-(instancetype)initWithNumber:(NSString *)num className:(NSString *)className grade:(NSString *)grade name:(NSString *)name phone:(NSString *)phone address:(NSString *)address{
    self = [super initWithName:name address:address phone:phone];
    if (self) {
        self.number = num;
        self.className = className;
        self.grade = grade;
        self.name = name;
        self.address = address;
        self.phone = phone;
        goodStudent *obj1 = [goodStudent new];
         goodStudent *obj2 = [goodStudent new];
        self.arr = [NSMutableArray arrayWithObjects:obj1,obj2, nil];
    }
    return self;
}

//-(id)copyWithZone:(NSZone *)zone{
//    student *stu = [super copyWithZone:zone];
//    return stu;
//}
//
//-(id)mutableCopyWithZone:(NSZone *)zone{
//    student *stu = [super copyWithZone:zone];
//    return stu;
//}
@end
