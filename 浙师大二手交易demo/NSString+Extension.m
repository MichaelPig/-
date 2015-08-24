//
//  NSString+Extension.m
//  浙师大二手交易demo
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

@end
