//
//  Dog.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/11.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "Dog.h"

@implementation Dog
{
    NSString* toSetName;
    NSString* isName;
    //NSString* name;
    NSString* _name;
    NSString* _isName;
}
+(BOOL)accessInstanceVariablesDirectly{
    return YES;
}
-(id)valueForUndefinedKey:(NSString *)key{
     NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"出现异常，该key不存在%@",key);
}
@end
