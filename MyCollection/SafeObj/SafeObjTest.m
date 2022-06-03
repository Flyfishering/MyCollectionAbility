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
    [self test_safeArr_1];
}

- (void)test_safeArr_1
{
    NSArray *array = @[@"1",@"2",@"3"];
    NSLog(@"%@",array[5]);
}


@end
