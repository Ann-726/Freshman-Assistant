//
//  minenextviewcontroller.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/28.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface minenextviewcontroller : UIViewController<UIWebViewDelegate>
{
    UIWebView *webview;
    NSString *strHTML;
    UIButton * btnNow;
}
@property long tag;
-(instancetype)initWithTitle:(NSString*)titlestr;

@end
