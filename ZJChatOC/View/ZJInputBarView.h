//
//  InputBarView.h
//  ZJChatOC
//
//  Created by 张剑 on 16/8/16.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJXibView.h"
typedef NS_ENUM(NSInteger, InputBarViewState) {
    InputBarViewStateNormal,
    InputBarViewStateSpeak,
    InputBarViewStateEmoji,
    InputBarViewStateAdd
};
@interface ZJInputBarView : ZJXibView
@property (strong, nonatomic) IBOutlet UIButton *voiceButton;
@property (strong, nonatomic) IBOutlet UIButton *leftKeyboardButton;
@property (strong, nonatomic) IBOutlet UIButton *midKeyboardButton;
@property (strong, nonatomic) IBOutlet UIButton *faceButton;
@property (strong, nonatomic) IBOutlet UIButton *rightKeyboardButton;
@property (strong, nonatomic) IBOutlet UIButton *rightAddButton;
@property (strong, nonatomic) IBOutlet UIButton *midDownButton;
@property (strong, nonatomic) IBOutlet UITextView *midTextView;
-(void)changeStatus:(NSInteger)state;
@end
