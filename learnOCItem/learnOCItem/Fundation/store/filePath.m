//
//  filePath.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/22.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "filePath.h"
static NSString * const testPath = @"testPath";

@implementation filePath
-(void)search{
 NSString *Documentpath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *tmpPath = NSTemporaryDirectory();
    
    NSError *error;
    NSString *ceishiPath = [Documentpath stringByAppendingString:testPath];
    ;
    if ([[NSFileManager defaultManager]createDirectoryAtPath:ceishiPath withIntermediateDirectories:YES attributes:nil error:&error]) {
        
        NSDictionary *fileAttributes = [[NSFileManager defaultManager]attributesOfItemAtPath:ceishiPath error:nil];
        
        
    } else {
        NSLog(@"%@",error);
    }
    
}
@end
