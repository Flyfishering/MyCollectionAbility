//
//  Student.h
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bag : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) double price;

@end


@interface Student : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (strong, nonatomic) Bag *bag;

@end
