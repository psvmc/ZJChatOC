//
//  ZJInputView.h
//  ZJChatOC
//
//  Created by 张剑 on 16/8/30.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "ZJInputBarView.h"
#import "ZJInputMoreView.h"
#import "ZJ_Func.h"
#import "ZJInputMoreOtherCell.h"
#import "AGEmojiKeyBoardView.h"

@interface ZJInputView : UIView <UITextViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (strong, nonatomic) ZJInputBarView *inputBarView;
@property (strong, nonatomic) ZJInputMoreView *inputMoreView;
@property (strong,nonatomic) NSMutableArray<NSMutableArray<NSMutableDictionary *> *> *otherTableData;
@property (strong,nonatomic) UICollectionView* otherCollView;
@end
