//
//  ViewController.m
//  ZJChatOC
//
//  Created by 张剑 on 16/8/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "ViewController.h"
#import "ZJChatViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)talkClick:(id)sender {
    ZJChatViewController *chatController = [[ZJChatViewController alloc]initWithNibName:@"ZJChatViewController" bundle:nil];
    chatController.title = @"小明";
    [self.navigationController pushViewController:chatController animated:true];
}

@end
