//
//  student.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/26.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "baseModel.h"

@interface student : baseModel
@property (nonatomic, copy) NSString * number;
@property (nonatomic, copy) NSString * className;//班级
@property (nonatomic, copy) NSString * grade;//年级
@property (nonatomic, strong) NSMutableArray *arr;
-(instancetype)initWithNumber:(NSString *)num className:(NSString *)className grade:(NSString *)grade name:(NSString *)name phone:(NSString *)phone address:(NSString *)address;
@end
