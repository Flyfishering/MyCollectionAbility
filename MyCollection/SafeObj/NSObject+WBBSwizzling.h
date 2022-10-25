//
//  NSObject+WBBSwizzling.h
//  MyCollection
//
//  Created by Apple on 2022/6/7.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WBBSwizzling)

+ (void)sizzleSelector:(SEL)selector toSelector:(SEL)toSelector cls:(Class)cls;

@end

NS_ASSUME_NONNULL_END
