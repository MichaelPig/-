//
//  ZFMessageCell.h
//  浙师大二手交易demo
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFMessageFrame;
@interface ZFMessageCell : UITableViewCell

@property (nonatomic,strong) ZFMessageFrame *messageFrame;

+ (instancetype)messageCellWithTableView:(UITableView *)tableView;

@end
