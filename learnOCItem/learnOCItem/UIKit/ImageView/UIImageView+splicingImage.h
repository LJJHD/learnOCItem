//
//  UIImageView+splicingImage.h
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/21.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^composeImage)(UIImage*img);
@interface UIImageView (splicingImage)
//+(UIImageView *)splicingImageWithImages:(NSArray *)images space:(NSInteger)space imageViewWidth:(NSInteger)imageViewWidth;
+(void)imageComposeURLArr:(NSArray<NSURL*>*)urlArr  size:(CGSize)size cornerRadius:(CGFloat)cornerRadius composeImage:(composeImage)composeImage;
+(UIImage *)imageCompose:(NSArray<UIImage *> *)array size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
@end
