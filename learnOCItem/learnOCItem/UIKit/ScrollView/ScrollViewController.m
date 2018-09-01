//
//  ScrollViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/25.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ScrollViewController.h"
#import <Masonry.h>
@interface ScrollViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ScrollViewController
+(void)load{
    
}
-(void)loadView{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    self.view = self.scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];

    UILabel *lab = [[UILabel alloc]init];
    [lab setTextColor:[UIColor blueColor]];
    lab.text = @"阿里；附件爱豆世纪反扒的看法法第四季发斯蒂芬聚少离多";
    [self.scrollView addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.scrollView);
        
    }];
    self.scrollView.contentSize = CGSizeMake(0, 800);
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"contentSize====%@",NSStringFromCGSize(self.scrollView.contentSize));
//     self.scrollView.contentSize = CGSizeMake(0, 200);
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
