//
//  ZJInputMoreOtherCell.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/18.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ZJInputMoreOtherCell.h"

@implementation ZJInputMoreOtherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.view.layer.masksToBounds = true;
    self.view.layer.cornerRadius = 0;
}

@end
