//
//  SecureCodingArichiver.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SecureCodingArichiver.h"
/*
 @property (nonatomic, strong) NSString *title;
 @property (nonatomic, assign) int cout;
 @property (nonatomic, assign) BOOL isMore;
 @property (nonatomic, assign) CGFloat *longth;
 */
@implementation SecureCodingArichiver

//这个方法一般返回都是YES 为了类型安全
+ (BOOL)supportsSecureCoding{
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"title"];
        self.cout = [aDecoder decodeIntForKey:@"cout"];
        self.isMore = [aDecoder decodeBoolForKey:@"isMore"];
        self.longth = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:@"longth"] floatValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeInteger:self.cout forKey:@"cout"];
    [aCoder encodeBool:self.isMore forKey:@"isMore"];
    [aCoder encodeObject:[NSNumber numberWithFloat:self.longth] forKey:@"longth"];
}

@end
