//
//  KVCValidatingObject.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCValidatingObject.h"

@implementation KVCValidatingObject
// kvc 属性验证
// 1. 验证属性有效，没有捕获错误，不改变属性值，返回 YES
// 2. 验证属性无效， 不改变属性值，将错误指向无效的属性引用 返回 NO
// 3. 验证属性的值 无效，创建一个新值 给 属性赋值，返回 YES

///////// 一般情况下 不用实现下面两个方法，在用到的时候直接调用就可，系统自动帮我们实现了这两个方法，
///////// 调用时候 会自动连带调用 validate<Key>:error: 方法，在这个方法里 我们做一些验证
//- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError{
//
//    return YES;
//}
//////
//- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKeyPath:(NSString *)inKeyPath error:(out NSError * _Nullable __autoreleasing *)outError{
//    return YES;
//}

// 只有实现了方法 validate<Key>:error: 才会自动验证
- (BOOL)validateName:(id *)name error:(NSError **)error{
    NSLog(@"%s----验证 name 属性",__func__);
    return NO;
}

@end
