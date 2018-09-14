//
//  ImageTableViewCell.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/23.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface ImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (nonatomic, copy) NSString *url;
@end
