//
//  NSString+Number.m
//  MyCollection
//
//  Created by Apple on 2022/11/11.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

- (BOOL)isFloatValue
{
    return [self isFloatValuePositive] || [self isFloatValueNegtive];
}



- (BOOL)isFloatValuePositive
{
    NSString *regex = @"^[1-9]\\d*\\.\\d+$|^0\\.\\d+$|^[1-9]\\d*$|^0$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    if([predicate evaluateWithObject:self]){
        return YES;
    }
    return NO;
}



- (BOOL)isFloatValueNegtive
{
    NSString *regex = @"^-[1-9]\\d*\\.\\d+$|^-0\\.\\d+$|^-[1-9]\\d*$|^0$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    if([predicate evaluateWithObject:self]){
        return YES;
    }
    return NO;
}



/// 是否是 两位小数  金额数字
- (BOOL)isMoneyString
{
    NSString *regex = @"^[1-9]\\d*\\.\\d{1,2}$|^0\\.\\d{1,2}|^[1-9]\\d*$|^0$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    if([predicate evaluateWithObject:self]){
        return YES;
    }
    return NO;
}

@end
