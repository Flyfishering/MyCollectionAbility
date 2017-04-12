//
//  SonArichiver.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SonArichiver.h"

@implementation SonArichiver
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self  = [super initWithCoder:aDecoder];
    if (self) {
        _address = [aDecoder decodeObjectForKey:@"address"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_address forKey:@"address"];
    //在调用了[super encodeWithCoder:aCoder]; 之后，self.name会被父类归档，不需要下面的代码可以实现同样的效果
    //[aCoder encodeObject:self.name forKey:@"name"];
}



@end
