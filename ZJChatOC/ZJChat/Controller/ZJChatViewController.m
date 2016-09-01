//
//  ZJChatViewController.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ZJChatViewController.h"
#import "ZJInputView.h"
#import "ZJMessageModel.h"
#import "MessageNormalTableViewCell.h"

@interface ZJChatViewController ()<UITableViewDelegate,UITableViewDataSource,ZJInputViewDelegate,UIGestureRecognizerDelegate>
@property (strong, nonatomic) ZJInputView *inputView;
@property (assign) CGFloat screenWidth;
@property (assign) CGFloat screenHeight;
@property (assign) CGFloat viewPaddingBottom;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray<ZJMessageModel *> * tableData;
@end

@implementation ZJChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.viewPaddingBottom = 0;
    [self initInputView];
    [self initData];
    [self initTable];
}


-(void)initData{
    self.tableData = [[NSMutableArray alloc]init];
    for (int i = 0; i < 10; i++) {
        ZJMessageModel * messageModel = [[ZJMessageModel alloc]init];
        [self.tableData addObject:messageModel];
    }
}

-(void)initTable{
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageNormalTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageNormalTableViewCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addAGesutreRecognizerForYourView];
}

- (void)addAGesutreRecognizerForYourView{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedDetected:)]; // 手势类型随你喜欢。
    tapGesture.delegate = self;
    [self.tableView addGestureRecognizer:tapGesture];
}

- (void)tapGesturedDetected:(UITapGestureRecognizer *)recognizer{
    [self.inputView restoreDefault];
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
    } completion:^(BOOL finished) {
        [weakself inputViewBottomHeightChange:height];
    }];
    
}

-(void)keyBoardWillHide:(NSNotification*) notification{
    NSDictionary *userInfo = [notification userInfo];
    double duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:duration animations:^{
        weakself.inputView.transform = CGAffineTransformIdentity;;
    } completion:^(BOOL finished) {
        if(self.inputView.bottomHeight == 0){
            [weakself inputViewBottomHeightChange:0];
        }
        
    }];
}

-(void) initInputView{
    self.inputView = [[ZJInputView alloc]init];
    self.inputView.delegate = self;
    [self.view addSubview:self.inputView];
    
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(267));
        make.top.equalTo(self.view.mas_bottom).offset(-52);
    }];
}

-(void)inputViewBottomHeightChange:(CGFloat)bottomHeight{
    NSLog(@"距离底部的距离：%f",bottomHeight);
    __weak typeof (self) weakself = self;
    if(bottomHeight == 0){
        [UIView animateWithDuration:0.25 animations:^{
            weakself.tableView.contentInset = UIEdgeInsetsMake(0, 0, bottomHeight, 0);
        }];
    }else{
        //[self.tableView setContentOffset:CGPointMake(0, self.tableView.contentSize.height+bottomHeight -self.tableView.bounds.size.height) animated:NO];
        [UIView animateWithDuration:0.25 animations:^{
            weakself.tableView.contentInset = UIEdgeInsetsMake(0, 0, bottomHeight, 0);
            [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentSize.height+bottomHeight -self.tableView.bounds.size.height) animated:NO];
        }];
    }
    
}

//tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageNormalTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MessageNormalTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 156;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 0.1;
    }else{
        return 20;
    }
}


@end
