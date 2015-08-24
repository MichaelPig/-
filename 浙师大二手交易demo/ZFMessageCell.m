//
//  ZFMessageCell.m
//  浙师大二手交易demo
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZFMessageCell.h"
#import "ZFMessageFrame.h"
#import "ZFMessage.h"
@interface ZFMessageCell()

@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UIButton *textView;

@end

@implementation ZFMessageCell

//1.创建可重用cell的对象
+ (instancetype)messageCellWithTableView:(UITableView *)tableView{
    static NSString *reusedId = @"msg";
    ZFMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
    }
    return cell;
}
//2.创建子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //内容
        UIButton *textView = [[UIButton alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        //设置字体颜色
        [textView setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //设置圆角
        iconView.layer.cornerRadius = 25;
        iconView.layer.masksToBounds = YES;
    }
    return self;
}

//3.重写属性setter方法
- (void)setMessageFrame:(ZFMessageFrame *)messageFrame{
    _messageFrame = messageFrame;
    ZFMessage *msg = messageFrame.message;
    //3.1给子控件赋值
    NSString *imageName = @"me";
    self.iconView.image = [UIImage imageNamed:imageName];
    [self.textView setTitle:msg.text forState:UIControlStateNormal];
    //3.2设置子控件的frame
    self.iconView.frame = messageFrame.iconFrame;
    self.textView.frame = messageFrame.textFrame;
}

@end
