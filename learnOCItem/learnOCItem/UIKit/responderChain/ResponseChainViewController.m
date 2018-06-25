//
//  ResponseChainViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/21.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ResponseChainViewController.h"
#import "responseView1.h"
#import "responseView2.h"
#import "responseView3.h"
@interface ResponseChainViewController ()
@property (nonatomic, strong) responseView1 *view1;
@property (nonatomic, strong) responseView2 *view2;
@property (nonatomic, strong) responseView3 *view3;

@end

@implementation ResponseChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view1 addSubview:self.view3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"\n%s", __func__);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"\n%s", __func__);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"\n%s", __func__);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"\n%s", __func__);
}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"\n%s", __func__);
//    UIView *view = [super hitTest:point withEvent:event];
//    NSLog(@"\n%@ 的lastResponder查找完毕->%@", NSStringFromClass([self class]), view?@"找到view":@"未找到view");
//    return view;
//}

#pragma mark get or set
-(responseView1 *)view1{
    if (!_view1) {
        _view1 = [[responseView1 alloc]initWithFrame:CGRectMake(10, 10, 300, 200)];
        _view1.backgroundColor = [UIColor greenColor];
    }
    return _view1;
}
-(responseView2 *)view2{
    if (!_view2) {
        _view2 = [[responseView2 alloc]initWithFrame:CGRectMake(10, 230, 300, 200)];
        _view2.backgroundColor = [UIColor redColor];

    }
    return _view2;
}
-(responseView3 *)view3{
    if (!_view3) {
        _view3 = [[responseView3 alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        _view3.backgroundColor = [UIColor grayColor];

    }
    return _view3;
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
