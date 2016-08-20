//
//  ZJXibView.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/17.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJXibView.h"

@implementation ZJXibView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self loadView];
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self loadView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

-(void)loadView{
    if(self.contentView){
        return;
    }
    
    NSString* clazzName = NSStringFromClass(self.classForCoder);
    NSArray* nameArray =[clazzName componentsSeparatedByString:@"."];
    NSString * xibName =nameArray[0];
    if(nameArray.count == 2){
        xibName = nameArray[1];
    }
    self.contentView = [[NSBundle mainBundle]loadNibNamed:xibName owner:self options:nil].firstObject;
    [self addSubview:self.contentView];
}

@end