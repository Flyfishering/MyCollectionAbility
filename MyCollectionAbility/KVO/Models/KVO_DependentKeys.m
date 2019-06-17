//
//  KVO_DependentKeys.m
//  MyCollectionAbility
//
//  Created by 兔子 on 2019/3/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "KVO_DependentKeys.h"
#import "KVO_target.h"
@implementation KVO_DependentKeys



- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@",_firstName, _lastName];
}

- (NSString *)information{
    return [NSString stringWithFormat:@"age = %d  grade = %d",_target.age, _target.grade];
}

// 推荐使用 keyPathsForValuesAffecting<Key> ， 比下面的方法要好 keyPathsForValuesAffectingValueForKey
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"fullName"]) {
        NSArray *affectingKeys = @[@"lastName",@"firstName"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}
//keyPathsForValuesAffecting<Key> 推荐
+ (NSSet<NSString *> *)keyPathsForValuesAffectingFullName{
    return [NSSet setWithObjects:@"lastName",@"firstName", nil];
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingInformation{
    return [NSSet setWithObjects:@"target.age",@"target.grade", nil];
}
@end
