//
//  feedbackViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/29.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "feedbackViewController.h"
#import "AFNetworking.h"
@interface feedbackViewController()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
@property (nonatomic ,copy) NSString * myTilteStr;

@end
@implementation feedbackViewController
-(instancetype)initWithTitle:(NSString*)titlestr
{
    self=[super init];
    if(self)
    {
        self.myTilteStr=titlestr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    view_w = [[UIScreen mainScreen]bounds].size.width;
    view_h = [[UIScreen mainScreen]bounds].size.height;
    //设置标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"用户反馈";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    //加入文本框
    [self addTextView];
    //加入label
    [self addLabel];
    //加入摁钮
    [self addpost];
    //加入邮箱
    [self addEmail];
}
-(void)getAsynchronous:(UIButton *)btn;
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"BackData": @{@"email":email.text, @"content":TF.text}};
    NSString *url=@"http://123.206.17.39:3000/msg_leave";
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if( [self isValidateEmail:email.text])
        {
            _data = [NSMutableData new];
            alert = [[UIAlertView alloc]initWithTitle:nil message:@"您的反馈已提交" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.delegate = self;
            [alert show];
            NSLog(@"%@", responseObject);
        }
        else
        {
            UIAlertView *error_Alert = [[UIAlertView alloc]initWithTitle:nil message:@"邮箱验证错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [error_Alert show];
            
        }
        //NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)addTextView{
    TF = [[UITextView alloc]initWithFrame:CGRectMake(15*view_w/320, 64+15*view_h/568, 290*view_w/320, 160*view_h/568)];
    TF.backgroundColor = [UIColor whiteColor];
    TF.text = @"请输入您的意见或建议";
    TF.textAlignment = NSTextAlignmentLeft;
    TF.returnKeyType = UIReturnKeyDone;
    TF.textColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    TF.font = [UIFont systemFontOfSize:16];
    TF.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:TF];
}
-(void)addLabel{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15*view_w/320, 64+249*view_h/568, 290*view_w/320, view_h*86/568)];
    label.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    label.numberOfLines = 4;
    label.font = [UIFont systemFontOfSize:15];
    label.tintColor = [UIColor grayColor];
    label.textAlignment =  NSTextAlignmentCenter;
    label.alpha =0.5;
    label.text = @"感谢您对新生助手产品的支持和您为我们提出的宝贵意见，我们将根据您的意见对产品进行改进并将反馈结果回复至您的邮箱。";
    [self.view addSubview:label];
}
#pragma mark-email
-(void)addEmail{
    UIView *email_bg = [[UIView alloc]initWithFrame:CGRectMake(15*view_w/320, 64+192*view_h/568, 100, view_h*40/568)];
    email_bg.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:email_bg];
    
    email = [[UITextField alloc]initWithFrame:CGRectMake(25*view_w/320, 64+192*view_h/568, 280*view_w/320, view_h*40/568)];
    email.placeholder= @"请输入您的邮箱";
    email.delegate = self;
    email.borderStyle =  UITextBorderStyleNone;
    email.returnKeyType =UIReturnKeyDone;
    email.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:email];
}
-(void)addpost{
    btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 270*view_w/320, 45*view_h/568)];
    btn.center = CGPointMake(view_w/2, 64+385*view_h/568);
    [btn.layer setCornerRadius:18];
    [btn setTintColor:[UIColor whiteColor]];
    [btn setEnabled:NO];
    [btn setBackgroundImage:[UIImage imageNamed:@"handinLL"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"handinHL"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(getAsynchronous:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
//手势退出键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

//textview退出键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [TF resignFirstResponder];
        return NO;
    }
    return YES;
}
//textview－－placeholder
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if([TF.text isEqualToString:@"请输入您的意见或建议"]){
        TF.text = @"";
    }
    TF.textColor = [UIColor blackColor];
}
//textview判断btn是否enable
-(void)textViewDidEndEditing:(UITextView *)textView{
    if([TF.text isEqualToString:@""]){
        NSLog(@"kong");
        TF.text= @"请输入您的意见或建议";
        TF.textColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        [btn setEnabled:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"handinLL"] forState:UIControlStateNormal];
    }
    else{
        if(email.text.length != 0){
            [btn setEnabled:YES];
            [btn setBackgroundImage:[UIImage imageNamed:@"handin"] forState:UIControlStateNormal];
        }
    }
}

//textfield退出键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [email resignFirstResponder];
    return YES;
}
//textfield判断btn是否enable
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if(![TF.text isEqualToString:@"请输入您的意见或建议"] && email.text.length!=0){
        [btn setEnabled:YES];
        [btn setBackgroundImage:[UIImage imageNamed:@"handin"] forState:UIControlStateNormal];
    }
    else{
        [btn setEnabled:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"handinLL"] forState:UIControlStateNormal];
    }
    return YES;
}

//alertview点击事件
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView == alert){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
//验证邮箱
-(BOOL)isValidateEmail:(NSString *)the_email {
    //正则表达式
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:the_email];
}


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
