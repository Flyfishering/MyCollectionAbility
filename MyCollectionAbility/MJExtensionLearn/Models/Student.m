//
//  Student.m
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Student.h"
#import "MJExtension.h"
@implementation Student
/* 设置模型属性名和字典key之间的映射关系 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"ID" : @"id",
             @"desc" : @"desciption",
             @"oldName" : @"name.oldName",
             @"nowName" : @"name.newName",
             @"nameChangedTime" : @"name.info[1].nameChangedTime",
             @"bag" : @"other.bag"
             };
}

@end


@implementation Bag

//添加了下面的宏定义
MJExtensionCodingImplementation

/* 实现下面的方法，说明哪些属性不需要归档和解档 */
+ (NSArray *)mj_ignoredCodingPropertyNames{
    return @[@"name"];
}
@end
