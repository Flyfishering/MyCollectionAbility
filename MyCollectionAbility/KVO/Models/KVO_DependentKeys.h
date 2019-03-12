//
//  KVO_DependentKeys.h
//  MyCollectionAbility
//
//  Created by 兔子 on 2019/3/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KVO_target;
NS_ASSUME_NONNULL_BEGIN

/**
 kvo 中存在 key 依赖情况
 */
@interface KVO_DependentKeys : NSObject

@property (nonatomic, strong) NSString *fullName; /// 名字
@property (nonatomic, strong) NSString *firstName; /// 姓
@property (nonatomic, strong) NSString *lastName;  /// 名

@property (nonatomic, strong) NSString *information;  /// 信息
@property (nonatomic, strong) KVO_target *target;  /// keyPath 依赖
@end

NS_ASSUME_NONNULL_END
