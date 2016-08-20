//
//  ZJChatViewController.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ZJChatViewController.h"
#import "Masonry.h"
#import "ZJInputBarView.h"
#import "ZJInputMoreView.h"
#import "ZJ_Func.h"
#import "ZJInputMoreOtherCell.h"
#import "AGEmojiKeyBoardView.h"

@interface ZJChatViewController ()<UITextViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (strong, nonatomic) ZJInputBarView *inputBarView;
@property (strong, nonatomic) ZJInputMoreView *inputMoreView;
@property (assign) CGFloat screenWidth;
@property (assign) CGFloat screenHeight;
@property (assign) CGFloat viewPaddingBottom;
@property (strong,nonatomic) NSMutableArray<NSMutableArray<NSMutableDictionary *> *> *otherTableData;
@property (strong,nonatomic) UICollectionView* otherCollView;
@end

@implementation ZJChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.viewPaddingBottom = 0;
    [self initInputBarView];
    [self initInputMoreView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}


-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)textViewDidChange:(UITextView *)textView{
    [self updateInputTextView];
}

-(void)updateInputTextView{
    CGFloat textViewHeight = self.inputBarView.midTextView.contentSize.height;
    if(textViewHeight <= 32){
        textViewHeight = 32;
    }else if(textViewHeight>=80){
        textViewHeight = 80;
    }
    
    CGFloat inputBarHeight = textViewHeight+16;
    
    [self.inputBarView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(inputBarHeight));
    }];
}

-(void)restoreInputTextView{
    [self.inputBarView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(52));
    }];
}

-(void)keyBoardWillShow:(NSNotification*) notification{
    [self.inputBarView changeStatus:InputBarViewStateNormal];
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    int height = keyboardRect.size.height;
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:duration animations:^{
        weakself.inputBarView.transform = CGAffineTransformMakeTranslation(0,-height);
    }];
    
}

-(void)keyBoardWillHide:(NSNotification*) notification{
    NSDictionary *userInfo = [notification userInfo];
    double duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:duration animations:^{
        weakself.inputBarView.transform = CGAffineTransformIdentity;;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

-(void) initInputBarView{
    self.inputBarView = [[ZJInputBarView alloc]init];
    [self.view addSubview:self.inputBarView];
    
    self.inputBarView.midTextView.delegate = self;
    [self.inputBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@52);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [self.inputBarView.voiceButton
     addTarget:self
     action:@selector(leftVoiceButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputBarView.leftKeyboardButton
     addTarget:self
     action:@selector(leftKeyboardButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputBarView.midDownButton
     addTarget:self
     action:@selector(midDownButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputBarView.faceButton
     addTarget:self
     action:@selector(faceButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputBarView.midKeyboardButton
     addTarget:self
     action:@selector(midKeyboardButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputBarView.rightAddButton
     addTarget:self
     action:@selector(rightAddButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputBarView.rightKeyboardButton
     addTarget:self
     action:@selector(rightKeyboardButtonClick:)
     forControlEvents:UIControlEventTouchUpInside];
}

-(void)initInputMoreView{
    self.inputMoreView = [[ZJInputMoreView alloc]init];
    [self.view addSubview:self.inputMoreView];
    [self.inputMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@215);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.inputBarView.mas_bottom);
    }];
    
    [self initOtherCollView];
}

-(void)initOtherCollView{
    self.otherTableData = [[NSMutableArray alloc]init];
    NSMutableArray *section = [[NSMutableArray alloc]init];
    NSMutableDictionary *md1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"照片",@"name",@"keyboard_add_photo",@"pic", nil];
    NSMutableDictionary *md2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"拍摄",@"name",@"keyboard_add_camera",@"pic", nil];
    
    [section addObject:md1];
    [section addObject:md2];
    
//    for (int i = 0; i<8; i++) {
//        NSMutableDictionary *md3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"拍摄",@"name",@"keyboard_add_camera",@"pic", nil];
//        [section addObject:md3];
//    }
    [self.otherTableData addObject:section];
    
    
    self.otherCollView = self.inputMoreView.otherView.collectionView;
    [self.otherCollView registerNib:[UINib nibWithNibName:@"ZJInputMoreOtherCell" bundle:nil] forCellWithReuseIdentifier:@"ZJInputMoreOtherCell"];
    self.otherCollView.showsHorizontalScrollIndicator = false;
    self.otherCollView.showsVerticalScrollIndicator = false;
    self.otherCollView.scrollEnabled = true;
    self.otherCollView.pagingEnabled = true;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    self.otherCollView.collectionViewLayout = flowLayout;
    self.otherCollView.dataSource = self;
    self.otherCollView.delegate = self;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(collectionView == self.otherCollView){
        return self.otherTableData.count;
    }else{
        return 0;
    }
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(collectionView == self.otherCollView){
        return self.otherTableData[section].count;
    }else{
        return 0;
    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(collectionView == self.otherCollView){
    NSMutableDictionary *model = self.otherTableData[indexPath.section][indexPath.row];
    ZJInputMoreOtherCell *picCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZJInputMoreOtherCell" forIndexPath:indexPath];
        picCell.topImageView.image = [UIImage imageNamed:[model valueForKey:@"pic"]];
        picCell.bottomLabel.text = [model valueForKey:@"name"];
        return picCell;
    
    }else{
        return nil;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(collectionView == self.otherCollView){
        return CGSizeMake(self.otherCollView.frame.size.width/3, self.otherCollView.frame.size.height/2);
    }else{
        return CGSizeZero;
    }
}

-(void)showInputMoreView{
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakself.inputBarView.transform = CGAffineTransformMakeTranslation(0,-215);
        weakself.inputMoreView.transform = CGAffineTransformMakeTranslation(0,-215);
    }];
}

-(void)hideInputMoreView{
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakself.inputBarView.transform = CGAffineTransformIdentity;
        weakself.inputMoreView.transform = CGAffineTransformIdentity;
    }];
}

-(void)leftVoiceButtonClick:(UIButton*)button{
    [self.inputBarView changeStatus:InputBarViewStateSpeak];
    [self.inputMoreView changeStatus:ZJInputMoreViewStateSpeak];
    [self showInputMoreView];
    [self restoreInputTextView];
}

-(void)leftKeyboardButtonClick:(UIButton*)button{
    [self hideInputMoreView];
    __weak typeof (self) weakself = self;
    [ZJ_Func delay:0.25 callback:^{
        [weakself.inputBarView changeStatus:InputBarViewStateNormal];
        [weakself updateInputTextView];
    }];
}

-(void)midDownButtonClick:(UIButton*)button{
    [self hideInputMoreView];
    __weak typeof (self) weakself = self;
    [ZJ_Func delay:0.25 callback:^{
        [weakself.inputBarView changeStatus:InputBarViewStateNormal];
        [weakself updateInputTextView];
    }];
}

-(void)faceButtonClick:(UIButton*)button{
    [self.inputBarView changeStatus:InputBarViewStateEmoji];
    [self.inputMoreView changeStatus:ZJInputMoreViewStateEmoji];
    [self showInputMoreView];
    [self updateInputTextView];
}

-(void)midKeyboardButtonClick:(UIButton*)button{
    [self hideInputMoreView];
    __weak typeof (self) weakself = self;
    [ZJ_Func delay:0.25 callback:^{
        [weakself.inputBarView changeStatus:InputBarViewStateNormal];
        [weakself updateInputTextView];
    }];
}

-(void)rightAddButtonClick:(UIButton*)button{
    [self.inputBarView changeStatus:InputBarViewStateAdd];
    [self.inputMoreView changeStatus:ZJInputMoreViewStateAdd];
    [self showInputMoreView];
    [self updateInputTextView];
}

-(void)rightKeyboardButtonClick:(UIButton*)button{
    [self hideInputMoreView];
    __weak typeof (self) weakself = self;
    [ZJ_Func delay:0.25 callback:^{
        [weakself.inputBarView changeStatus:InputBarViewStateNormal];
        [self updateInputTextView];
    }];
}





@end
