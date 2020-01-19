//
//  HomeViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "HomeViewController.h"
#import "homescrollview.h"
#import "gonglueViewController.h"
#import "AppConstant.h"
#import "MsgConstant.h"
#import "DairyTableViewController.h"
#import "tongzhihomepage.h"
#import "ruxueliucheng.h"
@interface HomeViewController ()
@property (nonatomic,strong) homescrollview*_imagescrollview;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"生活";
    //标题
    UILabel *homelabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 100, 40)];
    homelabel.text=@"新生助手";
    homelabel.textColor=[UIColor whiteColor];
    homelabel.font=[UIFont boldSystemFontOfSize:20];
    homelabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=homelabel;
    UIView * tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    tempView.backgroundColor = UIColorFromHEX(ColorGray_Light);
    [self.view addSubview:tempView];
    //scrollview
    self._imagescrollview=[[homescrollview alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenWidth*466/700)];
    [self._imagescrollview addImages];
    [self.view addSubview:self._imagescrollview];
    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, self._imagescrollview.frame.size.height+64, kScreenWidth, kScreenHeight-64-49-self._imagescrollview.frame
                                                                       .size.height)];
    scroll.contentSize=CGSizeMake(kScreenWidth,scroll.frame.size.height);
    scroll.bounces=YES;
    [self.view addSubview:scroll];
    
    
    //四个button
    NSArray *tittleArr=@[@"攻略",@" 通知",@"入学流程",@"写日记"];
    NSArray *imgArr=@[@"home0",@"home1",@"home2",@"home3"];
       for(NSInteger i=0;i<4;i++)
           
    {
        
        NSInteger floor=i/2;
        NSInteger num=i%2;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.backgroundColor=[UIColor whiteColor];
        btn.frame=CGRectMake(num*(kScreenWidth-1)/2, floor*(scroll.frame.size.height-1)/2, (kScreenWidth-1)/2, (scroll.frame.size.height-1)/2);
        //使图片显示原来颜色 划重点！
        UIImage *myDeviceNormal=[[UIImage imageNamed:[imgArr objectAtIndex:i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:myDeviceNormal forState:UIControlStateNormal];
        
        UILabel*title=[[UILabel alloc]initWithFrame:CGRectMake(num*(kScreenWidth-1)/2, floor*(scroll.frame.size.height/2)+btn.frame.size.height/2+myDeviceNormal.size.height/2, (kScreenWidth-1)/2, (btn.frame.size.height-myDeviceNormal.size.height)/2)];
        
        title.text=[tittleArr objectAtIndex:i];
        title.textColor=UIColorFromHEX(ColorDark_Light);
        title.textAlignment=NSTextAlignmentCenter;
        
        [scroll addSubview:btn];
        [scroll addSubview:title];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i;
    }
    UIView *horizen=[[UIView alloc]initWithFrame:CGRectMake(0, scroll.frame.size.height*0.5, kScreenWidth, 1)];
    [scroll addSubview:horizen];
    horizen.backgroundColor=[UIColor grayColor];
    UIView *vertical=[[UIView alloc]initWithFrame:CGRectMake(kScreenWidth*0.5, 0, 1, scroll.frame.size.height)];
    vertical.backgroundColor=[UIColor grayColor];
    [scroll addSubview:vertical];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)btnClick:(UIButton *)btn
{
    if(btn.tag==0){
        gonglueViewController * viewcontroller=[[gonglueViewController alloc]init];
        [self.navigationController pushViewController:viewcontroller animated:YES];
    }
    if(btn.tag==1)
    {
        tongzhihomepage *tongzhi=[[tongzhihomepage alloc]init];
        [self.navigationController pushViewController:tongzhi animated:YES];
    }
    if(btn.tag==2)
    {
        ruxueliucheng * liucheng=[[ruxueliucheng alloc]init];
        [self.navigationController pushViewController:liucheng animated:YES];
        
    }
    if(btn.tag==3)
    {
        DairyTableViewController * dairy=[[DairyTableViewController alloc]init];
        [self.navigationController pushViewController:dairy animated:YES];
    }
    
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
