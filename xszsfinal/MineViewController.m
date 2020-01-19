//
//  MineViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "MineViewController.h"
#import "mineTableViewCell.h"
#import "BlankTableViewCell.h"
#import "AppConstant.h"
#import "MsgConstant.h"
#import "minenextviewcontroller.h"
#import "feedbackViewController.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *sortCellArr;
}
@property (nonatomic,strong)UITableView*tableView;
@end

@implementation MineViewController
-(instancetype)init
{
    self=[super init];
    if(self){
        sortCellArr = @[
                        @"Blank",
                        @"",
                        @"",
                        @"Blank",
                        @"",
                        @"",
                        @""];
    }
    return self;
}
-(void)loadView
{
    [super loadView];
    UIView *tempView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    tempView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:tempView];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49)style:UITableViewStylePlain];
    self.tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.backgroundColor=UIColorFromHEX(ColorGray_Light);
    self.tableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:self.tableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"我的";
    UILabel *minelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    minelabel.text=@"我 的";
    minelabel.textColor=[UIColor whiteColor];
    minelabel.textAlignment=NSTextAlignmentCenter;
    minelabel.font=[UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView=minelabel;
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sortCellArr count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[sortCellArr objectAtIndex:indexPath.row]isEqualToString:@"Blank"]){
        return 20;
    }
    else{
        return kScreenHeight/750*60;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[sortCellArr objectAtIndex:indexPath.row] isEqualToString:@"Blank"]) {
        BlankTableViewCell * cell = [[ BlankTableViewCell alloc] init];
        return cell;
    }else{
        mineTableViewCell * cell = [[mineTableViewCell alloc] initWithIndex:indexPath.row];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(![[sortCellArr objectAtIndex: indexPath.row]isEqualToString:@"Blank"])
    {
        NSLog(@"row:%ld",indexPath.row);
        if(indexPath.row==1||indexPath.row==2||indexPath.row==4||indexPath.row==5)
        {
            mineTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
            minenextviewcontroller* nextpage=[[minenextviewcontroller
                                               alloc]initWithTitle:cell.titlelbl.text];
            [self.navigationController pushViewController:nextpage animated:YES];
            nextpage.tag=indexPath.row;
        }
        if(indexPath.row==6)
        {
            mineTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
            feedbackViewController* nextpage=[[feedbackViewController
                                               alloc]initWithTitle:cell.titlelbl.text];
            [self.navigationController pushViewController:nextpage animated:YES];
            
        }

    }
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
