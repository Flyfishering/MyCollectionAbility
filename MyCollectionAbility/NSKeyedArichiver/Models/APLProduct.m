//
//  APLProduct.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "APLProduct.h"
NSString *ProductTypeDevice = @"Device";
NSString *ProductTypeDesktop = @"Desktop";
NSString *ProductTypePortable = @"Portable";

@implementation APLProduct
+ (instancetype)productWithType:(NSString *)type name:(NSString *)name year:(NSNumber *)year price:(NSNumber *)price
{
    APLProduct *newProduct = [[self alloc] init];
    newProduct.type = type;
    newProduct.name = name;
    newProduct.yearIntroduced = year;
    newProduct.introPrice = price;
    
    return newProduct;
}

+ (NSArray *)deviceTypeNames
{
    static NSArray *deviceTypeNames = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        deviceTypeNames = @[ProductTypeDevice, ProductTypePortable, ProductTypeDesktop];
    });
    
    return deviceTypeNames;
}

+ (NSString *)displayNameForType:(NSString *)type
{
    static NSMutableDictionary *deviceTypeDisplayNamesDictionary = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        deviceTypeDisplayNamesDictionary = [[NSMutableDictionary alloc] init];
        for (NSString *deviceType in [self deviceTypeNames])
        {
            NSString *displayName = NSLocalizedString(deviceType, @"dynamic");
            deviceTypeDisplayNamesDictionary[deviceType] = displayName;
        }
    });
    
    return deviceTypeDisplayNamesDictionary[type];
}


#pragma mark - Archiving

static NSString *NameKey = @"NameKey";
static NSString *TypeKey = @"TypeKey";
static NSString *YearKey = @"YearKey";
static NSString *PriceKey = @"PriceKey";

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:NameKey];
        _type = [aDecoder decodeObjectForKey:TypeKey];
        _yearIntroduced = [aDecoder decodeObjectForKey:YearKey];
        _introPrice = [aDecoder decodeObjectForKey:PriceKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.name forKey:NameKey];
    [aCoder encodeObject:self.type forKey:TypeKey];
    [aCoder encodeObject:self.yearIntroduced forKey:YearKey];
    [aCoder encodeObject:self.introPrice forKey:PriceKey];
}
@end
