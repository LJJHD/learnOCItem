//
//  StuViewController.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/7/24.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StuViewController : UIViewController
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) void(^nameBlock)(NSString *);
@end
