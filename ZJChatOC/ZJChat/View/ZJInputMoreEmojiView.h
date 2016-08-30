//
//  ZJInputMoreEmojiView.h
//  ZJChatOC
//
//  Created by 张剑 on 16/8/18.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ZJXibView.h"
#import "AGEmojiKeyBoardView.h"
#import "Masonry.h"

@interface ZJInputMoreEmojiView : ZJXibView<AGEmojiKeyboardViewDelegate, AGEmojiKeyboardViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) AGEmojiKeyboardView *emojiView;
@end
