//
//  WBBTime.h
//  MyCollection
//
//  Created by Apple on 2022/10/25.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WBBTimeDelegate <NSObject>

- (void)timeAction;

@end

@protocol WBBTimeProtocol <NSObject>

- (instancetype)initWithBlock:(void(^)(int count))block;
/// 开始
- (void)start;
/// 暂停
- (void)stop;
///  重新开始
- (void)reStart;

@end


/// 计时器 1s 钟回调一次 block
@interface WBBTime : NSObject<WBBTimeProtocol>

@end

NS_ASSUME_NONNULL_END
