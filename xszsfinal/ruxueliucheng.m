//
//  ruxueliucheng.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/28.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "ruxueliucheng.h"
#import "AppConstant.h"
#import "MsgConstant.h"
#import "ruxuedetails.h"
#import "Masonry.h"
@implementation ruxueliucheng
-(void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    [self addbtn];
    self.title=@"入学流程";
    UILabel*schoollabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    schoollabel.text=@"入学流程";
    schoollabel.textColor=[UIColor whiteColor];
    schoollabel.font=[UIFont boldSystemFontOfSize:20];
    schoollabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=schoollabel;

}
-(void)addbtn
{
    for(int i=0;i<5;i++)
    {UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(112*kScreenWidth/320, 92*kScreenHeight/568+i*84*kScreenHeight/568, kScreenWidth/2, 24*kScreenHeight/568)];
        title.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        if(i==0)
        {
            title.text=@"已开学";
        }
        if(i == 1){
            title.text = @"来校前的准备";
        }
        if(i == 2){
            title.text = @"车站／机场来校方式";
        }
        if(i == 3){
            title.text = @"入学手续办理";
        }
        if(i == 4){
            title.text = @"军训小贴士";
        }
        [self.view addSubview:title];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_life_process_0%d", i+1]];
        [self.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(title);
            make.left.offset(30.0f);
            make.size.mas_equalTo(CGSizeMake(47.0f, 47.0f));
        }];
        
        
        UIImageView *lineImageView = [[UIImageView alloc] init];
        [self.view addSubview:lineImageView];
    
        [lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_top).offset(-10.0f);
            make.size.mas_equalTo(CGSizeMake(5.0f, 84*kScreenHeight/568));
            make.left.equalTo(imageView.mas_right).offset(18.0f);
            }];
        if (i != 4) {
            lineImageView.image = [UIImage imageNamed:@"img_line1"];
        } else {
            lineImageView.image = [UIImage imageNamed:@"img_line2"];
        }
        
        if (i != 0) {
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor grayColor];
            [self.view addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lineImageView.mas_top);
                make.left.equalTo(title.mas_left);
                make.size.mas_equalTo(CGSizeMake(182*kScreenWidth/320, 1));
            }];
        }
            
    }
    //内容
    for(int i = 0 ; i < 5 ; i ++){
        UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(112*kScreenWidth/320, 112*kScreenHeight/568+i*84*kScreenHeight/568, 182*kScreenWidth/320, 60*(kScreenHeight-141)/568)];
        content.font = [UIFont systemFontOfSize:10];
        content.textColor = [UIColor grayColor];
        content.numberOfLines = 3;
        if(i == 0){
            content.text = @"从大家在网站上查询到自己被大连理工大学软件学院录取的一刻开始...";
        }
        if(i == 1){
            content.text = @"尽量少带东西，这里什么都有，日用品在学院内及学校周边都能买到...";
        }
        if(i == 2){
            content.text = @"大连主要交通枢纽与大连理工大学主校区、大连理工大学软件学院的分布...";
        }
        if(i == 3){
            content.text = @"来到学校后，要想正式成为软件学院的一员，必须先到生活区...";
        }
        if(i == 4){
            content.text = @"收拾好自己的内务，认识了新的同学，送走了父母之后，下一项任务就是...";
        }
        [self.view addSubview:content];
    }
//点击判断button
    for(int i=0;i<5;i++)
    {
        UIButton *judge = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 84*kScreenHeight/568)];
        judge.center = CGPointMake(kScreenWidth/2, 134*kScreenHeight/568+i*84*kScreenHeight/568);
        //judge.layer.borderWidth=2;
        judge.tag = i;
        [judge addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
        //[judge addTarget:self action:@selector(Bg_drag:) forControlEvents:UIControlEventTouchDragInside];
        //[judge addTarget:self action:@selector(Bg_Change:) forControlEvents:UIControlEventTouchDown];
        [self.view  addSubview:judge];
    }
        
    
}
-(void)selected:(UIButton *)btn
{
    
    ruxuedetails *details=[[ruxuedetails alloc]init];
    details.tag=btn.tag;
    [self.navigationController pushViewController:details animated:YES];
    
}
@end
