//
//  ZJInputMoreView.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/18.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJInputMoreView.h"
#import "Masonry.h"

@implementation ZJInputMoreView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initView];
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self initView];
}

-(void)initView{
    self.emojiView = [[ZJInputMoreEmojiView alloc]init];
    self.speakView = [[ZJInputMoreSpeakView alloc]init];
    self.otherView = [[ZJInputMoreOtherView alloc]init];
    [self.view addSubview:self.emojiView];
    [self.view addSubview:self.speakView];
    [self.view addSubview:self.otherView];
    
    [self.emojiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [self.speakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [self.otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

-(void)changeStatus:(NSInteger)state{
    if(state == ZJInputMoreViewStateSpeak){
        self.speakView.hidden = false;
        self.emojiView.hidden = true;
        self.otherView.hidden = true;
    }else if(state == ZJInputMoreViewStateEmoji){
        self.speakView.hidden = true;
        self.emojiView.hidden = false;
        self.otherView.hidden = true;
    }else if(state == ZJInputMoreViewStateAdd){
        self.speakView.hidden = true;
        self.emojiView.hidden = true;
        self.otherView.hidden = false;
    }
}

@end
