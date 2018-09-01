//
//  KVCViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/11.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "KVCViewController.h"
#import "Dog.h"
#import "zoology.h"
@interface KVCViewController ()
@property (nonatomic, assign) NSInteger ceshi;
@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
     zoology *zoo = [zoology new];
     Dog *dog = [Dog new];
     dog.name = @"小黄";
     zoo.dog = dog;
     NSString *name1 = zoo.dog.name;
     NSString *name2 = [zoo valueForKeyPath:@"dog.name"];
     NSLog(@"name1==%@=name2==%@",name1,name2);
     
     [zoo setValue:@"uSA" forKeyPath:@"dog.name"];
     name1 = zoo.dog.name;
     name2 = [zoo valueForKeyPath:@"dog.name"];
     NSLog(@"name1==%@=name2==%@",name1,name2);
     */
    /*
    // dictionaryWithValuesForKeys
    Dog *dog = [Dog new];
    NSDictionary *dic = @{@"name":@"xiaohang",@"age":@"3"};
    [dog setValuesForKeysWithDictionary:dic];
    NSDictionary *dic2 = [dog dictionaryWithValuesForKeys:@[@"name",@"age"]];
    */
    NSArray* arrStr = @[@"english",@"franch",@"chinese"];
    
    NSArray* arrCapStr = [arrStr valueForKey:@"capitalizedString"];
    for (NSString* str  in arrCapStr) {
        NSLog(@"%@",str);
    }
}


-(void)setNilValueForKey:(NSString *)key{
    
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
