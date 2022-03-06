//
//  OffScreenRenderedViewController.m
//  learnOCItem
//
//  Created by jiajun on 2021/8/8.
//  Copyright © 2021 shanghaiDouke.com. All rights reserved.
//

#import "OffScreenRenderedViewController.h"

@interface OffScreenRenderedViewController ()

@end

@implementation OffScreenRenderedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200.0, 200.0)];
    // 设置背景色
//    view1.backgroundColor = UIColor.redColor;
    // 设置边框宽度和颜色
//    view1.layer.borderWidth = 2.0;
//    view1.layer.borderColor = UIColor.blackColor.CGColor;
    // 设置圆角
    view1.layer.cornerRadius = 100.0;
//    view1.clipsToBounds = YES;
    view1.layer.contents = (__bridge id)([UIImage imageNamed:@"user2"].CGImage);
    view1.layer.masksToBounds = YES;
    view1.center = self.view.center;
    [self.view addSubview:view1];
    
    // 子视图
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100.0, 100.0)];
//    // 下面3个任何一个属性
//    // 设置背景色
//    view2.backgroundColor = UIColor.blueColor;
//    // 设置内容
//    view2.layer.contents = (__bridge id)([UIImage imageNamed:@"user2"].CGImage);
//    // 设置边框
//    view2.layer.borderWidth = 2.0;
//    view2.layer.borderColor = UIColor.blackColor.CGColor;
//    [view1 addSubview:view2];
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
