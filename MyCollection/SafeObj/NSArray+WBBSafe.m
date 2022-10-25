//
//  NSArray+WBBSafe.m
//  MyCollection
//
//  Created by Apple on 2022/6/2.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSArray+WBBSafe.h"
#import "NSObject+WBBSwizzling.h"
#import <objc/runtime.h>

static char * clsNameArr[50];
static int clsNameArr_idx = 0;

static NSMutableArray *clsList = nil;

@implementation NSArray (WBBSafe)



+ (void)initialize {
    [super initialize];
    clsNameArr[clsNameArr_idx] = (char *)object_getClassName(self);
    clsNameArr_idx++;
}

+ (void)beforInitialize
{
    NSArray *arr = [NSArray array];
    arr = @[];
    arr = @[@"1"];
    arr = @[@"1",@"2",@"3",];
    arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",];
    arr = [arr mutableCopy];
    
    
    for(NSInteger i = 0; i < clsNameArr_idx ; i++){
      
        printf("wbbtest: %s \n",clsNameArr[i]);
    }
    
}

+ (void)exchangeSafeMethod {
    
    if(!clsList){
        clsList = [@[] mutableCopy];
    }
    
    for(NSInteger i = 0; i < clsNameArr_idx ; i++){
        Class cls = objc_getClass(clsNameArr[i]);
        [clsList addObject:cls];
    }
    
    [clsList enumerateObjectsUsingBlock:^(id  _Nonnull cls, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [NSObject sizzleSelector:@selector(initWithObjects:count:)
                      toSelector:@selector(safe_initWithObjects:count:)
                             cls:cls];
        [NSObject sizzleSelector:@selector(objectAtIndex:)
                      toSelector:@selector(safe_objectAtIndex:)
                             cls:cls];
        [NSObject sizzleSelector:@selector(objectAtIndexedSubscript:)
                      toSelector:@selector(safe_objectAtIndexedSubscript:)
                             cls:cls];
        [NSObject sizzleSelector:@selector(getObjects:range:)
                      toSelector:@selector(safe_getObjects:range:)
                             cls:cls];
        [NSObject sizzleSelector:@selector(subarrayWithRange:)
                      toSelector:@selector(safe_subarrayWithRange:)
                             cls:cls];

    }];

    
}


- (instancetype)safe_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt {
    id __unsafe_unretained newObjects[cnt];
    NSUInteger index = 0;
    for (int i = 0; i < cnt; i++) {
        if (objects[i] == nil) {
            continue;
        }
        newObjects[index++] = objects[i];
    }
    return [self safe_initWithObjects:newObjects count:index];
}


- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= [(NSArray *)self count]) {
        NSLog(@"out of array range  %@", NSStringFromClass(self.class));
        return nil;
    }
    
    id obj = [self safe_objectAtIndex:index];
    return obj;
}

- (id)safe_objectAtIndexedSubscript:(NSUInteger)index
{
    if (index >= [(NSArray *)self count]) {
        NSLog(@"out of array range  %@", NSStringFromClass(self.class));
        return nil;
    }
    
    id obj = [self safe_objectAtIndex:index];
    return obj;
}

- (void)safe_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    if (range.location + range.length > self.count) {
        return;
    }
    [self safe_getObjects:objects range:range];
}

- (NSArray *)safe_subarrayWithRange:(NSRange)range {
    if (range.location + range.length > self.count) {
        NSLog(@"error subarrayWithRange -- %@", self.class);
        return @[];
    }
    return [self safe_subarrayWithRange:range];
}



@end
