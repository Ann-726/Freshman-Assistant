//
//  ruxuenextpage.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/29.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ruxuenextpage : UIViewController<UIWebViewDelegate>
{
    UIWebView *webview;
    NSString *strHTML;
}
@property long tag;
@property long which;

@end
