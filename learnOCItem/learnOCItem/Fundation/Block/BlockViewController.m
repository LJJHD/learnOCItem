//
//  BlockViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/24.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "BlockViewController.h"
#import "StuViewController.h"
@interface BlockViewController ()
@property (nonatomic, strong) StuViewController *stuVC;
@end

@implementation BlockViewController
-(void)dealloc{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    StuViewController *stu = [[StuViewController alloc]init];
    __weak typeof(stu) weakStu = stu;
    NSLog(@"stu==%p===&stu==%p,\n weakself==%p===&weakself%p",stu,&stu,weakStu,&weakStu);
    stu.nameBlock = ^(NSString *name) {
        __strong typeof(weakStu)strongStu = weakStu;
        NSLog(@"strong=%p,==&strong%p",strongStu,&strongStu);
    };
    stu.nameBlock(@"张三");
}
- (IBAction)jump:(UIButton *)sender {
    [self.navigationController pushViewController:self.stuVC animated:YES];
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
