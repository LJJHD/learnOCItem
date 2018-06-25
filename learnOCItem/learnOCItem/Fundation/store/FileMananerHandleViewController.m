//
//  FileMananerHandleViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/22.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "FileMananerHandleViewController.h"
static NSString * const testPath = @"testPath";

@interface FileMananerHandleViewController ()

@end

@implementation FileMananerHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"fileManagerHandle";
    NSString *Documentpath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"Documentpath===%@",Documentpath);
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *tmpPath = NSTemporaryDirectory();
    
    NSError *error;
    NSString *ceishiPath = [Documentpath stringByAppendingPathComponent:testPath];
    //创建目录
    BOOL result = [[NSFileManager defaultManager]createDirectoryAtPath:ceishiPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (result) {
        
        NSError *err2;
        NSDictionary *fileAttributes = [[NSFileManager defaultManager]attributesOfItemAtPath:ceishiPath error:&err2];
        NSLog(@"fileAttributes==%@",fileAttributes);
        //创建文件
        BOOL isExist = [[NSFileManager defaultManager]fileExistsAtPath:ceishiPath];
        if (isExist) {
            //存在
            NSString *plistPath = [ceishiPath stringByAppendingPathComponent:@"ceishi.plist"];
            if ([[NSFileManager defaultManager]fileExistsAtPath:plistPath]) {
                
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
                [dic setValue:@"孙大圣2" forKey:@"name"];
               
                if ([dic writeToFile:plistPath atomically:YES]) {
                    
                } else {
                    
                }
                
//                NSString *str = [str string];
                
            } else {
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                //设置属性值
                [usersDic setObject:@"孙大圣" forKey:@"name"];
                [usersDic setObject:@"sunwukong" forKey:@"password"];
                
                [usersDic writeToFile:plistPath atomically:YES];
            }
           
        }else{
            
            
        }
    } else {
        NSLog(@"%@",error);
    }
    
    //NSKeyedArchiver 归档 解档
    NSString *archiverPath = [ceishiPath stringByAppendingPathComponent:@"archiver"];
    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
    //设置属性值
    [usersDic setObject:@"孙大圣" forKey:@"name"];
    [usersDic setObject:@"sunwukong" forKey:@"password"];
    if ([[NSFileManager defaultManager]fileExistsAtPath:ceishiPath]) {
        //存在
        if (![NSKeyedArchiver archiveRootObject:@"你好" toFile:ceishiPath]) {
             NSLog(@"Failed to archive nameArchiver");
        }
    } else {
        
    }
    NSString *unarchiverStr = [NSKeyedUnarchiver unarchiveObjectWithFile:ceishiPath];
    
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
