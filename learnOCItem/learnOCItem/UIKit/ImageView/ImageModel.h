//
//  ImageModel.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/23.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^composeImage)(UIImage*img);
@interface ImageModel : NSObject
@property (nonatomic, strong) UIImage *img;
-(void)img:(composeImage)img;
@end
