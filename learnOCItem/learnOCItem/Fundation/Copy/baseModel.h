//
//  baseModel.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/26.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baseModel : NSObject<NSCopying,NSMutableCopying,NSCoding>
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * phone;
-(instancetype)initWithName:(NSString *)name address:(NSString *)address phone:(NSString *)phone;
@end
