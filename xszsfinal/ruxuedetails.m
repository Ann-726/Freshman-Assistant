//
//  ruxuedetails.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/28.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "ruxuedetails.h"
#import "MsgConstant.h"
#import "AppConstant.h"
#import "ruxuecell.h"
#import "ruxuenextpage.h"

@implementation ruxuedetails
@synthesize tag;
-(void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
       if(tag==0)
    {
        [self addkaixueTableView];
    }
    if(tag==1)
    {
        [self addzhunbeiTableView];
    }
    if(tag==2)
    {
        webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:webview];
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *name = [NSString stringWithFormat:@"laixiao"];
        NSString *txtPath = [mainBundle pathForResource:name ofType:@"html"];
        strHTML = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
        webview.delegate=self;
        webview.scrollView.bounces=YES;
        webview.scrollView.alwaysBounceHorizontal = NO;
        webview.scrollView.showsHorizontalScrollIndicator = NO;
        webview.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [webview sizeToFit];
        [webview loadHTMLString:strHTML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]resourcePath]]];
    }
    if(tag==3)
    {
        [self addbaodaoTableView];
    }
    if(tag==4)
    {
        [self addjunxunTableView];
    }
}
#pragma 开学了
-(void)addkaixueTableView
{
    _kaixueTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    _kaixueTableView.delegate=self;
    _kaixueTableView.dataSource=self;
    _kaixueTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_kaixueTableView];
    _kaixuetitle=[[NSMutableArray alloc]initWithObjects:@"开学须知",@"来校后的分级考试是什么情况？",@"申请助学贷款",@"申请助学金注意",@"能否转专业及转专业政策",@"软院是不是三本",@"明确路线",@"既来则安",@"电脑选购",@"外省的大一新生是否要迁户口？", nil];
    _kaixuecontent=[[NSMutableArray alloc]initWithObjects:@" 从大家在网站 上查询到自己被大连理工大学软件学院 录取的那一刻开始...",@"分级考试只考英语，先是统一上机考试...",@" 助学贷款分为生源地助学贷款和国家助学贷款...",@"通过家庭经济困难学生的认定的同学可以申请助学金，助学金分等级1000~3000元/年...",@"在大一下学期结束后（7、8月份）...",@" 大连理工大学软件学院是根正苗红的一本哦...",@" 尽快明确自己的方向，毕业后想干什么...",@" 软院的大部分同学都是调剂进来的...",@"作为一名程序猿，一本称手的笔记本也是有必要的...",@" 原则上是自愿的，迁不迁在在读期间完全没有什么影响...", nil];
}
-(void)addzhunbeiTableView
{
    _zhunbeiTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    _zhunbeiTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

     _zhunbeiTableView.delegate=self;
     _zhunbeiTableView.dataSource=self;
    [self.view addSubview: _zhunbeiTableView];
    _zhunbeititle=[[NSMutableArray alloc]initWithObjects:@"携带物品",@"软院的消费水平如何？",@"自带电器有限制吗？",@"关于银行卡、电话卡",@"关于网线",@"软件学院大一上学期让不让带电脑",@"打包秘籍",@"开办网银",nil];
    _zhunbeicontent=[[NSMutableArray alloc]initWithObjects:@"  尽量少带东西，这里什么都有...",@"首先软院只有一家小超市，一些文具日用品...",@"  原则上来说，大功率发热电器一律不许（超过500W）...",@"同学们在收到录取通知书的时候一般会同时收到一张建行龙卡...",@"大一是绝对不让连网的，小学期也是不行的...",@"  原则上大一上学期是不允许带电脑的，但是软件这行...",@" 下图仅供参考哦",@" 大家刚上大学还都是没自己办过什么业务的小孩子...", nil];
    }

-(void)addbaodaoTableView
{
    _baodaoTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    _baodaoTableView.delegate=self;
    _baodaoTableView.dataSource=self;
    _baodaoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview: _baodaoTableView];
    _baodaotitle=[[NSMutableArray alloc]initWithObjects:@"入学报到手续办理",@"玉兰卡丢失怎么办？开不了门禁怎么办？",@"什么时候可以报考四级？需要准备什么？",@"软院的图书馆书怎么样？书多吗？",@"学院的讲座多么，讲座卡是什么东东？",@"大学新生需要注意的十件事情",@"大学生可以考哪些证",@"养成良好的作息习惯",@"课外技术推荐",@"大学不要太过放松",nil];
    _baodaocontent=[[NSMutableArray alloc]initWithObjects:@"  无论以什么方式来校，要想真正成为软件学院的一员...",@"玉兰卡丢失后可以先到玉兰卡机器上进行挂失，...",@"  大工是在大一上学期就可以报考四级的，...",@"软院的图书馆因为它高大酷炫的外观又被叫做“来一桶”...",@"说实话，学校的讲座次数不多，大概一至两个月一次...",@"下图仅供参考哦",@" 下图仅供参考哦",@" 相信大家都脑补过这样的场景，周六的早上...",@" 学院的课程大一只会教C和C++，至于PS，AE...",@"大家经过艰苦的高中三年，再加上三个月浪荡的假期...", nil];
    

    }
-(void)addjunxunTableView
{
    _junxunTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    _junxunTableView.delegate=self;
    _junxunTableView.dataSource=self;
    _junxunTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview: _junxunTableView];
    _junxuntitle=[[NSMutableArray alloc]initWithObjects:@"军训那些事",@"关于大一是否有跑操，跑操次数是否频繁？",@"关于参加各类社团",@"及时查看学生周知",@"关于假期学校图书馆，澡堂，体育馆是否开放",nil];
    _junxuncontent=[[NSMutableArray alloc]initWithObjects:@"  收拾好自己的内务，认识了新同学，...",@"如果你也曾想到过这个问题，我想说，同学你真是...",@"军训期间各大社团与学生组织将会开展轰轰烈烈的招新活动...",@"学生周知的获取方式主要有三种，一种...",@" 学校的图书馆平日的开放时间为：周一到周五早...", nil];
}



//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tag==0)
    {
        return 10;
    }
    if(tag==1)
    {
        return 8;
    }
    if(tag==3)
    {
        return 10;
    }
    else{
        return 5;
    }
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
#pragma mark-设置tableview数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tag==0){
        static NSString *CellWithIdentifier = @"Cell";
        ruxuecell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        if (cell == nil) {
            cell = [[ruxuecell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
        }
        NSUInteger rownow = [indexPath row];
        cell.title.text = [_kaixuetitle objectAtIndex:rownow];
        cell.article.text = [_kaixuecontent objectAtIndex:rownow];
        //cell.picture.hidden = [[Id objectAtIndex:rownow] intValue];
        return cell;
    }
   if(tag==1){
        static NSString *CellWithIdentifier = @"Cell";
        ruxuecell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        if (cell == nil) {
            cell = [[ruxuecell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
        }
        NSUInteger rownow = [indexPath row];
        cell.title.text = [_zhunbeititle objectAtIndex:rownow];
        cell.article.text = [_zhunbeicontent objectAtIndex:rownow];
        //cell.picture.hidden = [[Id_Suggestion objectAtIndex:rownow] intValue];
        return cell;
    }
    if(tag==3){
        static NSString *CellWithIdentifier = @"Cell";
        ruxuecell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        if (cell == nil) {
            cell = [[ruxuecell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
        }
        NSUInteger rownow = [indexPath row];
        cell.title.text = [_baodaotitle objectAtIndex:rownow];
        cell.article.text = [_baodaocontent objectAtIndex:rownow];
        //cell.picture.hidden = [[Id_Suggestion objectAtIndex:rownow] intValue];
        return cell;
    }
    else
    {
        static NSString *CellWithIdentifier = @"Cell";
        ruxuecell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        if (cell == nil) {
            cell = [[ruxuecell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
        }
        NSUInteger rownow = [indexPath row];
        cell.title.text = [_junxuntitle objectAtIndex:rownow];
        cell.article.text = [_junxuntitle objectAtIndex:rownow];
        //cell.picture.hidden = [[Id_Suggestion objectAtIndex:rownow] intValue];
        return cell;

    }

}
// 点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ruxuenextpage*nextpage=[[ruxuenextpage alloc]init];
    nextpage.tag=tag;
    nextpage.which=indexPath.row;
    [self.navigationController pushViewController:nextpage animated:YES];
    
}


@end
