//
//  KVO_Department.h
//  MyCollectionAbility
//
//  Created by 兔子 on 2019/3/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KVO_Employees;
NS_ASSUME_NONNULL_BEGIN

@interface KVO_Department : NSObject
{
    NSNumber *_totalSalary;
}
@property (nonatomic, strong) NSNumber *totalSalary;
@property (nonatomic, strong) NSMutableArray <KVO_Employees*>*employees;

- (void)observeObject:(NSObject *)obj key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
