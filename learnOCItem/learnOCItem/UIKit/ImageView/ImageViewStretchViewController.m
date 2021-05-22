//
//  ImageViewStretchViewController.m
//  learnOCItem
//
//  Created by jiajun liu on 2021/5/21.
//  Copyright © 2021 shanghaiDouke.com. All rights reserved.
//

#import "ImageViewStretchViewController.h"
#import <Masonry/Masonry.h>
#import <Accelerate/Accelerate.h>
@interface ImageViewStretchViewController ()
@property (nonatomic, strong) UIView *cusView;
@end

@implementation ImageViewStretchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:95/255.0 green:71/255.0 blue:185/255.0 alpha:1];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_home"]];
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
   
    
    UIView *view = [UIView new];
//    view.layer.borderWidth = 1;
//    view.layer
    self.cusView = view;
    view.layer.cornerRadius = 41;
//    view.clipsToBounds = YES;
    view.backgroundColor = UIColor.clearColor;//[UIColor colorWithRed:95/255.0 green:71/255.0 blue:185/255.0 alpha:0.1];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.equalTo(self.view).offset(-60);
        make.width.mas_equalTo(228);
        make.height.mas_equalTo(80);
    }];
    

    
//    view.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.95].CGColor;
//    view.layer.shadowOffset = CGSizeMake(0,-2);
//    view.layer.shadowOpacity = 1;
//    view.layer.shadowRadius = 7;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"internal"]];
    imageView.layer.cornerRadius = 35;
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.layer.masksToBounds  = YES;
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
//        make.edges.equalTo(view);
    }];
   imageView.image = [self boxblurImage:[UIImage imageNamed:@"internal"] withBlurNumber:0.1];
    
//    UIView *kk = [UIView new];
//    kk.layer.cornerRadius = 35;
//    kk.layer.masksToBounds = YES;
//    [view addSubview:kk];
//    [kk mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
//    }];
    
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *visualView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
//    visualView.layer.cornerRadius = 35;
//    visualView.layer.masksToBounds = YES;
//    [view addSubview:visualView];
//    [visualView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(4, 4, 4, 4));
//    }];

//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(0, 0, 218, 70);
//    UIColor *startColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.05];//[UIColor colorWithRed:164/255.0f green:212/255.0f blue:255/255.0f alpha:0.27];
//    UIColor *endColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0];
//    gradientLayer.colors = @[(__bridge id)startColor.CGColor,
//                             (__bridge id)endColor.CGColor,];
//    gradientLayer.locations = @[@(0.6),@(1)];
//    gradientLayer.startPoint = (CGPoint){0,0};
//    gradientLayer.endPoint = (CGPoint){0,1};
//    [kk.layer addSublayer:gradientLayer];

   
}

- (void)ui:(UIView *)view{
    CAShapeLayer* shadowLayer = [CAShapeLayer layer];

    [shadowLayer setFrame:view.bounds];
//    shadowLayer.fillColor = UIColor.clearColor.CGColor;
    shadowLayer.strokeColor = [UIColor clearColor].CGColor;

    // Standard shadow stuff

    [shadowLayer setShadowColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.15].CGColor];

    [shadowLayer setShadowOffset:CGSizeMake(0.0f,-2.f)];

    [shadowLayer setShadowOpacity:1.0f];
    shadowLayer.shadowRadius = 7;

    // Causes the inner region in this example to NOT be filled.

    [shadowLayer setFillRule:kCAFillRuleEvenOdd];

    // Create the larger rectangle path.

    CGMutablePathRef path = CGPathCreateMutable();

    CGPathAddRect(path,NULL,CGRectInset(view.bounds, -41, -41));

    // Add the inner path so it's subtracted from the outer path.

    // someInnerPath could be a simple bounds rect, or maybe

    // a rounded one for some extra fanciness.

    CGPathRef someInnerPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:42.0f].CGPath;

    CGPathAddPath(path,NULL, someInnerPath);

    CGPathCloseSubpath(path);

    [shadowLayer setPath:path];

    CGPathRelease(path);

    [[view layer]addSublayer:shadowLayer];

    CAShapeLayer* maskLayer = [CAShapeLayer layer];

    [maskLayer setPath:someInnerPath];

    [shadowLayer setMask:maskLayer];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.cusView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.cusView.bounds cornerRadius:self.cusView.layer.cornerRadius].CGPath;
    [self ui:self.cusView];
}


-(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur {
   if (blur < 0.f || blur > 1.f) {
      blur = 0.5f;
   }
   int boxSize = (int)(blur * 40);
   boxSize = boxSize - (boxSize % 2) + 1;
   CGImageRef img = image.CGImage;
   vImage_Buffer inBuffer, outBuffer;
   vImage_Error error;
   void *pixelBuffer;
//从CGImage中获取数据
   CGDataProviderRef inProvider = CGImageGetDataProvider(img);
   CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
//设置从CGImage获取对象的属性
   inBuffer.width = CGImageGetWidth(img);
   inBuffer.height = CGImageGetHeight(img);
   inBuffer.rowBytes = CGImageGetBytesPerRow(img);
   inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
   pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
   CGImageGetHeight(img));
   if(pixelBuffer == NULL)
   NSLog(@"No pixelbuffer");
   outBuffer.data = pixelBuffer;
   outBuffer.width = CGImageGetWidth(img);
   outBuffer.height = CGImageGetHeight(img);
   outBuffer.rowBytes = CGImageGetBytesPerRow(img);
   error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
   if (error) {
      NSLog(@"error from convolution %ld", error);
   }
   CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
   CGContextRef ctx = CGBitmapContextCreate(
   outBuffer.data,
   outBuffer.width,
   outBuffer.height,
       8,
   outBuffer.rowBytes,
   colorSpace,
   kCGImageAlphaNoneSkipLast);
   CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
   UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
   CGContextRelease(ctx);
   CGColorSpaceRelease(colorSpace);
   free(pixelBuffer);
   CFRelease(inBitmapData);
   CGColorSpaceRelease(colorSpace);
   CGImageRelease(imageRef);
   return returnImage;
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

