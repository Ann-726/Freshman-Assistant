//
//  ruxuecell.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/28.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "ruxuecell.h"
#import "MsgConstant.h"
#import "AppConstant.h"
#import "Masonry.h"
@interface ruxuecell ()
@property (nonatomic, strong) UIImageView *askImageView;
@property (nonatomic, strong) UIImageView *answerImageView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *endImageView;
@end

@implementation ruxuecell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        
        UIColor * bgColor = [UIColor whiteColor];
        self.contentView.backgroundColor = bgColor;
        //设置标题
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(57*kScreenWidth/320, 10, kScreenWidth-kScreenWidth*72/320, 20*kScreenHeight/568)];
        self.title.textAlignment = NSTextAlignmentLeft;
        self.title.font = [UIFont boldSystemFontOfSize:14];
        self.title.textColor =[UIColor blackColor];
        self.title.numberOfLines = 1;
        [self.contentView addSubview:self.title];
        
        //设置内容
        self.article = [[UILabel alloc]initWithFrame:CGRectMake(57*kScreenWidth/320, 35, kScreenWidth-kScreenWidth*96/320, 35*kScreenHeight/568)];
        self.article.textAlignment = NSTextAlignmentLeft;
        self.article.font = [UIFont boldSystemFontOfSize:12];
        self.article.textColor =[UIColor grayColor];
        self.article.numberOfLines = 2;
        [self.contentView addSubview:self.article];
        
        [self.contentView addSubview:self.askImageView];
        [self.contentView addSubview:self.answerImageView];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.endImageView];
        [_askImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20.0f);
            make.centerY.equalTo(self.title);
            make.size.mas_equalTo(CGSizeMake(20.0f, 15.0f));
        }];
        [_answerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-10.0f);
            make.left.equalTo(_askImageView.mas_left);
            make.size.equalTo(_askImageView);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.height.mas_equalTo(1);
        }];
        [_endImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.offset(0);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return self;
}

- (UIImageView *)askImageView {
    if (!_askImageView) {
        _askImageView = [[UIImageView alloc] init];
        _askImageView.image = [UIImage imageNamed:@"img_list_question"];
    }
    return _askImageView;
}

- (UIImageView *)answerImageView {
    if (!_answerImageView) {
        _answerImageView = [[UIImageView alloc] init];
        _answerImageView.image = [UIImage imageNamed:@"img_list_answer"];
    }
    return _answerImageView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

- (UIImageView *)endImageView {
    if (!_endImageView) {
        _endImageView = [[UIImageView alloc] init];
        _endImageView.image = [UIImage imageNamed:@"img_list_end"];
    }
    return _endImageView;
}
@end

