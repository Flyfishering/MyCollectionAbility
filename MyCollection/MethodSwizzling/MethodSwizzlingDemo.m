//
//  MethodSwizzlingDemo.m
//  MyCollection
//
//  Created by Apple on 2022/6/2.
//  Copyright © 2022 mac. All rights reserved.
//

#import "MethodSwizzlingDemo.h"
#import "NSObject+swizzling.h"
#import <objc/runtime.h>

@interface MethodSwizzlingDemoOne : NSObject

@end

@implementation MethodSwizzlingDemoOne

- (void)testMethod
{
    NSLog(@"%s",__func__);
}

+ (void)testMethod
{
    NSLog(@"%s",__func__);
}

@end




@implementation MethodSwizzlingDemo

- (void)test
{
    [self test_methodSwizzling_1];
//    [self test_methodSwizzling_2];
//    [self test_methodSwizzling_3];
//    [self test_methodSwizzling_4];
//    [self test_methodSwizzling_5];
}

/// 实例方法和实例方法交换 (相同类)
- (void)test_methodSwizzling_1
{
    [NSObject methodSwizzlingOrginalClass:[self class] replaceClass:[self class] orginalSEL:@selector(orginMethod) replaceSEL:@selector(replaceMethod)];
    [self orginMethod];
    [self replaceMethod];
}

/// 实例方法和实例方法交换 (不同类)
- (void)test_methodSwizzling_2
{
    [NSObject methodSwizzlingOrginalClass:[self class] replaceClass:[MethodSwizzlingDemoOne class] orginalSEL:@selector(orginMethod) replaceSEL:@selector(testMethod)];
    [self orginMethod];
    [[MethodSwizzlingDemoOne new] testMethod];
}

/// 类方法和类方法交换 (相同类)
- (void)test_methodSwizzling_3
{
    Class class = object_getClass([self class]);
    [NSObject methodSwizzlingClass:class orginalSEL:@selector(orginClassMethod) replaceSEL:@selector(replaceClassMethod)];
    [[self class] orginClassMethod];
    [[self class] replaceClassMethod];
}

/// 类方法和类方法交换 (不同类)
- (void)test_methodSwizzling_4
{
    Class OrginClass = object_getClass([self class]);
    Class replaceClass = object_getClass([MethodSwizzlingDemoOne class]);

    [NSObject methodSwizzlingOrginalClass:OrginClass replaceClass:replaceClass orginalSEL:@selector(orginClassMethod) replaceSEL:@selector(testMethod)];
    [[self class] orginClassMethod];
    [[MethodSwizzlingDemoOne class] testMethod];
}

/// 类方法和实例方法交换(不同类)
- (void)test_methodSwizzling_5
{
    Class OrginClass = object_getClass([self class]);
    Class replaceClass = [self class];

    [NSObject methodSwizzlingOrginalClass:OrginClass replaceClass:replaceClass orginalSEL:@selector(orginClassMethod) replaceSEL:@selector(replaceMethod)];
    [[self class] orginClassMethod];
    [self replaceMethod];
}


- (void)orginMethod
{
    NSLog(@"%s",__func__);
}

- (void)replaceMethod
{
    NSLog(@"%s",__func__);
}

+ (void)orginClassMethod
{
    NSLog(@"%s",__func__);
}

+ (void)replaceClassMethod
{
    NSLog(@"%s",__func__);
}


@end
