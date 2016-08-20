//
//  UIView+Border&CornerRadius.h
//  CaiYun_OC
//
//  Created by 张剑 on 16/8/9.
//  Copyright © 2016年 张剑. All rights reserved.
//
#import <UIKit/UIKit.h>

IB_DESIGNABLE  // 动态刷新

@interface UIView(border_cornerRadius)

// 注意: 加上IBInspectable就可以可视化显示相关的属性哦
/** 可视化设置边框宽度 */
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
/** 可视化设置边框颜色 */
@property (nonatomic, strong)IBInspectable UIColor *borderColor;

/** 可视化设置圆角 */
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;

@end
