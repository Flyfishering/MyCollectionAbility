//
//  KVCBankAccount.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCBankAccount.h"

@implementation KVCBankAccount

- (id)valueForUndefinedKey:(NSString *)key{
    
    [self raiseException];
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    [self raiseException];
}

- (void)setNilValueForKey:(NSString *)key{
    
}

- (void)raiseException{
    NSException *exception = [NSException exceptionWithName:@"UndefinedKey" reason:@"传入了不识别的 key" userInfo:nil];
    [exception raise];
}
@end
