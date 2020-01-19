//
//  gonglueViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "gonglueViewController.h"
#import "AppConstant.h"
#import "MsgConstant.h"
#import "yishizhuxingViewController.h"
@interface gonglueViewController ()
{
    NSArray* titlearr;
    NSArray* btnnamearr;
}
@end

@implementation gonglueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"攻略";
    UILabel*schoollabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    schoollabel.text=@"攻略";
    schoollabel.textColor=[UIColor whiteColor];
    schoollabel.font=[UIFont boldSystemFontOfSize:20];
    schoollabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=schoollabel;
    

    titlearr=@[@"衣",@"食",@"住",@"行",@"游",@"购"];
    NSArray *imgArr=@[@"img_life_icon_strategy_clothes",@"img_life_icon_strategy_food",@"img_life_icon_strategy_live",@"img_life_icon_strategy_shop",@"img_life_icon_strategy_traffic",@"img_life_icon_strategy_travel"];
    self.view.backgroundColor=[UIColor whiteColor];
    for(NSInteger i=0;i<6;i++)
    {
        NSInteger floor=i/2;
        NSInteger num=i%2;
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(num*(kScreenWidth-1)/2, 64+floor*(kScreenHeight-115)/3, (kScreenWidth-1)/2, (kScreenHeight-115)/3)];
        //[btn setTitle:[titlearr objectAtIndex:i] forState:UIControlStateNormal];
        //使图片显示原来颜色 划重点！
        UIImage *myDeviceNormal=[[UIImage imageNamed:[imgArr objectAtIndex:i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:myDeviceNormal forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
        UILabel *tittle=[[UILabel alloc]initWithFrame:CGRectMake(num*(kScreenWidth-1)/2, 64+btn.frame.size.height/2+myDeviceNormal.size.height/2+floor*(kScreenHeight-115)/3, (kScreenWidth-1)/2, (btn.frame.size.height-myDeviceNormal.size.height)/2)];
        tittle.text=[titlearr objectAtIndex:i];
        tittle.textColor=UIColorFromHEX(ColorDark_Light);
        tittle.textAlignment=NSTextAlignmentCenter;
        
        btn.tag=i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside ];
        [self.view addSubview:btn];
        [self.view addSubview:tittle];
    }
    // Do any additional setup after loading the view.
    for(NSInteger i=1;i<3;i++)
    {
        UIView *horline=[[UIView alloc]initWithFrame:CGRectMake(0, 64+i*(kScreenHeight-115)/3, kScreenWidth, 1)];
        horline.backgroundColor=UIColorFromHEX(ColorDark_Normal);
        [self.view addSubview:horline];
    }
    UIView *verline=[[UIView alloc]initWithFrame:CGRectMake((kScreenWidth-1)/2, 64, 1, kScreenHeight-115)];
    verline.backgroundColor=UIColorFromHEX(ColorDark_Normal);
    [self.view addSubview:verline];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnClick:(UIButton *)btn
{
    yishizhuxingyougouViewController *nextview=[[yishizhuxingyougouViewController alloc]init];
    nextview.tag=btn.tag;
    [self.navigationController pushViewController:nextview animated:YES];
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
