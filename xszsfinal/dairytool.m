//
//  dairytool.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "dairytool.h"

@implementation dairytool
-(instancetype)init{
    self=[super init];
    if(self){
        //得到应用程序代理类对象
        self.myDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return self;
}
-(void)addNewDairy:(NSString *)content
{
    Dairy *newDairy=[NSEntityDescription insertNewObjectForEntityForName:@"Dairy" inManagedObjectContext:self.myDelegate.managedObjectContext];
    newDairy.text=content;
    //日期转换
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM--dd HH:mm:ss"];
    NSString *dateString =[dateFormatter stringFromDate:[NSDate date]];
    newDairy.date=dateString;
    //保存
    [self.myDelegate saveContext];
}
//
-(NSArray*)findAll
{
    //查询请求
    NSFetchRequest *searchrequest=[[NSFetchRequest alloc]init];
    //设定查询哪种类型的实体对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Dairy" inManagedObjectContext:self.myDelegate.managedObjectContext];
    [searchrequest setEntity:entity];
    //排序
    NSSortDescriptor *sort=[[NSSortDescriptor alloc]initWithKey:@"date" ascending:NO];
    NSArray *sortArr=[[NSArray alloc]initWithObjects:sort, nil];
    [searchrequest setSortDescriptors: sortArr];
    //执行查询
    NSError *error=nil;
    NSArray *result=[self.myDelegate.managedObjectContext executeFetchRequest:searchrequest error:&error];
    if(result==nil){
        NSLog(@"error :%@, %@",error,[error userInfo]);
        return result;
    }
    return  result;
}
- (void)updateDairy:(Dairy *)dairy replaceString:(NSString *)content
{
    // 创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置查询哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName: @"Dairy" inManagedObjectContext: self.myDelegate.managedObjectContext];
    [request setEntity: entity];
    
    // 设置查询条件
    NSPredicate *predice = [NSPredicate predicateWithFormat: @"date = %@", dairy.date];
    [request setPredicate: predice];
    
    NSError *error = nil;
    NSArray *result = [self.myDelegate.managedObjectContext executeFetchRequest: request error: &error];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate: [NSDate date]];
    dairy.date = dateString;
    dairy.text = content;
    
    if(result.count > 0) {
        Dairy *temp = [result lastObject];
        temp.text = dairy.text;
        temp.date = dairy.date;
        
        // 保存
        [self.myDelegate saveContext];
    }
}
-(void)deleteDairy:(Dairy *)dairy
{
    // 创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置查询哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName: @"Dairy" inManagedObjectContext: self.myDelegate.managedObjectContext];
    [request setEntity: entity];
    
    // 设置查询条件
    NSPredicate *predice = [NSPredicate predicateWithFormat: @"date = %@",dairy.date];
    [request setPredicate: predice];
    
    NSError *error = nil;
    NSArray *result = [self.myDelegate.managedObjectContext executeFetchRequest: request error: &error];
    
    if(result.count > 0) {
        Dairy *temp = [result lastObject];
        [self.myDelegate.managedObjectContext deleteObject: temp];
        
        // 保存
        [self.myDelegate saveContext];
    }
    
    
}
@end
