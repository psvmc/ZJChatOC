//
//  ZJChatViewController.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ZJChatViewController.h"
#import "ZJInputView.h"

@interface ZJChatViewController ()
@property (strong, nonatomic) ZJInputView *inputView;
@property (assign) CGFloat screenWidth;
@property (assign) CGFloat screenHeight;
@property (assign) CGFloat viewPaddingBottom;
@end

@implementation ZJChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.viewPaddingBottom = 0;
    [self initInputView];
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



-(void)keyBoardWillShow:(NSNotification*) notification{
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    int height = keyboardRect.size.height;
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:duration animations:^{
        weakself.inputView.transform = CGAffineTransformMakeTranslation(0,-height);
    }];
    
}

-(void)keyBoardWillHide:(NSNotification*) notification{
    NSDictionary *userInfo = [notification userInfo];
    double duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:duration animations:^{
        weakself.inputView.transform = CGAffineTransformIdentity;;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

-(void) initInputView{
    self.inputView = [[ZJInputView alloc]init];
    [self.view addSubview:self.inputView];
    
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(267));
        make.top.equalTo(self.view.mas_bottom).offset(-52);
    }];
}



@end
