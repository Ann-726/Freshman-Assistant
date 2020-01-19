//
//  mineTableViewCell.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mineTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel *titlelbl;
@property (nonatomic,strong)UIImageView *headImgView;
- (instancetype)initWithIndex:(NSInteger)index;



@end
