//
//  KVCBankAccount.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCPerson.h"
#import "KVCTransaction.h"
#import "KVCAddress.h"
@interface KVCBankAccount : NSObject
@property (nonatomic) NSNumber* currentBalance;              // An attribute
@property (nonatomic) KVCPerson* owner;                         // A to-one relation
@property (nonatomic) NSArray< KVCTransaction* >* transactions; // A to-many relation
//@property (nonatomic, strong) id arrayProxyObject;

@end
