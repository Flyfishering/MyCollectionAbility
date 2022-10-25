//
//  NSObject+WBBSwizzling.m
//  MyCollection
//
//  Created by Apple on 2022/6/7.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSObject+WBBSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (WBBSwizzling)

+ (void)sizzleSelector:(SEL)selector toSelector:(SEL)toSelector cls:(Class)cls
{
    if (selector == NULL || toSelector == NULL) return;
    
    // 找到拥有该selector的类cls
    cls = [self findWhoHasSelector:selector cls:cls];
    if (cls == NULL) return;
    
    Method backupMethod = [self backupSelectorMethod:toSelector cls:cls];
    
    // 检查selector的imp与backupSelector的imp是否相同，如果相同则认为已经替换过了，不再进行替换操作
    if (class_getMethodImplementation(cls, selector) == class_getMethodImplementation(cls, method_getName(backupMethod))) {
        return;
    }
    
    // 如果cls没有有toSelector，则为cls添加name为toSelector，imp为backupSelector的方法
    class_addMethod(cls, toSelector, method_getImplementation(backupMethod), method_getTypeEncoding(backupMethod));

    Method selectorMethod = class_getInstanceMethod(cls, selector);
    Method toSelectorMethod = class_getInstanceMethod(cls, toSelector);
    method_exchangeImplementations(selectorMethod, toSelectorMethod);
}

+ (SEL)backupSelector:(SEL)toSelector
{
    const char *prefix = "backup_";
    const char *toName = sel_getName(toSelector);
    //  + 1 字符串最后包含 \0
    char *backupName = (char *)malloc(strlen(prefix) + strlen(toName) + 1);
    strcpy(backupName, prefix);
    strcat(backupName, toName);
    SEL result = sel_registerName(backupName);
    free(backupName);
    backupName = NULL;
    return result;
}

+ (Method)backupSelectorMethod:(SEL)toSelector cls:(Class)cls
{
    // 查找backupSelector
    // 如果没有则认为是第一次替换方法，此时需要拷贝toSelector到backupSelector
    
    SEL backupSelector = [self backupSelector:toSelector];
    Method backupMethod = class_getInstanceMethod(cls, backupSelector);
    if(backupMethod != NULL){
        return backupMethod;
    }
    
    Class rootCls = [self findWhoHasSelector:toSelector cls:cls];
    if (rootCls == NULL) {
        return NULL;
    }
    
    class_addMethod(rootCls, backupSelector, class_getMethodImplementation(rootCls, toSelector), method_getTypeEncoding(class_getInstanceMethod(self, toSelector)));
    // 为backupMethod赋值
    backupMethod = class_getInstanceMethod(rootCls, backupSelector);
    return backupMethod;
}

/// 找到当前Class中寻找selector，如果没有则在其父类中寻找，直到在Root Class上寻找不到时，返回NULL
/// @param selector 指定的selector
+ (Class)findWhoHasSelector:(SEL)selector cls:(Class)cls
{
    while (cls) {
        if ([self checkExistSelector:selector cls:cls]) {
            break;
        }
        cls = class_getSuperclass(cls);
    }
    return cls;
}


/// 检查当前Class是否有指定的selector
/// @param selector 指定的selector
+ (BOOL)checkExistSelector:(SEL)selector cls:(Class)cls
{
    if (selector == NULL) {
        return NO;
    }
    
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL methodSel = method_getName(method);
        if (methodSel == selector) {
            return YES;
        }
    }
    return NO;
}

@end
