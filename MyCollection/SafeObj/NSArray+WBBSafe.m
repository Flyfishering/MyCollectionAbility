//
//  NSArray+WBBSafe.m
//  MyCollection
//
//  Created by Apple on 2022/6/2.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSArray+WBBSafe.h"
#import <objc/runtime.h>

@implementation NSArray (WBBSafe)

+ (void)initialize {
    [super initialize];
    
    [self exchangeSafeMethod];
}

+ (void)exchangeSafeMethod {
    [self safe_sizzleSelector:@selector(initWithObjects:count:) toSelector:@selector(safe_initWithObjects:count:)];
    [self safe_sizzleSelector:@selector(objectAtIndex:) toSelector:@selector(safe_objectAtIndex:)];
    [self safe_sizzleSelector:@selector(objectAtIndexedSubscript:) toSelector:@selector(safe_objectAtIndexedSubscript:)];

    [self safe_sizzleSelector:@selector(getObjects:range:) toSelector:@selector(safe_getObjects:range:)];
    [self safe_sizzleSelector:@selector(subarrayWithRange:) toSelector:@selector(safe_subarrayWithRange:)];
}

+ (void)safe_sizzleSelector:(SEL)selector toSelector:(SEL)toSelector {
    if (selector == NULL || toSelector == NULL) {
        return;
    }
    
    // 找到拥有该selector的类cls
    Class cls = [self findWhoHasSelector:selector];
    if (cls == NULL) {
        return;
    }
    
    // 查找backupSelector
    // 如果没有则认为是第一次替换方法，此时需要拷贝toSelector到backupSelector
    const char *prefix = "backup_";
    const char *toName = sel_getName(toSelector);
    char *backupName = (char *)malloc(strlen(prefix) + strlen(toName) + 1);
    strcpy(backupName, prefix);
    strcat(backupName, toName);
    SEL backupSelector = sel_registerName(backupName);
    Method backupMethod = class_getInstanceMethod(cls, backupSelector);
    if (backupMethod == NULL) {
        Class rootCls = [self findWhoHasSelector:toSelector];
        if (rootCls == NULL) {
            return;
        }
        
        class_addMethod(rootCls, backupSelector, class_getMethodImplementation(rootCls, toSelector), method_getTypeEncoding(class_getInstanceMethod(self, toSelector)));
        
        // 为backupMethod赋值
        backupMethod = class_getInstanceMethod(rootCls, backupSelector);
    }
    
    // 检查selector的imp与backupSelector的imp是否相同，如果相同则认为已经替换过了，不再进行替换操作
    if (class_getMethodImplementation(cls, selector) == class_getMethodImplementation(cls, backupSelector)) {
        return;
    }
    
    // 如果cls没有有toSelector，则为cls添加name为toSelector，imp为backupSelector的方法
    class_addMethod(cls, toSelector, method_getImplementation(backupMethod), method_getTypeEncoding(backupMethod));
    
    [cls exchangeSelector:selector toSelector:toSelector class:cls];
}

/// 检查当前Class是否有指定的selector
/// @param selector 指定的selector
+ (BOOL)checkExistSelector:(SEL)selector {
    if (selector == NULL) {
        return NO;
    }
    
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(self, &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL methodSel = method_getName(method);
        if (methodSel == selector) {
            return YES;
        }
    }
    return NO;
}

/// 找到当前Class中寻找selector，如果没有则在其父类中寻找，直到在Root Class上寻找不到时，返回NULL
/// @param selector 指定的selector
+ (Class)findWhoHasSelector:(SEL)selector {
    Class cls = self;
    while (cls) {
        if ([cls checkExistSelector:selector]) {
            break;
        }
        cls = class_getSuperclass(cls);
    }
    return cls;
}

/// 交换当前Class上的两个方法的实现
+ (void)exchangeSelector:(SEL)selector toSelector:(SEL)toSelector class:(Class)cls{
    Method originalMethod = class_getInstanceMethod(cls, selector);
    Method customMethod = class_getInstanceMethod(cls, toSelector);
    
    method_exchangeImplementations(originalMethod, customMethod);
}

- (instancetype)safe_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt {
    id __unsafe_unretained newObjects[cnt];
    NSUInteger index = 0;
    for (int i = 0; i < cnt; i++) {
        if (objects[i] == nil) {
            continue;
        }
        newObjects[index++] = objects[i];
    }
    return [self safe_initWithObjects:newObjects count:index];
}


- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= [(NSArray *)self count]) {
        NSLog(@"out of array range  %@", NSStringFromClass(self.class));
        return nil;
    }
    
    id obj = [self safe_objectAtIndex:index];
    return obj;
}

- (id)safe_objectAtIndexedSubscript:(NSUInteger)index
{
    if (index >= [(NSArray *)self count]) {
        NSLog(@"out of array range  %@", NSStringFromClass(self.class));
        return nil;
    }
    
    id obj = [self safe_objectAtIndex:index];
    return obj;
}

- (void)safe_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    if (range.location + range.length > self.count) {
        return;
    }
    [self safe_getObjects:objects range:range];
}

- (NSArray *)safe_subarrayWithRange:(NSRange)range {
    if (range.location + range.length > self.count) {
        NSLog(@"error subarrayWithRange -- %@", self.class);
        return @[];
    }
    return [self safe_subarrayWithRange:range];
}



@end
