//
//  ZJ_Func.h
//  CaiYun_OC
//
//  Created by 张剑 on 16/8/10.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZJDelayBlock)();
@interface ZJ_Func : NSObject

+(void)unselectCell:(UITableView*)tableView;

+(void)delay:(double)delay callback:(ZJDelayBlock)block;

@end