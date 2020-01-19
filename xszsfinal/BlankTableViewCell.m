//
//  BlankTableViewCell.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "BlankTableViewCell.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@implementation BlankTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)drawRect:(CGRect)rect
{
    self.userInteractionEnabled=NO;
    NSLog(@"%@",self.backgroundView.subviews);
    self.contentView.backgroundColor=UIColorFromHEX(ColorGray_Light);
}

@end

