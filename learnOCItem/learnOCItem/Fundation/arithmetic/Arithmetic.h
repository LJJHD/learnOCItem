//
//  Arithmetic.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/10.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arithmetic : NSObject
//冒泡排序
//ascending 是否递增
+(NSMutableArray *)bubbleSort:(NSMutableArray *)arr ascending:(BOOL)ascending;
//选择排序
+(NSMutableArray *)selectSort:(NSMutableArray *)arr ascending:(BOOL)ascending;
//快速排序
+ (void)quickSort:(NSMutableArray *)array left:(NSInteger)left right:(NSInteger)right;

/**
 反转字符串

 @param str 
 @return <#return value description#>
 */
+(NSString *)reverseString:(NSString *)str;

/**
 插入排序

 @param arr 
 */
+(void)insertSortArray:(NSMutableArray *)arr;

/**
 数组是否包含相同元素

 @param arr <#arr description#>
 @return <#return value description#>
 */
+(BOOL)containsDuplicate:(NSMutableArray *)arr;
@end
