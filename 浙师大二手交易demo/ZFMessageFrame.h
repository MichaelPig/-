//
//  ZFMessageFrame.h
//  浙师大二手交易demo
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 Michael. All rights reserved.
//
#define ZFFontSize 15
#import <UIKit/UIKit.h>
@class ZFMessage;
@interface ZFMessageFrame : NSObject

@property (nonatomic,assign,readonly) CGRect iconFrame;
@property (nonatomic,assign,readonly) CGRect textFrame;

//行高
@property (nonatomic,assign,readonly) CGFloat rowHeight;
//模型对象
@property (nonatomic,strong) ZFMessage *message;

@end
