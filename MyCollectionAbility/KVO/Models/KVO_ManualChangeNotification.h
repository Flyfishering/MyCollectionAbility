//
//  KVO_ManualChangeNotification.h
//  MyCollectionAbility
//
//  Created by 兔子 on 2019/3/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVO_ManualChangeNotification : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int number;
@property (nonatomic, strong) NSArray <NSString *> *arr;
@property (nonatomic, strong) NSMutableArray<NSString *> *mutableArr;

@end

NS_ASSUME_NONNULL_END
