//
//  Arithmetic.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/10.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "Arithmetic.h"

@implementation Arithmetic
+(NSMutableArray *)bubbleSort:(NSMutableArray *)arr ascending:(BOOL)ascending{
    NSMutableArray *resultArr = [arr mutableCopy];
    for (int i = 0; i < resultArr.count; i++) {
        
        for (int j = 0; j < resultArr.count - 1 -  i; j++) {
            
            if (ascending) {
                
                if ([resultArr[j] integerValue] > [resultArr[j+1] integerValue]) {
//                    tmp = resultArr[j];
//                    resultArr[j] = resultArr[j+1];
//                    resultArr[j + 1] = tmp;
                    [resultArr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
            } else {
                
                if ([resultArr[j] integerValue] < [resultArr[j+1] integerValue]) {
//                    tmp = arr[j];
//                    resultArr[j] = resultArr[j+1];
//                    resultArr[j + 1] = tmp;
                     [resultArr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
            }
            
        }
    }
    return resultArr;
}

//选择排序
+(NSMutableArray *)selectSort:(NSMutableArray *)arr ascending:(BOOL)ascending{
    for (int i = 0; i < arr.count; i ++) {
        for (int j = i + 1; j < arr.count; j ++) {
            if (ascending) {
                //递增
                if ([arr[i]integerValue] > [arr[j]integerValue]) {
                    [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
            } else {
                if ([arr[i]integerValue] < [arr[j]integerValue]) {
                    [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
            }
        }
    }
    return arr;
}

//快速排序

+ (void)quickSort:(NSMutableArray *)array left:(NSInteger)left right:(NSInteger)right
{
    if(left < right){
        NSInteger l = left;
        NSInteger h = right;
        NSInteger base = [array[l] integerValue];
        
        while(l<h){
            //右-->左，查找小于base的数
            while(l<h && [array[h] integerValue]>= base){
                h--;
            }
            //左-->右，查找大于base的数
            while (l<h && [array[l] integerValue] <= base){
                l++;
            }
            
            if(l<h){
                [array exchangeObjectAtIndex:l withObjectAtIndex:h];
               -- h  ;
               ++ l  ;
            }
            NSLog(@"排序中：%@",[array componentsJoinedByString:@","]);
        }
        //当l和h相遇时
        [array exchangeObjectAtIndex:left withObjectAtIndex:h];
        //左边
        [self quickSort:array left:0 right:h - 1];
        //右边
        [self quickSort:array left:h + 1 right:right];
    }
}


+(void)printArray:(NSMutableArray *)arr{
    NSLog(@"排序完：%@\n",[arr componentsJoinedByString:@","]);
}

+(NSString *)reverseString:(NSString *)str{
    NSInteger left = 0;
    NSInteger right = str.length;
    while (left < right) {
        NSString *temp  = [str substringWithRange:NSMakeRange(right-1, 1)];
        str = [str stringByReplacingCharactersInRange:NSMakeRange(right - 1, 1) withString:[str substringWithRange:NSMakeRange(left, 1)]];
        str = [str stringByReplacingCharactersInRange:NSMakeRange(left, 1) withString:temp];
        left ++;
        right --;
    }
    return str;
}

+(void)insertSortArray:(NSMutableArray *)arr{
    NSInteger i,j,temp;
    for (i = 1; i<arr.count; i++) {
        temp = [arr[i]integerValue];
        for (j = i; j > 0; j--) {
            if ([arr[j - 1]intValue] > [arr[j]integerValue]) {
                arr[j] = arr[j - 1];
                arr[j - 1] = [NSString stringWithFormat:@"%ld",(long)temp];
            }
        }
    }
}
+(BOOL)containsDuplicate:(NSMutableArray *)arr{
    NSInteger i,j,temp;
    BOOL result = NO;
    for (i = 1; i<arr.count; i++) {
        temp = [arr[i]integerValue];
        for (j = i; j > 0; j--) {
            if ([arr[j - 1]integerValue] == [arr[j]integerValue]) {
               
                return YES;
            }else{
                result = NO;
            }
        }
    }
    return result;
}

@end
