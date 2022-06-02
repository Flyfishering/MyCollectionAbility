//
//  NSObject+swizzling.h
//  MyCollection
//
//  Created by Apple on 2022/6/2.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (swizzling)

+(void)methodSwizzlingClass:(Class)cls orginalSEL:(SEL)orginalSEL replaceSEL:(SEL)replaceSEL;


+(void)methodSwizzlingOrginalClass:(Class)orginalCls replaceClass:(Class)replaceCls orginalSEL:(SEL)orginalSEL replaceSEL:(SEL)replaceSEL;

@end

NS_ASSUME_NONNULL_END
