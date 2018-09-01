//
//  StuViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/24.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "StuViewController.h"

@interface StuViewController ()

@end

@implementation StuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)back:(UIButton *)sender {
    self.name = @"张三";
    if (self.nameBlock) {
        self.nameBlock(@"你好");
    }
    [self.navigationController popViewControllerAnimated:YES];
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
