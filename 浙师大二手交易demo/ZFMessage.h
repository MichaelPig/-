//
//  ZFMessage.h
//  浙师大二手交易demo
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFMessage : NSObject

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *time;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)messageWithDict:(NSDictionary *)dict;
+ (NSArray *) messagesList;

@end
