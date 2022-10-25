//
//  NSTimer+BlocksSupport.h
//  MyCollection
//
//  Created by Apple on 2022/10/24.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (BlocksSupport)

+ (NSTimer *)xx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
