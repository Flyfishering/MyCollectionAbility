//
//  SafeObjTest.m
//  MyCollection
//
//  Created by Apple on 2022/6/2.
//  Copyright © 2022 mac. All rights reserved.
//

#import "SafeObjTest.h"
#import "NSArray+WBBSafe.h"

@implementation SafeObjTest

- (void)test
{
    [self test_config];
    [self test_safeArr_1];
}

- (void)test_config
{
    [NSArray beforInitialize];
    [NSArray exchangeSafeMethod];
}

- (void)test_safeArr_1
{
    NSArray *array = @[@"1",@"2",@"3"];
    NSLog(@"%@\t\t%@",[array class], array[5]);
    
    array = [NSArray arrayWithArray:array];
    NSLog(@"%@\t\t%@",[array class], array[5]);

    array = [NSArray arrayWithObject:@"1"];
    NSLog(@"%@\t\t%@",[array class], array[5]);
    
    array = [NSArray arrayWithObjects:@"1",@"2", nil];
    NSLog(@"%@\t\t%@",[array class], array[5]);
    
    array = [NSArray array];
    NSLog(@"%@\t\t%@",[array class], array[5]);
    
    array = [array subarrayWithRange:NSMakeRange(0, 10)];
    NSLog(@"%@\t\t%@",[array class], array[5]);
}


@end
