//
//  KVCTransaction.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCTransaction : NSObject
@property (nonatomic) NSString* payee;   // To whom
@property (nonatomic) NSNumber* amount;  // How much
@property (nonatomic) NSDate* date;      // When

- (instancetype)initWithPayee:(NSString *) payee amount:(NSNumber *)amount date:(NSDate *)date;

@end
