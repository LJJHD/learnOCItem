//
//  UIImageView+splicingImage.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/21.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "UIImageView+splicingImage.h"

@implementation UIImageView (splicingImage)

+(void)imageComposeURLArr:(NSArray<NSURL*>*)urlArr  size:(CGSize)size cornerRadius:(CGFloat)cornerRadius composeImage:(composeImage)composeImage{
    if (urlArr.count > 0 ) {
        __block NSMutableArray *imgs = [NSMutableArray array];
        __block UIImage *composeImg;

        dispatch_group_t  group_t = dispatch_group_create();
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
        dispatch_group_async(group_t, queue, ^{
            [urlArr enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"线程===%@",[NSThread currentThread]);
                UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:obj]];
                if (img) {
                    [imgs addObject:img];
                }
            }];
        });
        __weak  typeof(self)weakSelf = self;
        dispatch_group_notify(group_t, queue, ^{
            NSThread
            composeImg = [weakSelf imageCompose:[imgs copy] size:size cornerRadius:cornerRadius];
            dispatch_async(dispatch_get_main_queue(), ^{
                 composeImage(composeImg);
            });
        });
    }
}

/**
 头像拼接
 @param array 图片数组
 @param size 图片大小
 @param cornerRadius 圆角半径
 @return <#return value description#>
 */
+(UIImage *)imageCompose:(NSArray<UIImage *> *)array size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    if(array.count)
    {
        //开启一个图片上下文
        UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale) ;
        //添加裁剪路径
        UIBezierPath *clippath=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:cornerRadius];
        [clippath addClip];
        //绘制背景矩形
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
        [[UIColor lightGrayColor] setFill];
        [path fill];
        
        NSInteger count=array.count;
        if(count>9)
            count=9;
        //最大列数
        NSInteger max_col=3;
        //最大行数
        NSInteger max_row=3;
        //列数
        NSInteger column=ceil(count/2.0);
        if(column>max_col)
            column=max_col;
        else if (column<1)
            column=1;
        //行数
        NSInteger row=ceil(count/(CGFloat)column);
        if(row>max_row)
            row=max_row;
        
        if(row<1)
            row=1;
        //每个头像间的间距
        CGFloat margin=2;
        CGFloat imgsize=(size.width-(MAX(column, row)+1)*margin)/MAX(column, row);
        //每一行的列数
        NSInteger rowcount=ceil(count/(CGFloat)row);
        NSInteger k=0;
        for (int i =0; i<row; i++) {
            //第一行距离上边的距离
            CGFloat rowmargin=(size.height-imgsize*row-margin*(MAX(row-1, 1)))/(CGFloat)row;
            //每一行的y值
            CGFloat y=i*imgsize+(i+1)*rowmargin;
            if(i>0)
                y = rowmargin+i*imgsize+i*margin;
            if(count<row*column && i==0)
            { 
                //第一行的列数  第一行应该有rowcount列 ，用应该有的的总个数 - 真实个数 = 空缺的列。计算输出第一行的真实列数
                NSInteger count1=rowcount-(row*column-count);
                //第一行 第一个图片距离边距的距离
                CGFloat margin1=(size.width-imgsize*count1-margin*MAX(count1-1, 1))/2.0;
                for (int j=0; j<count1; j++) {
                    UIImage *img=array[k];
                    CGFloat x=margin1;
                    if(j>0)
                        x=margin1+j*imgsize+j*margin;
                    [img drawInRect:CGRectMake(x,y, imgsize, imgsize)];
                    k++;
                }
            }
            else
            {
                CGFloat margin1=(size.width-imgsize*rowcount)/(rowcount+1);
                for (int j=0; j<rowcount; j++) {
                    UIImage *img=array[k];
                    [img drawInRect:CGRectMake(j*imgsize+(j+1)*margin1, y, imgsize, imgsize)];
                    k++;
                }
            }
        }
        UIImage *newimge=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newimge;
    }
    return nil;
}
@end
