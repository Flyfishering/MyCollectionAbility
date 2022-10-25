//
//  main.m
//  MyCollection
//
//  Created by Apple on 2022/5/12.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoneyObj.h"
#import "NSPredicateDemo.h"
#import "MethodSwizzlingDemo.h"
#import "SafeObjTest.h"
#import "NSTimerDemo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        [[MoneyObj new] test];
//        [[NSPredicateDemo new] test];
//    [[MethodSwizzlingDemo new] test];
//        [[SafeObjTest new] test];
        [[NSTimerDemo new] test];
        NSLog(@"Hello, World!");
    }
    return 0;
}
