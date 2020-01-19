//
//  dairytool.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Dairy.h"
@interface dairytool : NSObject
@property (nonatomic,strong)AppDelegate *myDelegate;
//添加数据
- (void)addNewDairy:(NSString *)content;
//查询数据
-(NSArray *)findAll;
//更新数据
-(void)updateDairy:(Dairy *)dairy replaceString:(NSString *)content;
//删除数据
-(void)deleteDairy:(Dairy*)note;
@end
