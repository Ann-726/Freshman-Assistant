//
//  ruxuedetails.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/28.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ruxuedetails : UIViewController<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
{
    UIWebView *webview;
    NSString *strHTML;
}
@property long tag;
@property(nonatomic,retain)UITableView *kaixueTableView;
@property(nonatomic,retain)UITableView *zhunbeiTableView;
@property(nonatomic,retain)UITableView *baodaoTableView;
@property(nonatomic,retain)UITableView *junxunTableView;
@property(nonatomic,retain)NSMutableArray *kaixuetitle;
@property(nonatomic,retain)NSMutableArray *zhunbeititle;
@property(nonatomic,retain)NSMutableArray *baodaotitle;
@property(nonatomic,retain)NSMutableArray *junxuntitle;
@property(nonatomic,retain)NSMutableArray *kaixuecontent;
@property(nonatomic,retain)NSMutableArray *zhunbeicontent;
@property(nonatomic,retain)NSMutableArray *baodaocontent;
@property(nonatomic,retain)NSMutableArray *junxuncontent;
@end
