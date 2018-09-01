//
//  CustomObjectCopyViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/26.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "CustomObjectCopyViewController.h"
#import "student.h"
#import "Arithmetic.h"
#import "BinaryTreeNode.h"
#import "UIImageView+splicingImage.h"
#define min(x,y)  (((x) > (y)) ? (x) : (y))

@interface CustomObjectCopyViewController ()

@end

@implementation CustomObjectCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    student *stu = [[student alloc]initWithNumber:@"123" className:@"高126" grade:@"高一" name:@"张三" phone:@"18516598869" address:@"上海市闵行区"];
    NSData *data1 = [NSKeyedArchiver archivedDataWithRootObject:stu];
    
    student *stu2 = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    NSLog(@"stu==%p, stu2===%p, ",stu,stu2);
    
   
    //冒泡排序
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"88",@"12",@"30",@"7",@"15",@"10",@"1",@"157",@"30",nil];
//    NSMutableArray *resultArr =  [Arithmetic bubbleSort:arr ascending:NO];
    //选择排序
//    NSMutableArray *resultArr =  [Arithmetic selectSort:arr ascending:YES];
//   [Arithmetic quickSort:arr left:0 right:arr.count - 1];
//    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"obj===%@",obj);
//    }];
//    SEL sel = @selector(text);
//    NSLog(@"反转字符串===%@",[Arithmetic reverseString:@"123456"]);
//    [Arithmetic insertSortArray:arr];
//    BOOL result = [Arithmetic containsDuplicate:arr];
    
//    CFMutableArrayRef cfobject = CFArrayCreateMutable(kCFAllocatorDefault, 0, NULL);
//    printf("retain count =%ld====%p\n",(long)CFGetRetainCount(cfobject),cfobject);
//    id obj = (__bridge id)cfobject;
//
//    printf("retain count =%ld\n====%p\n",(long)CFGetRetainCount(cfobject),cfobject);
//    NSLog(@"%@",obj);
    //二叉树相关问题
//    [self BinaryTreeTest];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(100, 100, 80, 80);
//    UIImage *image1 =[UIImage imageNamed:@"user"];
//    UIImage *image2 =[UIImage imageNamed:@"user1"];
//    UIImage *image3 =[UIImage imageNamed:@"user2"];
//    UIImage *image4 =[UIImage imageNamed:@"user"];
//    UIImage *image5 =[UIImage imageNamed:@"user1"];
//    UIImage *image6 =[UIImage imageNamed:@"user2"];
//    UIImage *image7 =[UIImage imageNamed:@"user"];
//    UIImage *image8 =[UIImage imageNamed:@"user1"];
//    NSMutableArray *imageArr = [NSMutableArray arrayWithObjects:image1,image2,image3,image4,image5,image6,image7,image8, nil];
//
    
//       UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdn2.179e.com/1526641860768346.jpg"]]];
    
//    NSURL *url1 = [NSURL URLWithString:@"http://cdn2.179e.com/1526641860768346.jpg"];
//    NSMutableArray *urlArr = [NSMutableArray array];
//    for (int i = 1; i<= 8; i++) {
//        [urlArr addObject:url1];
//    }
//    [UIImageView imageComposeURLArr:urlArr size:CGSizeMake(80, 80) cornerRadius:3 composeImage:^(UIImage *img) {
//        imageView.image = img;
//    }];
//    [self.view addSubview:imageView];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"线程======%@",[NSThread currentThread]);
    });
    
}

-(void)BinaryTreeTest{
    NSArray *arr = [NSArray arrayWithObjects:@(7),@(6),@(3),@(2),@(1),@(9),@(10),@(12),@(14),@(4),@(14), nil];
    BinaryTreeNode *tree = [BinaryTreeNode new];
    tree = [BinaryTreeNode createTreeWithValues:arr];
    
//    BinaryTreeNode *tree1 = [BinaryTreeNode treeNodeAtIndex:3 inTree:tree];
//    NSLog(@"%@",tree1);
   
    
//    NSInteger treeWidth = [BinaryTreeNode widthOfTree:tree];
//    BOOL isBalanceTree = [BinaryTreeNode isBalancedBinaryTree:tree];
    id objc[2];
    objc[0] = [[NSObject alloc]init];
    objc[1] = [NSMutableArray array];
    
    
}

-(void)viewWillLayoutSubviews{
    
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
