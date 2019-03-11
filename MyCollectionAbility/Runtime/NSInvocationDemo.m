//
//  NSInvocationDemo.m
//  MyCollectionAbility
//
//  Created by seasaw on 2018/5/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSInvocationDemo.h"
#import "InvocationObject.h"
@implementation NSInvocationDemo
- (void)method1Test

{
    NSLog(@"method1Test");
}

- (NSInteger)mehtod2Test
{
    NSLog(@"method2Test");
    return 1;
}

- (UIViewController *)method3Test:(NSString*)str

{
    NSLog(@"参数:%@",str);
    return [[UIViewController alloc] init];
}

-(void)nsInvocationTest

{
    //无参数，无返回值
    //通过选择器获取方法签名
    SEL selector = @selector(method1Test);
    NSMethodSignature *methodSign = [[self class] instanceMethodSignatureForSelector:selector];
    //通过方法签名获得调用对象
    NSInvocation *methodInvocation = [NSInvocation invocationWithMethodSignature:methodSign];
    [methodInvocation setTarget:self];
    [methodInvocation setSelector:selector];
    [methodInvocation invoke];
    //有返回值，无参数
    
    selector = @selector(mehtod2Test);
    
    methodSign = [[self class] instanceMethodSignatureForSelector:selector];
    
    NSInvocation *mehtod2Invocation = [NSInvocation invocationWithMethodSignature:methodSign];
    
    [mehtod2Invocation setSelector:selector];
    
    [mehtod2Invocation invokeWithTarget:self];
    
    NSInteger returnValue = 0;
    
    [mehtod2Invocation getReturnValue:&returnValue];
    
    NSLog(@"返回值:%ld",returnValue);
    
    //有返回值，有参数
    
    selector = @selector(method3Test:);
    
    NSMethodSignature *method3Sign = [[self class] instanceMethodSignatureForSelector:selector];
    
    NSInvocation *method3Invocation = [NSInvocation invocationWithMethodSignature:method3Sign];
    
    [method3Invocation setTarget: self];
    
    [method3Invocation setSelector:selector];
    
    NSString *arg1 = @"testArg1";
    // atIndex: 中 0，1 默认传入 self , _cmd
    [method3Invocation setArgument:&arg1 atIndex:2];
    
    [method3Invocation invoke];
    
    //当返回值为对象是，arc情况下容易出现崩溃问题，如下两种解决方案。arc下vc如果用strong的，默认NSInvocation实现认为，已经对返回对象retain一次，实际上并没有，当返回对象出了作用域时候，已经被收回。导致崩溃。
    
//    解决方案1
    
//    void *vc = nil;
//
//     [method3Invocation getReturnValue:&vc];
//
//     NSLog(@"vc:%@",(__bridge ViewController*)vc);
    
    
    
//    解决方案2
    
//     UIViewController * __unsafe_unretained vc = nil;
//
//     [method3Invocation getReturnValue:&vc];
//
//     NSLog(@"vc:%@",vc);

    selector = @selector(methondOne);
    NSMethodSignature *method4Sign = [[InvocationObject class] instanceMethodSignatureForSelector:selector];
    //通过方法签名获得调用对象
    NSInvocation *method4Invocation = [NSInvocation invocationWithMethodSignature:method4Sign];
    [method4Invocation setTarget:[InvocationObject class]];
    [method4Invocation setSelector:selector];
    [method4Invocation invoke];
}

@end
