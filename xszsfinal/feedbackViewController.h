//
//  feedbackViewController.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/29.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface feedbackViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    CGFloat view_w;
    CGFloat view_h;
    UITextView *TF;
    NSString *feedback_Text;
    UITextField *email;
    UILabel *please;
    UIButton *btn;
    UIAlertView *alert;
    
}
@property (nonatomic,strong)NSMutableData *data;
-(instancetype)initWithTitle:(NSString*)titlestr;

@end
