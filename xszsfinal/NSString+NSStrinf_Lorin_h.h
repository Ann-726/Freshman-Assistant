//
//  NSString+NSStrinf_Lorin_h.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStrinf_Lorin_h)
///去掉字符串左边的特殊符号
- (NSString *)stringByTrimmingLeftCharactersInset:(NSCharacterSet *)characterSet;

///去掉字符串右边的特殊字符
- (NSString *)stringByTrimmingRightCharactersInset:(NSCharacterSet *)characterSet;


@end
