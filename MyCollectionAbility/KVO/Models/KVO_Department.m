//
//  KVO_Department.m
//  MyCollectionAbility
//
//  Created by 兔子 on 2019/3/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "KVO_Department.h"
#import "KVO_Employees.h"
#import "KVO_Header.h"



static void *salaryContext = &salaryContext;
@interface KVO_Department()
@property (nonatomic, strong) NSObject *obj;
@end



@implementation KVO_Department
@synthesize totalSalary = _totalSalary;

#pragma mark -  kvo 相关
- (void)observeObject:(NSObject *)obj key:(NSString *)key{
    self.obj = obj;
    [obj addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:salaryContext];
}
- (void)removeObserverWithObj:(NSObject *)obj key:(NSString *)key context:(void *)context{
    [obj removeObserver:self forKeyPath:key context:context];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (context == salaryContext) {
        [self updateTotalSalary];
    }
    else{
        // deal with other observations and/or invoke super...
    }
}
// 是否自动触发 kvo
+ (BOOL)automaticallyNotifiesObserversOfTotalSalary{
    return NO;
}

- (void)updateTotalSalary {
    [self setTotalSalary:[self valueForKeyPath:@"employees.@sum.salary"]];
}

- (void)setTotalSalary:(NSNumber *)newTotalSalary {
    
    if (_totalSalary != newTotalSalary) {
        [self willChangeValueForKey:@"totalSalary"];
        _totalSalary = newTotalSalary;
        [self didChangeValueForKey:@"totalSalary"];
    }
}


// -------------------kvc 原理创建 可变数组代理  开始
- (void)insertObject:(KVO_Employees *)object inEmployeesAtIndex:(NSUInteger)index{
    [self observeObject:object key:NSStringFromSelector(@selector(salary))];
    [_employees insertObject:object atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index{
    // @try @catch 避免 kvo 移除时出现的异常
    @try {
        [self removeObserverWithObj:_employees[index] key:NSStringFromSelector(@selector(salary)) context:salaryContext];
    } @catch (NSException *exception) {
        
    } @finally {
         [_employees removeObjectAtIndex:index];
    }
}
// -------------------kvc 原理创建 可变数组代理  结束


- (NSNumber *)totalSalary {
    return _totalSalary;
}

@end
