//
//  homescrollview.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "homescrollview.h"
#import "homescrollview.h"
#import "AppConstant.h"
@interface homescrollview()<UIScrollViewDelegate>{
    NSMutableArray *viewArray;
    NSMutableArray *imgArray;
    NSTimer *timer;
    CGFloat scrollheight;
    
    
}
@end
@implementation homescrollview
-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if(self){
        scrollheight=frame.size.height;
        self.contentSize=CGSizeMake(kScreenWidth*3, scrollheight);
        self.pagingEnabled=YES;
        self.backgroundColor=[UIColor whiteColor];
        self.contentOffset=CGPointMake(kScreenWidth, 0);
        self.delegate=self;
        self.bounces=NO;
        self.showsHorizontalScrollIndicator=NO;
        viewArray=[[NSMutableArray alloc]init];
        imgArray=[[NSMutableArray alloc]init];
        timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeDo) userInfo:nil repeats:YES];
        
    }
    return self;
}
-(void)addImages
{
    
    
    
    
    
    
    
    
    
    for (NSInteger i = 0; i < 5; i ++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"s%ld.png",i]];
        [imgArray addObject:image];
    }
    
    for(NSInteger i = 0 ; i < 3 ; i ++) {
        
        UIImageView * view = [[UIImageView alloc] initWithImage:[imgArray objectAtIndex:i]];
        
        view.frame = CGRectMake(i*kScreenWidth, 0,kScreenWidth,scrollheight);
        view.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:view];
        
        [viewArray addObject:view];
        
        
    }
}








-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [timer setFireDate:[NSDate distantFuture]];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:4]];//?返回距当前时间？
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if(self.contentOffset.x==kScreenWidth*2)
    {
        UIImage *img=[imgArray objectAtIndex:0];
        [imgArray removeObjectAtIndex:0];
        [imgArray addObject:img];
        for(NSInteger i=0;i<3;i++)
        {
            [(UIImageView*)[viewArray objectAtIndex:i]setImage:[imgArray objectAtIndex:i]];
        }
        self.contentOffset=CGPointMake(kScreenWidth, 0);
    }
    if(self.contentOffset.x==0)
    {
        UIImage *img=[imgArray objectAtIndex:4];
        [imgArray removeObjectAtIndex:4];
        [imgArray insertObject:img atIndex:0];
        for(NSInteger i=0;i<3;i++)
        {
            [(UIImageView *)[viewArray objectAtIndex:i]setImage:[imgArray objectAtIndex:i]];
        }
        self.contentOffset=CGPointMake(kScreenWidth, 0);
    }
}
-(void)timeDo
{
    [self setContentOffset:CGPointMake(kScreenWidth*2, 0) animated:YES];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
