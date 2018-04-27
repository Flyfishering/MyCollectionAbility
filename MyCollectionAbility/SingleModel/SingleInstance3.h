//
//  SingleInstance3.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleInstance3 : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSObject *obj;
@property (nonatomic,strong) NSArray *arr;
+ (instancetype)shareInstance;
//- (instancetype)init NS_UNAVAILABLE;
//+ (instancetype)new NS_UNAVAILABLE;
@end
