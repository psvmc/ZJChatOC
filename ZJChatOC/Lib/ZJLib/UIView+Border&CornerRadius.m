//
//  UIView+Border&CornerRadius.m
//  CaiYun_OC
//
//  Created by 张剑 on 16/8/9.
//  Copyright © 2016年 张剑. All rights reserved.
//

#import "UIView+Border&CornerRadius.h"

@implementation UIView(border_cornerRadius)

/**
 *  设置边框宽度
 *
 *  @param borderWidth 可视化视图传入的值
 */
@dynamic borderWidth;
- (void)setBorderWidth:(CGFloat)borderWidth {
    
    if (borderWidth < 0) return;
    
    self.layer.borderWidth = borderWidth;
}

/**
 *  设置边框颜色
 *
 *  @param borderColor 可视化视图传入的值
 */
@dynamic borderColor;
- (void)setBorderColor:(UIColor *)borderColor {
    
    self.layer.borderColor = borderColor.CGColor;
}

/**
 *  设置圆角
 *
 *  @param cornerRadius 可视化视图传入的值
 */
@dynamic cornerRadius;
- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

@end
