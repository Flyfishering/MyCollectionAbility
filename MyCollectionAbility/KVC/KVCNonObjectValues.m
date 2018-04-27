//
//  KVCNonObjectValues.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCNonObjectValues.h"
#import <UIKit/UIKit.h>

typedef struct {
    float x, y, z;
} ThreeFloats;

@interface KVCNonObjectValues()
@property (nonatomic) ThreeFloats threeFloats;
@end


@implementation KVCNonObjectValues

- (void)setValueWithStruct{
    ThreeFloats floats = {1., 2., 3.};
    NSValue* value = [NSValue valueWithBytes:&floats objCType:@encode(ThreeFloats)];
    [self setValue:value forKey:@"threeFloats"];
    NSValue *resultValue = [self valueForKey:@"threeFloats"];
    NSLog(@"resultValue = %@",resultValue);
}

+ (void)scalarToNSNumber{
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];
    BOOL boolValue = [boolNumber boolValue];
    
    NSNumber *charNumber = [NSNumber numberWithChar:'a'];
    char charValue = [charNumber charValue];
    
    NSNumber *doubleNumber = [NSNumber numberWithDouble:230994.9090];
    double doubleValue = [doubleNumber doubleValue];
    
    NSNumber *floatNumber = [NSNumber numberWithFloat:23.000];
    float floatValue = [floatNumber floatValue];
    
    NSNumber *intNumber = [NSNumber numberWithInt:12];
    int intValue = [intNumber intValue];
    
    NSNumber *longNumber = [NSNumber numberWithLong:1234567];
    long longValue = [longNumber longLongValue];
    
    NSNumber *longlongNumber = [NSNumber numberWithLongLong:1234567890123456];
    long long longlongVlaue = [longNumber longLongValue];
    
    NSNumber *shortNumber = [NSNumber numberWithShort:1];
    short shortValue = [shortNumber shortValue];
    
    NSNumber *unsignedCharNumber = [NSNumber numberWithUnsignedChar:'c'];
    unsigned char unsignedCharValue = [unsignedCharNumber unsignedCharValue];
    
    NSNumber *unsignedIntNumber = [NSNumber numberWithUnsignedInt:122];
    unsigned int unsignedInt = [unsignedIntNumber unsignedIntValue];
    
    NSNumber *unsignedLongNumber = [NSNumber numberWithUnsignedLong:12323123];
    unsigned long unsignedLongValue = [unsignedLongNumber unsignedLongValue];
    
    NSNumber *unsignedLongLongNumber = [NSNumber numberWithUnsignedLongLong:123123213];
    unsigned long long unsignedLongLong = [unsignedLongLongNumber unsignedLongLongValue];
    
    NSNumber *unsignedShortNumber = [NSNumber numberWithUnsignedShort:12];
    unsigned short unsignedShortValue = [unsignedShortNumber unsignedShortValue];
    
    
    
}

// 操作 结构体
+ (void)scalarAndNumber{
    // 保存指针对象
    NSObject *pointObject = [NSObject new];
    NSValue *pintValue = [NSValue valueWithPointer:(__bridge const void * _Nullable)(pointObject)];

    NSRange range = NSMakeRange(0, 10);
    NSValue *rangeValue = [NSValue valueWithRange:range];
    CGRect rect = CGRectMake(0, 0, 100, 100);
    NSValue *rectValue = [NSValue valueWithCGRect:rect];
    CGSize size = CGSizeMake(100, 100);
    NSValue *sizeValue = [NSValue valueWithCGSize:size];
    
}
@end
