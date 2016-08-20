//
//  ZJInputMoreView.h
//  ZJChatOC
//
//  Created by 张剑 on 16/8/18.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ZJXibView.h"
#import "ZJInputMoreEmojiView.h"
#import "ZJInputMoreSpeakView.h"
#import "ZJInputMoreOtherView.h"
typedef NS_ENUM(NSInteger, ZJInputMoreViewState) {
    ZJInputMoreViewStateSpeak,
    ZJInputMoreViewStateEmoji,
    ZJInputMoreViewStateAdd
};
@interface ZJInputMoreView : ZJXibView
@property (strong, nonatomic) IBOutlet UIView *view;
@property(nonatomic,strong) ZJInputMoreEmojiView * emojiView;
@property(nonatomic,strong) ZJInputMoreSpeakView * speakView;
@property(nonatomic,strong) ZJInputMoreOtherView * otherView;
-(void)changeStatus:(NSInteger)state;
@end
