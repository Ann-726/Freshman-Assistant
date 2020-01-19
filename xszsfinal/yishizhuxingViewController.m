//
//  yishizhuxingViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "yishizhuxingViewController.h"
#import "MsgConstant.h"
#import "AppConstant.h"
@interface yishizhuxingyougouViewController ()<UIScrollViewDelegate>

{
  
}

@end

@implementation yishizhuxingyougouViewController
@synthesize tag;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
           //        [self addscrollview];
        //        [myscrollview scrollRectToVisible:CGRectMake(0,90,kScreenWidth,kScreenHeight-90) animated:NO];
        //        webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 90, kScreenWidth, kScreenHeight-90)];
        //        [self judgepage];
        //        webview.delegate=self;
        //        webview.scrollView.bounces=YES;
        //        webview.scrollView.alwaysBounceHorizontal = NO;
        //        webview.scrollView.showsHorizontalScrollIndicator = NO;
        //        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight-90);
        //        [webview sizeToFit];
        //        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
        //
        //        [myscrollview addSubview:webview];
        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:webview];
        btnNow = [[UIButton alloc] init];
        [self judgepage];
        if(tag==0)
        {
            [self btnpage0:btnNow];
        }
    else if(tag==1)
    {
        [self btnpage1:btnNow];
    }
    else if(tag==2)
    {
        [self btnpage2:btnNow];
    }

        else if(tag==3)
        {
            [self btnpage3:btnNow];
        }
        else if(tag==4)
        {
            [self btnpage4:btnNow];
        }
        else
        {
            [self btnpage5:btnNow];
        }
    
    
        webview.delegate=self;
        webview.scrollView.bounces=YES;
        webview.scrollView.alwaysBounceHorizontal = NO;
        webview.scrollView.showsHorizontalScrollIndicator = NO;
        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [webview sizeToFit];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
        
        
        
        
        
        
//    }else
//    {
//        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
//        [self.view addSubview:webview];
//        
//        [self judgewebview];
//        webview.delegate=self;
//        webview.scrollView.bounces=YES;
//        webview.scrollView.alwaysBounceHorizontal = NO;
//        webview.scrollView.showsHorizontalScrollIndicator = NO;
//        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
//        [webview sizeToFit];
//        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
//        
//        
//    }
//    
    
    // Do any additional setup after loading the view.
}
-(void)judgepage{
    NSArray *namesarr=@[@"大连气候",@"常备衣物",@"校内篇",@"校外篇",@"大连特产",@"生活区概况",@"配套设备",@"周边旅馆",@"高铁",@"火车站",@"飞机",@"轮渡",@"本部",@"旅游景点",@"游玩去处",@"发现",@"学院内",@"学院周边",@"开发区商城"];
    
    if(tag==0)
    {
        
        btnNow.tag=0;
        for(NSInteger i=0;i<2;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-1)/2, 64, (kScreenWidth-1)/2, 26)];
            btn.tag=i;
            [btn setTitle:[namesarr objectAtIndex:i] forState:UIControlStateNormal ];
            btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
            [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnpage0:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake((kScreenWidth-1)/2, 64, 1, 26)];
        line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
        [self.view addSubview:line];
    }
    if(tag==1)
    {
        
        btnNow.tag=2;
        for(NSInteger i=0;i<3;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, (kScreenWidth-2)/3, 26)];
            btn.tag=i+2;
            [btn setTitle:[namesarr objectAtIndex:i+2] forState:UIControlStateNormal ];
            btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
            [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnpage1:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        for(int i=1;i<3;i++)
        {
            
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, 1, 26)];
            line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
            
            [self.view addSubview:line];
        }
    }
    if(tag==2)
    {
        
        btnNow.tag=5;
        for(NSInteger i=0;i<3;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, (kScreenWidth-2)/3, 26)];
            btn.tag=i+5;
            [btn setTitle:[namesarr objectAtIndex:i+5] forState:UIControlStateNormal ];
            btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
            [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnpage2:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        for(int i=1;i<3;i++)
        {
            
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, 1, 26)];
            line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
            
            [self.view addSubview:line];
        }
    }
    
    if(tag==3)
    {
        btnNow.tag=8;
        for(NSInteger i=0;i<5;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-4)/5, 64, (kScreenWidth-4)/5, 26)];
            btn.tag=i+8;
            [btn setTitle:[namesarr objectAtIndex:btn.tag] forState:UIControlStateNormal ];
            btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
            [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnpage3:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        for(NSInteger i=1;i<5;i++)
        {
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(i*(kScreenWidth-4)/5, 64, 1, 26)];
            line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
            [self.view addSubview:line];
        }
    }
        if(tag==4)
        {
            btnNow.tag=13;
            for(NSInteger i=0;i<3;i++)
            {
                UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3,64, (kScreenWidth-2)/3, 26)];
                btn.tag=i+13;
                [btn setTitle:[namesarr objectAtIndex:btn.tag] forState:UIControlStateNormal ];
                btn.backgroundColor=[UIColor grayColor];
                btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
                [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
                [self.view addSubview:btn];
                [btn addTarget:self action:@selector(btnpage4:) forControlEvents:UIControlEventTouchUpInside];
    
            }
            for(int i=1;i<3;i++)
            {
    
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, 1, 26)];
            line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
    
            [self.view addSubview:line];
            }
        }
    if(tag==5)
    {
        btnNow.tag=16;
        for(NSInteger i=0;i<3;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, (kScreenWidth-2)/3, 26)];
            btn.tag=i+16;
            [btn setTitle:[namesarr objectAtIndex:btn.tag] forState:UIControlStateNormal ];
            btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
            [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnpage5:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        for(NSInteger i=1;i<3;i++)
        {
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, 1, 26)];
            line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
            [self.view addSubview:line];
        }
    }

}
//-(void)addscrollview
//{
//    myscrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, kScreenWidth, kScreenHeight-90)];
//    if(tag==0){
//        myscrollview.contentSize=CGSizeMake(kScreenWidth*2,kScreenHeight-90);
//    }
//    else if(tag==3){
//        myscrollview.contentSize=CGSizeMake(kScreenWidth*5,kScreenHeight-90);
//
//    }
//    else if (tag==4)
//    {
//        myscrollview.contentSize=CGSizeMake(kScreenWidth*3,kScreenHeight-90);
//    }
//    myscrollview.pagingEnabled=YES;
//    myscrollview.backgroundColor=[UIColor whiteColor];
//    myscrollview.contentOffset=CGPointMake(kScreenWidth, 0);
//    myscrollview.delegate =self;
//    myscrollview.bounces=NO;
//    myscrollview.showsHorizontalScrollIndicator=NO;
//    [self.view addSubview:myscrollview];
//}
//-(void)judgewebview
//{
//    if(tag==1)
//    {
//        NSBundle *mainBundle = [NSBundle mainBundle];
//        NSString *name = [NSString stringWithFormat:@"shi"];
//        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
//        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
//    }
//    
//    if(tag==2)
//    {
//        NSBundle *mainBundle = [NSBundle mainBundle];
//        NSString *name = [NSString stringWithFormat:@"zhu"];
//        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
//        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
//    }
//    if(tag==4)
//    {
//        NSBundle *mainBundle = [NSBundle mainBundle];
//        NSString *name = [NSString stringWithFormat:@"you"];
//        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
//        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
//    }
//    
//    
//    
//    if(tag==5)
//    {
//        NSBundle *mainBundle = [NSBundle mainBundle];
//        NSString *name = [NSString stringWithFormat:@"gou"];
//        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
//        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
//    }
//    
//}
-(void)btnpage0:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    
    if(btn.tag==0)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"yi_qihou"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    }
    if(btn.tag==1)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"clothes"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    }
    
    
    
}
-(void)btnpage1:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"shi%ld",btnNow.tag-1];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];

}
-(void)btnpage2:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"zhu%ld",btnNow.tag-4];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    
}-(void)btnpage3:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"xing%ld",btnNow.tag-7];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    
    
}
-(void)btnpage4:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"you%ld",btnNow.tag-12];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];


}
-(void)btnpage5:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"gou%ld",btnNow.tag-15];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
