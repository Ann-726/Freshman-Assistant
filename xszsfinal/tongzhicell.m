//
//  tongzhicell.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "tongzhicell.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@implementation tongzhicell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor=UIColorFromHEX(ColorGray_Normal);
        //自定义内容
        _contenLabel=[[UILabel alloc]init];
        _contenLabel.font=[UIFont systemFontOfSize:16.f];
        _contenLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:_contenLabel];
        //自定义时间
        _timeLabel=[[UILabel alloc]init];
        _timeLabel.font=[UIFont systemFontOfSize:13.f];
        _timeLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:_timeLabel];
        //
        _titleLabel=[[UILabel alloc]init];
        _titleLabel.font=[UIFont systemFontOfSize:16.f];
        _titleLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        _blankLabel=[[UILabel alloc]init];
        [self.contentView addSubview:_blankLabel];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //内容与时间
    _contenLabel.frame=CGRectMake(17,28, kScreenWidth-34,60);
    _contenLabel.backgroundColor=[UIColor whiteColor];
    _contenLabel.textColor=[UIColor blackColor];
    _titleLabel.frame=CGRectMake(17, 15, kScreenWidth-34, 18);
    _titleLabel.backgroundColor=[UIColor whiteColor];
   _titleLabel.textColor=[UIColor blackColor];
    _timeLabel.frame=CGRectMake(17, 88, kScreenWidth-34, 15);
    _timeLabel.backgroundColor=UIColorFromHEX(ColorCommonGreen);
    _timeLabel.textColor=[UIColor blackColor];
    _timeLabel.textAlignment=NSTextAlignmentRight;
    _blankLabel.frame=CGRectMake(17, 13, kScreenWidth-34, 2);
    _blankLabel.backgroundColor=[UIColor whiteColor];
}

// 设置cell内容
//- (void)setItem:(Dairy *)dairy
//{
//    _dairy = dairy;
//    self.timeLabel.text = dairy.date;
//    self.backgroundColor=UIColorFromHEX(ColorGray_dairy);
//    // 首页显示的文字，直接从文字部分开始，忽略文字前面的空格或换行
//    NSString *tempText = [dairy.text stringByTrimmingLeftCharactersInset: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    self.contenLabel.text = [NSString stringWithFormat:@"    %@",tempText];
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


