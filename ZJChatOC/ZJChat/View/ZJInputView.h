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

@protocol ZJInputViewDelegate <NSObject>
-(void)inputViewBottomHeightChange:(CGFloat)bottomHeight;
@end

@interface ZJInputView : UIView <UITextViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, weak, nullable) id <ZJInputViewDelegate> delegate;
@property (strong, nonatomic,nonnull) ZJInputBarView *inputBarView;
@property (strong, nonatomic,nonnull) ZJInputMoreView *inputMoreView;
@property (strong,nonatomic,nonnull) NSMutableArray<NSMutableArray<NSMutableDictionary *> *> *otherTableData;
@property (strong,nonatomic,nonnull) UICollectionView* otherCollView;

@property (assign,nonatomic) CGFloat bottomHeight;

-(void) restoreDefault;
@end
