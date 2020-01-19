//
//  SchoolViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "SchoolViewController.h"
#import "BlankTableViewCell.h"
#import "MoreTableViewCell.h"
#import "schoolnextViewController.h"
#import "AppConstant.h"
#import "MsgConstant.h"
@interface SchoolViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *sortCellArr;
}
@property (nonatomic,strong)UITableView *tabelView;

@end

@implementation SchoolViewController


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
    self.tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49)style:UITableViewStylePlain];
    self.tabelView.separatorStyle=UITableViewCellSelectionStyleNone;
    self.tabelView.delegate=self;
    self.tabelView.dataSource=self;
    self.tabelView.backgroundColor=UIColorFromHEX(ColorGray_Light);
    self.tabelView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:self.tabelView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"校园";
    UILabel*schoollabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    schoollabel.text=@"校 园";
    schoollabel.textColor=[UIColor whiteColor];
    schoollabel.font=[UIFont boldSystemFontOfSize:20];
    schoollabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=schoollabel;
    
    
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
        MoreTableViewCell * cell = [[MoreTableViewCell alloc] initWithIndex:indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(![[sortCellArr objectAtIndex: indexPath.row]isEqualToString:@"Blank"])
    {
        NSLog(@"row:%ld",indexPath.row);
        if(indexPath.row==4||indexPath.row==5||indexPath.row==6||indexPath.row==1||indexPath.row==2)
        {
            MoreTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
            schoolnextViewController* nextpage=[[schoolnextViewController alloc]initWithTitle:cell.titlelbl.text];
            [self.navigationController pushViewController:nextpage animated:YES];
            nextpage.tag=indexPath.row;
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
