//
//  KVCGetObject.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCGetSetObject.h"

@interface KVCGetSetObject()
{
    NSString *address;
}
@property (nonatomic, strong) NSString *school;
@end


@implementation KVCGetSetObject

// KVC 是否查找 实例变量 默认 返回 YES
+ (BOOL)accessInstanceVariablesDirectly{
    return YES;
}

- (instancetype)init{
    if (self = [super init]) {
        self.age = 30;
        _title = @"kvc 应用";
        Floats floatsTemp = {2.3, 4.12, 5.09};
        self.floats = floatsTemp;
        self.name = @"王某某";
        self.books = @[@"诗经",@"易经",@"论语",@"传习录"];
        self.friends = [NSSet setWithObjects:@"张某某",@"冯某某",@"房某某", nil];
        address = @"某某省，某某市，某某小区";
        self.school = @"中国某某大学";
        self.mutableArray = [@[@"1",@"1",@"1",@"1"] mutableCopy];
        self.isHidden = NO;
    }
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key{
    
    NSLog(@"属性不存在 %@",key);
    return [super valueForUndefinedKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"属性不存在 : %@",key);
    [super setValue:value forUndefinedKey:key];
}

- (void)setNilValueForKey:(NSString *)key{
    // 当对非 对象 属性 置为 nil 时，要设置一个默认的值。
    if ([key isEqualToString:@"isHidden"]) {
        [self setValue:@(NO) forKey:@"isHidden"];
    }else {
        [super setNilValueForKey:key];
    }
}
// kvc 返回 数组属性 方法
- (NSUInteger)countOfBooks{
    return self.books.count;
}
- (id)objectInBooksAtIndex:(NSUInteger)index{
    return [self.books objectAtIndex:index];
}
- (NSArray *)booksAtIndexes:(NSIndexSet *)indexes{
    return [self.books objectsAtIndexes:indexes];
}

// kvc 返回 Set 属性 方法
- (NSUInteger)countOfFriends{
    return self.friends.count;
}

- (NSEnumerator *)enumeratorOfFriends{
    return [self.friends objectEnumerator];
}
//- (<#object-type#> *)memberOfFriends:(<#object-type#> *)object{
//    
//}

// KVC 可变集合  下面这四个方法 也可以不用实现 （有了下面这四个方法，性能更优）
- (void)insertObject:(id )object inMutableArrayAtIndex:(NSInteger)index{
    [self.mutableArray insertObject:object atIndex:index];  
}

- (void)removeObjectFromMutableArrayAtIndex:(NSUInteger)index{
    [self.mutableArray removeObjectAtIndex:index];
}

- (void)insertMutableArray:(NSArray *)array atIndexes:(NSIndexSet *)indexes{
    [self.mutableArray insertObjects:array atIndexes:indexes];
}

- (void)removeMutableArrayAtIndexes:(NSIndexSet *)indexes{
    [self.mutableArray removeObjectsAtIndexes:indexes];
}

//- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key{
//    
//}

@end
