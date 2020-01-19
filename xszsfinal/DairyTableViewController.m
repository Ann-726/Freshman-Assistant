//
//  DairyTableViewController.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "DairyTableViewController.h"
#import "dairydetail.h"
#import "dairytool.h"
#import "MsgConstant.h"
#import "AppConstant.h"
#import "dairyTableViewCell.h"
@interface DairyTableViewController ()
{
    NSMutableArray *_dataArray;
}
@property(nonatomic,strong) dairytool *dairytool;

@end

@implementation DairyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor=UIColorFromHEX(ColorGray_dairy);
    self.title=@"日 记";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //隐藏系统自带的线条
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //隐藏右边的滚动条
    self.tableView.showsVerticalScrollIndicator=NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //设置导航栏
    [self setNavBar];
    //查询已有日记
    _dataArray=[NSMutableArray arrayWithArray:[self.dairytool findAll]];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
}
-(void)setNavBar
{
    //右边新增按钮
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds=CGRectMake(0, 0, 48, 40);
    UIImage *myDeviceNormal=[[UIImage imageNamed:@"bt_add"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btn setImage:myDeviceNormal forState:UIControlStateNormal];

    
    [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
}

#pragma 新建日记
-(void)btnclick:(UIButton *)btn
{
    dairydetail *dairyDetail = [[dairydetail alloc] initWithEditState: kdairyEditeStateNew];
    [self.navigationController pushViewController:dairyDetail animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // return the number of rows
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    dairyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil)
    {
        cell=[[dairyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setItem :_dataArray[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    dairydetail *dairyDetail = [[dairydetail alloc] initWithEditState: kdairyEditeStateEdit];
    dairyDetail.dairy = _dataArray[indexPath.row];
    [self.navigationController pushViewController: dairyDetail animated: YES];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark -dairytool
-(dairytool *)dairytool
{
    if(!_dairytool)
    {
        _dairytool=[[dairytool alloc]init];
    }
    return _dairytool;
}
-(void)reloadData
{
    //查询数组
    _dataArray=[NSMutableArray arrayWithArray:[self.dairytool findAll]];
    //刷新表格
    [self.tableView reloadData];
}
@end
