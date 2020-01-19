//
//  tongzhiwebview.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/31.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tongzhiwebview : UIViewController <UIWebViewDelegate,UITextFieldDelegate>
{
    NSURL * Url;
    NSString * myUrlStr;
    NSMutableArray * dataArray;
    NSString *newdata;
}
@property long tag;

@end
