//
//  basicTabBarController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/20.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "basicTabBarController.h"
#import "UIKitListTableViewController.h"
@interface basicTabBarController ()

@end

@implementation basicTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController *UIKitListNav = [[UINavigationController alloc]initWithRootViewController:[[UIKitListTableViewController alloc]init]];
    [self setupOneChildVC:UIKitListNav title:@"UIKit" imageName:@"icon_findmoren" selectedImageName:@"discover"];
}
- (void)setupOneChildVC:(UIViewController *)child title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    child.title = title;
    
    child.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    child.tabBarItem.selectedImage = selectedImage;
    
    [self addChildViewController:child];
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
