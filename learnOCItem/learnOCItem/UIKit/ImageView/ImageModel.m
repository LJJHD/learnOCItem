//
//  ImageModel.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/23.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ImageModel.h"
#import "UIImageView+splicingImage.h"
@implementation ImageModel
-(void)img:(composeImage)img{
    if (_img) {
        img(_img);
    }else{
        NSURL *url1 = [NSURL URLWithString:@"http://cdn2.179e.com/1526641860768346.jpg"];
        NSMutableArray *urlArr = [NSMutableArray array];
        for (int i = 1; i<= 8; i++) {
            [urlArr addObject:url1];
        }
        [UIImageView imageComposeURLArr:urlArr size:CGSizeMake(80, 80) cornerRadius:3 composeImage:^(UIImage *image) {
            self.img = image;
            img(image);
        }];
    }
}
@end
