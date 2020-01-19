//
//  MoreTableViewCell.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@interface MoreTableViewCell()
{
    NSInteger myIndex;
    NSArray *imgArr;
    NSArray * titleArr;
    NSArray *lineArr;
}

@end
@implementation MoreTableViewCell
@synthesize headImgView;
@synthesize titlelbl;


-(instancetype)initWithIndex:(NSInteger)index
{
    self = [super init];
    if(self)
    {
        myIndex=index;
        imgArr=@[
                 @"",
                 @"img_school_content_map",
                 @"img_school_content_introduction",
                 @"",
                 @"img_school_content_social",
                 @"img_school_content_science",
                 @"img_school_content_activity"];

        titleArr=@[
                   @"",
                   @"校园地图",
                   @"校园简介",
                   @"",
                   @"社会工作",
                   @"科技创新",
                   @"文化活动"
                   ];
        lineArr=@[
                  @"0",
                  @"1",
                  @"1",
                  @"0",
                  @"1",
                  @"1",
                  @"1"
                  ];
        
    }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    
    self.contentView.backgroundColor=[UIColor whiteColor];
    if([[lineArr objectAtIndex:myIndex]isEqualToString:@"1"]){
        UIView *lineview =[[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight/750*60-1,kScreenWidth , 1)];
        lineview.backgroundColor=UIColorFromHEX(ColorGray_Light);
        [self.contentView addSubview:lineview];
    }
    self.headImgView=[[UIImageView alloc]initWithImage:UIIMGName([imgArr objectAtIndex:myIndex])];
    self.headImgView.frame=CGRectMake(30, 15, kScreenHeight/750*60-30, kScreenHeight/750*60-30);
    [self.contentView addSubview:self.headImgView];
    self.titlelbl=[[UILabel alloc]initWithFrame:CGRectMake(30+self.headImgView.frame.size.width+20, 15, 150, kScreenHeight/750*60-30)];
    self.titlelbl.font=[UIFont systemFontOfSize:17];
    self.titlelbl.textColor=[UIColor blackColor];
    self.titlelbl.text=[titleArr objectAtIndex:myIndex];
    self.titlelbl.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:self.titlelbl];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
