//
//  tongzhihomepage.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#import "tongzhihomepage.h"
#import "tongzhicell.h"
#import "tongzhiwebview.h"
@interface tongzhihomepage()
@end
@implementation tongzhihomepage
@synthesize myUrlStr,dataArray,Url,text;

-(id)initWithStyle:(UITableViewStyle)style
{
    self=[super initWithStyle:style];
    if(self){
        
    }
    return self;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"通知";
    UILabel*schoollabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    schoollabel.text=@"通知";
    schoollabel.textColor=[UIColor whiteColor];
    schoollabel.font=[UIFont boldSystemFontOfSize:20];
    schoollabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=schoollabel;

    myUrlStr=@"http://123.206.17.39:3000/announce";
    Url=[NSURL URLWithString:myUrlStr];
    dispatch_async(kBgQueue, ^{
        NSData *data2=[NSData dataWithContentsOfURL:Url];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data2 waitUntilDone:YES];
    });
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

}

-(void)fetchedData:(NSData *)responseData
{
    dataArray=[[NSMutableArray alloc]init];
    _titleArray=[[NSMutableArray alloc]init];
    _dateArray=[[NSMutableArray alloc]init];
    NSError *error;
    NSArray *json=[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    for(NSDictionary *item in json)
    {
        text=[item objectForKey:@"data"];
        [dataArray addObject:text];
        _name=[item objectForKey:@"title" ];
        [_titleArray addObject:_name];
        _date=[item objectForKey:@"date"];
        [_dateArray addObject:_date];
        
        
    }
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // return the number of rows
    return dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    tongzhicell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil)
    {
        cell=[[tongzhicell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(cell)
    {
        cell.contenLabel.text=[NSString stringWithFormat:@"    %@",[dataArray objectAtIndex:indexPath.row]];
        cell.contenLabel.textColor=[UIColor blackColor];
        cell.timeLabel.text=[NSString stringWithFormat:@"    %@",[_dateArray objectAtIndex:indexPath.row]];
        cell.timeLabel.textColor=[UIColor blackColor];
        cell.titleLabel.text=[NSString stringWithFormat:@"    %@",[_titleArray objectAtIndex:indexPath.row]];
        cell.titleLabel.textColor=[UIColor blackColor];



    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    tongzhiwebview*nextpage=[[tongzhiwebview alloc]init];
    nextpage.tag=indexPath.row;
    [self.navigationController pushViewController:nextpage animated:YES];
    
}
@end
