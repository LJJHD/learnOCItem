//
//  FMDBLearnViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/25.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "FMDBLearnViewController.h"
#import "FMDB.h"
@interface FMDBLearnViewController ()
@property (nonatomic, strong) FMDatabase *db;
@property (nonatomic, copy) NSString *dbPath;
@end

@implementation FMDBLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    self.dbPath = [documentPath stringByAppendingPathComponent:@"learn.db"];
//    [self synHandle];
    [self asynHandle];
}

//异步数据库操作
-(void)asynHandle{
   
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        for (int i = 0; i<= 60; i++) {
           [db executeUpdate:@"INSERT INTO Persons (LastName, Address, City) VALUES ('zhangsan','yongzhouNali','yongzhou')"];
        }
       
    }];
    
    [self.db close];
}

//事物
-(void)inTransaction{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    [queue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        
    }];
}

//savePoint
-(void)savePoint{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    [queue inSavePoint:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        
    }];
}

//同步数据库操作
-(void)synHandle{
    self.db = [FMDatabase databaseWithPath:self.dbPath];

    if (self.db) {
        
        if ([self.db open]) {
            //         BOOL createResult =   [self.db executeUpdate:@"CREATE TABLE Persons (Id_P int,LastName varchar(255),FirstName varchar(255), Address varchar(255), City varchar(255))"];
            //            if (createResult) {
            //               BOOL insertResult = [self.db executeUpdate:@"INSERT INTO Persons VALUES ('1','Gates','Bill','Xuanwumen 10','Beiging')"];
            //                if (insertResult) {
            //                    NSLog(@"插入成功");
            //                }
            //            }
            
            //插入数据
            //            BOOL insertResult = [self.db executeUpdate:@"INSERT INTO Persons VALUES ('1','Gates','Bill','Xuanwumen 10','Beiging')"];
            //            if (insertResult) {
            //                NSLog(@"插入成功");
            //            }
            
            //获取数据
            FMResultSet *result = [self.db executeQuery:@"SELECT FirstName,LastName,address FROM Persons"];
            
            while ([result next]) {
                NSString *firstName= [result stringForColumn:@"FirstName"];
                NSString *LastName = [result stringForColumn:@"LastName"];
                NSString *address = [result stringForColumn:@"address"];
                NSLog(@"%@=%@=%@",firstName,LastName,address);
            }
            
        }
        
    }
    [self.db close];
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
