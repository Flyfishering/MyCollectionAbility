//
//  MoneyString.m
//  MyCollection
//
//  Created by Apple on 2022/5/12.
//  Copyright © 2022 mac. All rights reserved.
//

#import "MoneyObj.h"

@implementation MoneyObj

- (void)test
{
    [self test_moneyString];
}

//enum {
//    NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle, //无格式,四舍五入，原值2.7999999999,直接输出3
//    NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle, //小数型,保留小数输出2.8
//    NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle, //货币型,加上了人民币标志，原值输出￥2.8
//    NSNumberFormatter
//    NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,  //百分比型,本身数值乘以100后用百分号表示,输出280%
//    NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle, //科学计数型,原值表示，输出2.799999999E0
//    NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle  //全拼,原值的中文表示，输出二点七九九九...
//};


// 参考 https://www.jianshu.com/p/6657a7f032ba

- (void)test_moneyString
{
    NSString *money = @"20000";
    
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];

    numFormatter.allowsFloats = NO;
    numFormatter.maximumFractionDigits = 0;
    [numFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSNumberFormatter *numFormatter2 = [[NSNumberFormatter alloc] init];
    [numFormatter2 setNumberStyle:NSNumberFormatterNoStyle];
    
    NSNumber *num = [numFormatter2 numberFromString:money];
    NSString *tempStr = [numFormatter stringFromNumber:num];
    
    NSLog(@"num = %@",num);
    NSLog(@"tempStr = %@",tempStr);
}

@end
