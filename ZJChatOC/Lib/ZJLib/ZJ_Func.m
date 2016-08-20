//
//  ZJ_Func.m
//  CaiYun_OC
//
//  Created by 张剑 on 16/8/10.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJ_Func.h"

@implementation ZJ_Func
+(void)unselectCell:(UITableView *)tableView{
    if([tableView indexPathForSelectedRow]){
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
}

+(void)delay:(double)delay callback:(ZJDelayBlock)block{
    // 任务放到哪个队列中执行
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), queue, ^{
        block();
    });
}

@end



