//
//  ZFMessageFrame.m
//  浙师大二手交易demo
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZFMessageFrame.h"
#import "ZFMessage.h"
#import "NSString+Extension.h"
@implementation ZFMessageFrame

- (void)setMessage:(ZFMessage *)message{
    _message = message;
    //获取屏幕
//    UIScreen *screen = [UIScreen mainScreen];
    CGFloat margin = 10;
    //头像
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    CGFloat iconX = margin;
    CGFloat iconY = 10;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //内容
    CGSize textSize = [message.text sizeWithMaxSize:CGSizeMake(200, MAXFLOAT) fontSize:ZFFontSize];
    CGSize buttonSize = CGSizeMake(textSize.width + 20 * 2, textSize.height + 20 * 2);
    CGFloat textY = iconY;
    CGFloat textX = CGRectGetMaxX(_iconFrame);
    _textFrame = CGRectMake(textX, textY, buttonSize.width, buttonSize.height);
    //计算行高
    CGFloat iconMaxY = CGRectGetMaxY(_iconFrame);
    CGFloat textMaxY = CGRectGetMaxY(_textFrame);
    
    _rowHeight = MAX(iconMaxY, textMaxY) + 10;
}

@end
