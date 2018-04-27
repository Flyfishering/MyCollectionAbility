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
//- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError{
//    return YES;
//}
//
//- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKeyPath:(NSString *)inKeyPath error:(out NSError * _Nullable __autoreleasing *)outError{
//    return YES;
//}

// 只有实现了方法 validate<Key>:error: 才会自动验证
- (BOOL)validateName:(id *)name error:(NSError **)error{
    return NO;
}
@end
