//
//  dairyTableViewCell.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "dairyTableViewCell.h"
#import "NSString+NSStrinf_Lorin_h.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@implementation dairyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor=[UIColor whiteColor];
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
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //内容与时间
    _contenLabel.frame=CGRectMake(17, 8, kScreenWidth-34, self.contentView.frame.size.height/4*3);
    _contenLabel.backgroundColor=[UIColor whiteColor];
    _contenLabel.textColor=UIColorFromHEX(ColorGray_Deep);
    _timeLabel.frame=CGRectMake(17, self.contentView.frame.size.height/4*3, kScreenWidth-34, self.contentView.frame.size.height/4);
    _timeLabel.backgroundColor=UIColorFromHEX(ColorCommonGreen);
    _timeLabel.textAlignment=NSTextAlignmentRight;
}

// 设置cell内容
- (void)setItem:(Dairy *)dairy
{
    _dairy = dairy;
    self.timeLabel.text = dairy.date;
    self.backgroundColor=UIColorFromHEX(ColorGray_dairy);
    // 首页显示的文字，直接从文字部分开始，忽略文字前面的空格或换行
    NSString *tempText = [dairy.text stringByTrimmingLeftCharactersInset: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.contenLabel.text = [NSString stringWithFormat:@"    %@",tempText];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
