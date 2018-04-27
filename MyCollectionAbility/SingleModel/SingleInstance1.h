//
//  SingleInstance1.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/// 饿汉模式 实现单例
@interface SingleInstance1 : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger age;
+ (instancetype)shareInstance;
//- (instancetype)init NS_UNAVAILABLE;
//+ (instancetype)new NS_UNAVAILABLE;
@end
