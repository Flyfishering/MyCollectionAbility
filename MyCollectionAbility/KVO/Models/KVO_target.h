//
//  KVO_target.h
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVO_target : NSObject
{
    int age;
}

@property (nonatomic, readwrite) int grade;

// for manual KVO - age
//- (int) age;
//- (void) setAge:(int)theAge;

// for automatic KVO - age
@property (nonatomic, readwrite) int age;

@end
