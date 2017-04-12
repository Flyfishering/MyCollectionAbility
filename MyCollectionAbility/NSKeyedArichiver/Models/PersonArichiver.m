
//
//  PersonArichiver.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PersonArichiver.h"

@implementation PersonArichiver

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:@"name"];
       //name = [aDecoder decodeObjectforKey:@"name"];
    }
    return self;
}

@end
