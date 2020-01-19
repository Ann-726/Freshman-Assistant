//
//  dairyTableViewCell.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dairytool.h"
@interface dairyTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *contenLabel;   // 显示内容
@property (nonatomic, strong) UILabel *timeLabel;     // 显示时间
@property (nonatomic, strong) Dairy *dairy;

-(void)setItem:(Dairy *)dairy;

@end
