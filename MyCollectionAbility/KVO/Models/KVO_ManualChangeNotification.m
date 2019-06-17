//
//  KVO_ManualChangeNotification.m
//  MyCollectionAbility
//
//  Created by 兔子 on 2019/3/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "KVO_ManualChangeNotification.h"

@implementation KVO_ManualChangeNotification
- (instancetype)init{
    if (self = [super init]) {
        self.name = @"name";
        self.number = 0;
        self.arr = @[@"1",@"2",@"3"];
        self.mutableArr = [@[@"one",@"two",@"three"] mutableCopy];
    }
    return self;
}


// 手动改管理 kvo 触发，有个明显的好处，就是，我们在不需要触发kvo时可以很容易的停止触发，如下
// 当 name 在设值 前和 设值后 是一样的比如都是 王小小，我们就可以不触发kvo
// 如果是 自动 kvo 就无法达到这样的控制效果。
- (void)setName:(NSString *)name{
    if (![_name isEqualToString:name]) {
        [self willChangeValueForKey:@"name"];
        _name = name;
        [self didChangeValueForKey:@"name"];
    }
}
// 设值 kvo 触发条件， 只有当 bunber > 10 的时候，才会触发 kvo。
- (void)setNumber:(int)number{
    if (number>10) {
        [self willChangeValueForKey:@"number"];
        _number = number;
        [self didChangeValueForKey:@"number"];
    }
}

- (void)setArr:(NSArray<NSString *> *)arr{
    [self willChangeValueForKey:@"arr"];
    _arr = arr;
    [self didChangeValueForKey:@"arr"];
}
// 可变容器添加手动kvo，可变容器内部元素发生添加，移除，替换时触发kvo
// 插入单个 元素
- (void)insertObject:(NSString *)object inMutableArrAtIndex:(NSUInteger)index{
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:@"mutableArr"];
    [_mutableArr insertObject:object atIndex:index];
     [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:@"mutableArr"];
}

// 删除 单个元素
- (void)removeObjectFromMutableArrAtIndex:(NSUInteger)index{
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:@"mutableArr"];
    [_mutableArr removeObjectAtIndex:index];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:@"mutableArr"];
}
// 插入 多个元素
- (void)insertMutableArr:(NSArray *)array atIndexes:(NSIndexSet *)indexes{
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"mutableArr"];
    [_mutableArr insertObjects:array atIndexes:indexes];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"mutableArr"];
}
// 删除多个元素
- (void)removeMutableArrAtIndexes:(NSIndexSet *)indexes{
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"mutableArr"];
    [_mutableArr removeObjectsAtIndexes:indexes];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"mutableArr"];
}
// 替换 单个
- (void)replaceObjectInMutableArrAtIndex:(NSUInteger)index withObject:(id)object{
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:@"mutableArr"];
    [_mutableArr replaceObjectAtIndex:index withObject:object];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:@"mutableArr"];
}
// 替换 多个
- (void)replaceMutableArrAtIndexes:(NSIndexSet *)indexes withMutableArr:(NSArray *)array{
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"mutableArr"];
    [_mutableArr replaceObjectsAtIndexes:indexes withObjects:array];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"mutableArr"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    BOOL automatic = NO;
    if ([key isEqualToString:@"name"]) {
        automatic = NO;
    }else if ([key isEqualToString:@"number"]){
        automatic = NO;
    }else if ([key isEqualToString:@"arr"]){
        automatic = NO;
    }else if ([key isEqualToString:@"mutableArr"]){
        automatic = NO;
    }else {
        automatic = [super automaticallyNotifiesObserversForKey:key];
    }
    return automatic;
}
@end
