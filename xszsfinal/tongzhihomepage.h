//
//  tongzhihomepage.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tongzhihomepage : UITableViewController
@property (nonatomic,strong)NSURL * Url;
@property (nonatomic ,copy) NSString * myUrlStr;
@property (nonatomic ,strong) NSMutableArray * dataArray;
@property (nonatomic,strong)NSString *text;
@property(nonatomic,strong)NSString  *date;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray*dateArray;



@end
