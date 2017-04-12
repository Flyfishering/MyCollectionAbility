//
//  SingelAndBlockSingel.h
//  MyCollectionAbility
//
//  Created by mac on 17/3/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingelAndBlockSingel : NSObject
@property (nonatomic, copy) void (^blockMethod)();
+ (instancetype)shareManager;
@end
