//
//  baseModel.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/26.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "baseModel.h"
#import <objc/runtime.h>
@implementation baseModel

-(instancetype)initWithName:(NSString *)name address:(NSString *)address phone:(NSString *)phone{
    self = [super init];
    if (self) {
        self.name = name;
        self.address = address;
        self.phone = phone;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    
    id obj = [[[self class] allocWithZone:zone] init];
    Class class = [self class];
    while (class != [NSObject class]) {
        unsigned int count;
        Ivar *ivar = class_copyIvarList(class, &count);
        for (int i = 0; i < count; i++) {
            Ivar iv = ivar[i];
            const char *name = ivar_getName(iv);
            NSString *strName = [NSString stringWithUTF8String:name];
            //利用KVC取值
            id value = [self valueForKey:strName];//如果还套了模型也要copy呢
            if ([value respondsToSelector:@selector(copyWithZone:)]) {
                 [obj setValue:[value copy] forKey:strName];
            } else {
                 [obj setValue:value forKey:strName];
            }
        }
        free(ivar);
        
        class = class_getSuperclass(class);//记住还要遍历父类的属性呢
    }
    return obj;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    id obj = [[[self class]allocWithZone:zone]init];
    Class class = [self class];
    while (class != [NSObject class]) {
        unsigned int count;
        Ivar *ivar = class_copyIvarList(class, &count);
        for (int i = 0; i < count; i++) {
            Ivar iv = ivar[i];
            const char *name = ivar_getName(iv);
            NSString *strName = [NSString stringWithUTF8String:name];
            id value = [self valueForKey:strName];
            if ([value respondsToSelector:@selector(mutableCopyWithZone:)]) {
               
                [obj setValue:[value mutableCopy] forKey:strName];
                
            } else {
                [obj setValue:value forKey:strName];
            }
        }
        free(ivar);
        
        class = class_getSuperclass(class);//记住还要遍历父类的属性呢
    }
    return obj;
}

#pragma mark - 归档、解档
- (void)encodeWithCoder:(NSCoder *)encoder {
    
    Class class = [self class];
    while (class != [NSObject class]) {
        unsigned int count;
        Ivar *ivar = class_copyIvarList(class, &count);
        for (int i = 0; i < count; i++) {
            Ivar iv = ivar[i];
            const char *name = ivar_getName(iv);
            NSString *strName = [NSString stringWithUTF8String:name];
            //利用KVC取值
            id value = [self valueForKey:strName];
            [encoder encodeObject:value forKey:strName];
        }
        free(ivar);
        
        class = class_getSuperclass(class);//记住还要遍历父类的属性呢
    }
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        
        Class class = [self class];
        while (class != [NSObject class]) {
            
            @autoreleasepool{
                unsigned int count = 0;
                //获取类中所有成员变量名
                Ivar *ivar = class_copyIvarList(class, &count);
                for (int i = 0; i < count; i++) {
                    Ivar iva = ivar[i];
                    const char *name = ivar_getName(iva);
                    NSString *strName = [NSString stringWithUTF8String:name];
                    //进行解档取值
                    id value = [decoder decodeObjectForKey:strName];
                    //利用KVC对属性赋值
                    [self setValue:value forKey:strName];
                }
                free(ivar);
                
                class = class_getSuperclass(class);//记住还要遍历父类的属性呢
            }
        }
    }
    return self;
}
@end
