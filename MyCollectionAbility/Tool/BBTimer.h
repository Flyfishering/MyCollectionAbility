//
//  BBTimer.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBTimer : NSObject


+ (BBTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(BBTimer *timer))block;

///  开始/暂停
- (void)resume;

/// 取消
- (void)cancel;



@end

NS_ASSUME_NONNULL_END
