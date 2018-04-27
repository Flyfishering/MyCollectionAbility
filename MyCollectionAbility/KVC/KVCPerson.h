//
//  KVCPerson.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCAddress.h"
@interface KVCPerson : NSObject

@property (nonatomic, strong) KVCAddress *address;
@property (nonatomic, copy) NSString *name;
@end
