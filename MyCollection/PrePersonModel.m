//
//  PrePersonModel.m
//  MyCollection
//
//  Created by Apple on 2022/5/19.
//  Copyright © 2022 mac. All rights reserved.
//

#import "PrePersonModel.h"

@implementation PrePersonModel

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age sex:(ZLPersonSex)sex
{
 if (self = [super init]) {
  _name = name;
  _age = age;
  _sex = sex;
 }
 return self;
}

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age sex:(ZLPersonSex)sex
{
 return [[self alloc] initWithName:name age:age sex:sex];
}

- (NSString *)description
{
 return [NSString stringWithFormat:@"[name = %@, age = %ld, sex = %ld]", self.name, self.age, self.sex];
}

@end
