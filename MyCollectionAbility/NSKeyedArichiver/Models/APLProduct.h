//
//  APLProduct.h
//  MyCollectionAbility
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *ProductTypeDevice;
extern NSString *ProductTypeDesktop;
extern NSString *ProductTypePortable;

@interface APLProduct : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSNumber *yearIntroduced;
@property (nonatomic) NSNumber *introPrice;

+ (instancetype)productWithType:(NSString *)type name:(NSString *)name year:(NSNumber *)year price:(NSNumber *)price;

+ (NSArray *)deviceTypeNames;
+ (NSString *)displayNameForType:(NSString *)type;
@end
