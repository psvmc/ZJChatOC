//
//  InputBarView.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/16.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZJInputBarView.h"
#import "UITextView+Placeholder.h"

@implementation ZJInputBarView

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
    self.midTextView.layer.masksToBounds = true;
    self.midTextView.layer.cornerRadius = 4;
    self.midTextView.placeholder = @"难道你就不想说点啥？";
}

-(void)changeStatus:(NSInteger)state{
    if(state == InputBarViewStateNormal){
        self.voiceButton.hidden = false;
        self.leftKeyboardButton.hidden = true;
        
        self.midTextView.hidden = false;
        self.midDownButton.hidden = true;
        
        self.midKeyboardButton.hidden = true;
        self.faceButton.hidden = false;
        
        self.rightAddButton.hidden = false;
        self.rightKeyboardButton.hidden = true;
        
        [self.midTextView becomeFirstResponder];
    }else if(state == InputBarViewStateSpeak){
        self.voiceButton.hidden = true;
        self.leftKeyboardButton.hidden = false;
        
        self.midTextView.hidden = true;
        self.midDownButton.hidden = false;
        
        self.midKeyboardButton.hidden = true;
        self.faceButton.hidden = false;
        
        self.rightAddButton.hidden = false;
        self.rightKeyboardButton.hidden = true;
        
        [self.midTextView resignFirstResponder];
    }else if(state == InputBarViewStateEmoji){
        self.voiceButton.hidden = false;
        self.leftKeyboardButton.hidden = true;
        
        self.midTextView.hidden = false;
        self.midDownButton.hidden = true;
        
        self.midKeyboardButton.hidden = false;
        self.faceButton.hidden = true;
        
        self.rightAddButton.hidden = false;
        self.rightKeyboardButton.hidden = true;
        
        [self.midTextView resignFirstResponder];
    }else if(state == InputBarViewStateAdd){
        self.voiceButton.hidden = false;
        self.leftKeyboardButton.hidden = true;
        
        self.midTextView.hidden = false;
        self.midDownButton.hidden = true;
        
        self.midKeyboardButton.hidden = true;
        self.faceButton.hidden = false;
        
        self.rightAddButton.hidden = true;
        self.rightKeyboardButton.hidden = false;
        
        [self.midTextView resignFirstResponder];
    }
}

@end
