//
//  NSObject+swizzling.m
//  MyCollection
//
//  Created by Apple on 2022/6/2.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSObject+swizzling.h"
#import <objc/runtime.h>
@implementation NSObject (swizzling)


+(void)methodSwizzlingClass:(Class)cls orginalSEL:(SEL)orginalSEL replaceSEL:(SEL)replaceSEL
{
    [self methodSwizzlingOrginalClass:cls replaceClass:cls orginalSEL:orginalSEL replaceSEL:replaceSEL];
}


+(void)methodSwizzlingOrginalClass:(Class)orginalCls replaceClass:(Class)replaceCls orginalSEL:(SEL)orginalSEL replaceSEL:(SEL)replaceSEL
{
    Method originalMethod = class_getInstanceMethod(orginalCls, orginalSEL);
    Method replaceMethod = class_getInstanceMethod(replaceCls, replaceSEL);

    if(!originalMethod) assert(NO);
    if(!replaceMethod) assert(NO);

    BOOL didAddMethod =
    class_addMethod(orginalCls,
                    orginalSEL,
                    method_getImplementation(replaceMethod),
                    method_getTypeEncoding(replaceMethod));

    if (didAddMethod) {
        class_replaceMethod(orginalCls,
                            replaceSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, replaceMethod);
    }
}


@end
