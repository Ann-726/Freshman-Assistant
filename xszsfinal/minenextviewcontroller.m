//
//  minenextviewcontroller.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/28.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "minenextviewcontroller.h"
#import "MsgConstant.h"
#import "AppConstant.h"
@interface  minenextviewcontroller()<UIScrollViewDelegate>
@property (nonatomic ,copy) NSString * myTilteStr;
@end
@implementation minenextviewcontroller
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
        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:webview];
        webview.delegate=self;
        webview.scrollView.bounces=YES;
        webview.scrollView.alwaysBounceHorizontal = NO;
        webview.scrollView.showsHorizontalScrollIndicator = NO;
        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [webview sizeToFit];
        NSBundle *mainBundle = [NSBundle mainBundle];
    if(tag==1)
        
    {
        NSString *name = [NSString stringWithFormat:@"shijianbiao"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];

    }
    else if(tag==2)
    {
     NSString *name = [NSString stringWithFormat:@"tongxunlu"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }
    else if(tag==4)
    {
        NSString *name = [NSString stringWithFormat:@"guanyuwomen"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }
    else
    {
        NSString *name = [NSString stringWithFormat:@"gengduochanpin"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    }
    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    

    [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    

        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];

    
    // Do any additional setup after loading the view.
}

@end
