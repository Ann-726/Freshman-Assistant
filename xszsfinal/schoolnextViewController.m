//
//  schoolnextViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "schoolnextViewController.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@interface schoolnextViewController ()<UIScrollViewDelegate>
{
  
}

@property (nonatomic ,copy) NSString * myTilteStr;
@end

@implementation schoolnextViewController
@synthesize tag;
-(instancetype)initWithTitle:(NSString*)titlestr
{
    self=[super init];
    if(self)
    {
        self.myTilteStr=titlestr;
    }
    return self;
}
-(void)loadView
{
    [super loadView];
    self.title=self.myTilteStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    if(tag==1)
    {
        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:webview];
        webview.delegate=self;
        webview.scrollView.bounces=YES;
        webview.scrollView.alwaysBounceHorizontal = NO;
        webview.scrollView.showsHorizontalScrollIndicator = NO;
        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [webview sizeToFit];
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"map"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    }
    if(tag==4||tag==5||tag==6)
    {
    webview=[[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:webview];
        btnNow = [[UIButton alloc]  init];
    [self judgepage];
    if(tag==4)
    {
        [self btnpage4:btnNow];
    }
    if(tag==5)
    {
        [self btnpage5:btnNow];
    }
    if(tag==6)
    {
        [self btnpage6:btnNow];
    }
    webview.delegate=self;
    webview.scrollView.bounces=YES;
    webview.scrollView.alwaysBounceHorizontal = NO;
    webview.scrollView.showsHorizontalScrollIndicator = NO;
    webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    [webview sizeToFit];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    }
    if(tag==2)
    {
        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:webview];
        webview.delegate=self;
        webview.scrollView.bounces=YES;
        webview.scrollView.alwaysBounceHorizontal = NO;
        webview.scrollView.showsHorizontalScrollIndicator = NO;
        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [webview sizeToFit];
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"xiaoyuanjianjie"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    }
    
    // Do any additional setup after loading the view.
}
-(void)judgepage{
    NSArray *namesarr=@[@"团委与学生会",@" 社团",@"校级竞赛",@"地区竞赛",@"国家级及以上",@"上学期",@"下学期"];
    
    if(tag==4)
        
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
            [btn addTarget:self action:@selector(btnpage4:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake((kScreenWidth-1)/2, 64, 1, 26)];
        line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
        [self.view addSubview:line];
    }
    if(tag==5)
    {
        btnNow.tag=2;
        for(NSInteger i=0;i<3;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-2)/3, 64, (kScreenWidth-2)/3, 26)];
            btn.tag=i+2;
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
    if(tag==6)
    {
        btnNow.tag=5;
        for(NSInteger i=0;i<2;i++)
        {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(kScreenWidth-1)/2,64, (kScreenWidth-1)/2, 26)];
            btn.tag=i+5;
            [btn setTitle:[namesarr objectAtIndex:btn.tag] forState:UIControlStateNormal ];
            btn.backgroundColor=[UIColor grayColor];
            btn.backgroundColor=UIColorFromHEX(ColorGray_Normal);
            [btn setTitleColor:UIColorFromHEX(ColorGray_Deep) forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnpage6:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake((kScreenWidth-1)/2, 64, 1, 26)];
        line.backgroundColor=UIColorFromHEX(ColorGray_Deep);
        
        [self.view addSubview:line];
    }
}

-(void)btnpage4:(UIButton*)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"work%ld",btnNow.tag+1];
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
    NSString *name = [NSString stringWithFormat:@"competion%ld",btnNow.tag-1];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    
}
-(void)btnpage6:(UIButton *)btn
{
    btnNow.selected = NO;
    btn.selected = YES;
    btnNow = btn;
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *name = [NSString stringWithFormat:@"wenhua%ld",btnNow.tag-4];
    NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
    strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];}
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
