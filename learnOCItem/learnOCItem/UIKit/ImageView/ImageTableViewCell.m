//
//  ImageTableViewCell.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/23.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setUrl:(NSString *)url{
    _url = url;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"user"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
