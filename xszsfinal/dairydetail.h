//
//  dairydetail.h
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dairytool.h"
typedef enum{
    kdairyEditeStateNew,     // 新建
    kdairyEditeStateEdit     // 编辑
    
}dairyEditState;
@interface dairydetail : UITableViewController
@property (nonatomic, assign) dairyEditState editState;
@property (nonatomic, strong) Dairy *dairy;


- (id)initWithEditState:(dairyEditState)state;
@end
