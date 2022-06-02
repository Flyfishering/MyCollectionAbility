
//
//  NSPredicateDemo.m
//  MyCollection
//
//  Created by Apple on 2022/5/19.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSPredicateDemo.h"
#import "PrePersonModel.h"

@implementation NSPredicateDemo

/// 参考文章 https://www.mianshigee.com/note/detail/60233dwo/

- (void)test
{
    [self test_equal];
    [self test_BETWEEN];
    [self test_logicalOperator];
    [self test_collection_in];
    [self test_collection_1];
    [self test_collection_2];
    [self test_collection_3];
    [self test_obj];
    [self test_checkPhoneNumber];
    [self test_checkSpecialCharacter];
    [self test_msgCode];
    [self test_email];
}

- (void)test_equal
{
    NSNumber *testNumber = @123;
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF = 123"];
     if ([predicate evaluateWithObject:testNumber]) {
     NSLog(@"testString:%@", testNumber);
     }
}


- (void)test_BETWEEN
{
    NSNumber *testNumber = @123;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BETWEEN {100, 200}"];
     if ([predicate evaluateWithObject:testNumber]) {
     NSLog(@"testString:%@", testNumber);
     } else {
     NSLog(@"不符合条件");
     }
}

- (void)test_logicalOperator
{
    NSArray *testArray = @[@1, @2, @3, @4, @5, @6];
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 2 && SELF < 5"];
     NSArray *filterArray = [testArray filteredArrayUsingPredicate:predicate];
     NSLog(@"filterArray:%@", filterArray);
}

- (void)test_collection_in
{
    NSArray *filterArray = @[@"ab", @"abc"];
     NSArray *array = @[@"a", @"ab", @"abc", @"abcd"];
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", filterArray];
     NSLog(@"%@", [array filteredArrayUsingPredicate:predicate]);
}


- (void)test_collection_1
{
    NSMutableArray *arrayM = [@[@20, @40, @50, @30, @60, @70] mutableCopy];
     // 过滤大于50的值
     NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF > 50"];
     [arrayM filterUsingPredicate:pred1];
     NSLog(@"arrayM:%@", arrayM);
     
     NSArray *array = @[[PrePersonModel personWithName:@"Jack" age:20 sex:ZLPersonSexMale],
          [PrePersonModel personWithName:@"Rose" age:22 sex:ZLPersonSexFamale],
          [PrePersonModel personWithName:@"Jackson" age:30 sex:ZLPersonSexMale],
          [PrePersonModel personWithName:@"Johnson" age:35 sex:ZLPersonSexMale]];
     // 要求取出包含‘son'的元素
     NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"name CONTAINS 'son'"];
     NSArray *newArray = [array filteredArrayUsingPredicate:pred2];
     NSLog(@"%@", newArray);

}

- (void)test_obj
{
    PrePersonModel *sunnyzl = [PrePersonModel personWithName:@"sunnyzl" age:29 sex:ZLPersonSexMale];
    PrePersonModel *jack = [PrePersonModel personWithName:@"jack" age:22 sex:ZLPersonSexMale];
     // 首先我们来看一些简单的使用
     // 1.判断姓名是否是以s开头的
     NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"name LIKE 's*'"];
     // 输出为：sunnyzl:1, jack:0
     NSLog(@"sunnyzl:%d, jack:%d", [pred1 evaluateWithObject:sunnyzl], [pred1 evaluateWithObject:jack]);
     
     // 2.判断年龄是否大于25
     NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"age > 25"];
     // 输出为：sunnyzl的年龄是否大于25：1, jack的年龄是否大于25：0
     NSLog(@"sunnyzl的年龄是否大于25：%d, jack的年龄是否大于25：%d", [pred2 evaluateWithObject:sunnyzl], [pred2 evaluateWithObject:jack]);
}


- (void)test_checkPhoneNumber
{
    NSString *number1 = @"17328752066";
    BOOL result1 =  [self checkPhoneNumber:number1];
    NSLog(@"%@ 是否是合法手机号: %d",number1,result1);
    
    NSString *number2 = @"1732875206688";
    BOOL result2 =  [self checkPhoneNumber:number2];
    NSLog(@"%@ 是否是合法手机号: %d",number2,result2);

    NSString *number3 = @"87328752066";
    BOOL result3 =  [self checkPhoneNumber:number3];
    NSLog(@"%@ 是否是合法手机号: %d",number3,result3);

    NSString *number4 = @"A7328752066";
    BOOL result4 = [self checkPhoneNumber:number4];
    NSLog(@"%@ 是否是合法手机号: %d",number4,result4);

}


- (void)test_checkSpecialCharacter
{
    NSString *string1 = @"12312323";
    BOOL result1 = [self checkSpecialCharacter:string1];
    NSLog(@"%@ 是否包含特殊字符: %d",string1,result1);
    
    NSString *string2 = @"$12323";
    BOOL result2 = [self checkSpecialCharacter:string2];
    NSLog(@"%@ 是否包含特殊字符: %d",string2,result2);
    
    NSString *string3 = @"'''12312323";
    BOOL result3 = [self checkSpecialCharacter:string3];
    NSLog(@"%@ 是否包含特殊字符: %d",string3,result3);
}


- (void)test_collection_2
{
    NSArray *filterArray = @[@"ab", @"abc"];
     NSArray *array = @[@"a", @"ab", @"abc", @"abcd"];
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", filterArray];
     NSLog(@"%@", [array filteredArrayUsingPredicate:predicate]);
}


- (void)test_collection_3
{
    NSArray *array = @[[PrePersonModel personWithName:@"Jack" age:20 sex:ZLPersonSexMale],
          [PrePersonModel personWithName:@"Rose" age:22 sex:ZLPersonSexFamale],
          [PrePersonModel personWithName:@"Jackson" age:30 sex:ZLPersonSexMale],
          [PrePersonModel personWithName:@"Johnson" age:35 sex:ZLPersonSexMale]];
     // 定义一个property来存放属性名，定义一个value来存放值
     NSString *property = @"name";
     NSString *value = @"Jack";
     // 该谓词的作用是如果元素中property属性含有值value时就取出放入新的数组内，这里是name包含Jack
     NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K CONTAINS %@", property, value];
     NSArray *newArray = [array filteredArrayUsingPredicate:pred];
     NSLog(@"newArray:%@", newArray);
     
     // 创建谓词，属性名改为age，要求这个age包含$VALUE字符串
     NSPredicate *predTemp = [NSPredicate predicateWithFormat:@"%K > $VALUE", @"age"];
     // 指定$VALUE的值为 25
     NSPredicate *pred1 = [predTemp predicateWithSubstitutionVariables:@{@"VALUE" : @25}];
     NSArray *newArray1 = [array filteredArrayUsingPredicate:pred1];
     NSLog(@"newArray1:%@", newArray1);
     
     // 修改 $VALUE的值为32
     NSPredicate *pred2 = [predTemp predicateWithSubstitutionVariables:@{@"VALUE" : @32}];
     NSArray *newArray2 = [array filteredArrayUsingPredicate:pred2];
     NSLog(@"newArray2:%@", newArray2);
}

- (void)test_msgCode
{
    NSString *string_1 = @"adfcdf";
    BOOL result1 =  [self checkMSGCode:string_1 length:6];
    NSLog(@"%@ 是否是合法验证码: %d",string_1,result1);
    
    
    NSString *string_2 = @"123456";
    BOOL result2 =  [self checkMSGCode:string_2 length:6];
    NSLog(@"%@ 是否是合法验证码: %d",string_2,result2);
}

- (void)test_email
{
    //1.利用NSPredicate（谓语类）匹配
        NSString *email = @"niaho_123@123.com";

        NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

        //创建监测对象（谓语对象）
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        //监测邮箱是否合法 如果合法返回真 否则为假
        BOOL ret = [predicate evaluateWithObject:email];
        if (ret) {
            NSLog(@"是邮箱 合法");
        }else {
            NSLog(@"不是邮箱 不合法");
        }
}

- (BOOL)checkSpecialCharacter:(NSString *)string
{
     NSString *regex = @"[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]+";
    regex = @"~!@#$%^&*";
    
     NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
     return [pred evaluateWithObject:string];
}




- (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
     NSString *regex = @"^[1][3-8]\\d{9}$";
     NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
     return [pred evaluateWithObject:phoneNumber];
}


- (BOOL)checkMSGCode:(NSString *)code length:(NSInteger )length
{
    if(code.length > length) return NO;
    NSString *regex = [NSString stringWithFormat:@"^\\d{%ld}$",(long)length];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    BOOL isNumebr = [pred evaluateWithObject:code];
    return isNumebr;
}


@end

