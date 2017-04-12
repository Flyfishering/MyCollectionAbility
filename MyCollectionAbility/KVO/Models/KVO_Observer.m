//
//  KVO_Observer.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "KVO_Observer.h"
#import <objc/runtime.h>

@implementation KVO_Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    Class classInfo = (__bridge Class)context;
    
    if ([keyPath isEqualToString:@"age"]) {
        NSString *className = [NSString stringWithCString:object_getClassName(classInfo) encoding:NSUTF8StringEncoding];
        NSLog(@" >> class: %@, Age changed", className);
        NSLog(@"old age is %@",[change objectForKey:@"old"]);
        NSLog(@"new age is %@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
    else if ([keyPath isEqualToString:@"information"])
    {
        Class classInfo = (__bridge Class)context;
        NSString * className = [NSString stringWithCString:object_getClassName(classInfo)
                                                  encoding:NSUTF8StringEncoding];
        NSLog(@" >> class: %@, Information changed", className);
        NSLog(@" old information is %@", [change objectForKey:@"old"]);
        NSLog(@" new information is %@", [change objectForKey:@"new"]);
    }
    else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
