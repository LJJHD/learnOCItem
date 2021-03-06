//
//  MultithreadingViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/18.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "MultithreadingViewController.h"
#import "GCDPracticeViewController.h"
#import "OperationViewController.h"
#import "LockViewController.h"
#import "RunLoopViewController.h"
#import "NSThreadViewController.h"
@interface MultithreadingViewController ()
@property (nonatomic, strong) NSThread *thread;
@end

@implementation MultithreadingViewController
-(void)dealloc{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (IBAction)jumpGCD:(UIButton *)sender {
    GCDPracticeViewController *vc = [[GCDPracticeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)operationHandler:(UIButton *)sender {
    OperationViewController *vc = [[OperationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)lock:(UIButton *)sender {
    LockViewController *lockVC = [[LockViewController alloc]init];
    [self.navigationController pushViewController:lockVC animated:YES];
}

- (IBAction)runloop:(UIButton *)sender {
    RunLoopViewController *runloopVC = [[RunLoopViewController alloc]init];
    [self.navigationController pushViewController:runloopVC animated:YES];
}
- (IBAction)jumpToNSthread:(UIButton *)sender {
    NSThreadViewController *vc = [[NSThreadViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
