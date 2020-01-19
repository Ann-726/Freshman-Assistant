//
//  ruxuenextpage.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/29.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "ruxuenextpage.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@implementation ruxuenextpage
@synthesize tag,which;
-(void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    
        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:webview];
    if(tag==0)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"kaixue%ld",which+1];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }
    if(tag==1)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"zhunbei%ld",which+1];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }
    if(tag==3)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"baodao%ld",which+1];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }
    if(tag==4)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"junxun%ld",which+1];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }



        webview.delegate=self;
        webview.scrollView.bounces=YES;
        webview.scrollView.alwaysBounceHorizontal = NO;
        webview.scrollView.showsHorizontalScrollIndicator = NO;
        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [webview sizeToFit];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
        
  
}
@end
