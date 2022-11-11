//
//  NSString+Number.h
//  MyCollection
//
//  Created by Apple on 2022/11/11.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Number)


/// 是否 浮点值
- (BOOL)isFloatValue;
/// 是否 浮点值 +
- (BOOL)isFloatValuePositive;
/// 是否 浮点值 -
- (BOOL)isFloatValueNegtive;
/// 是否是 两位小数  金额数字
- (BOOL)isMoneyString;



@end

NS_ASSUME_NONNULL_END
