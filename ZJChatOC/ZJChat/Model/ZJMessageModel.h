//
//  ZJMessageModel.h
//  ZJChatOC
//
//  Created by 张剑 on 16/8/30.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import <objc/NSObject.h>

@interface ZJMessageModel : NSObject
@property (nonatomic,assign) int msgType;//消息类型
@property (nonatomic,copy) NSString * message;//消息内容
@property (nonatomic,copy) NSString * senderName;//发送者姓名
@property (nonatomic,copy) NSString * senderPic;//发送者头像
@property (nonatomic,assign) int read;//是否已读
@property (nonatomic,copy) NSString * senderId;//发送者ID
@property (nonatomic,copy) NSString * receiverId;//接受者ID
@property (nonatomic,copy) NSString * sendDate;//发送时间
@property (nonatomic,assign) int isReceive;//是否已接收
@property (nonatomic,assign) float voiceDuration;//声音时间时长(秒)
@end
