//
//  tongzhiwebview.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/31.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#import "tongzhiwebview.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@implementation tongzhiwebview
@synthesize tag;
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=UIColorFromHEX(ColorGray_Normal);
    myUrlStr=@"http://123.206.17.39:3000/announce";
    Url=[NSURL URLWithString:myUrlStr];
    dispatch_async(kBgQueue, ^{
        NSData *data2=[NSData dataWithContentsOfURL:Url];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data2 waitUntilDone:YES];
    });
//    UITextView * textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-113)];
//    textview.text=[dataArray objectAtIndex:tag];
//    textview.textColor=UIColorFromHEX(ColorDark_Light);
//    
}

-(void)fetchedData:(NSData *)responseData
{
    dataArray=[[NSMutableArray alloc]init];
    NSError *error;
    NSArray *json=[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    for(NSDictionary *item in json)
    {
        newdata=[item objectForKey:@"data"];
        [dataArray addObject:newdata];
        
    }
    UITextView * textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-113)];
    textview.text=[NSString stringWithFormat:@"    %@",[dataArray objectAtIndex:tag]];
    textview.font=[UIFont systemFontOfSize:20];
    textview.textColor=[UIColor darkGrayColor];
    [self.view addSubview:textview];
    

    
}


#pragma mar
@end
