//
//  KVCTransaction.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCTransaction.h"

@implementation KVCTransaction
//@property (nonatomic) NSString* payee;   // To whom
//@property (nonatomic) NSNumber* amount;  // How much
//@property (nonatomic) NSDate* date; 

- (instancetype)initWithPayee:(NSString *) payee amount:(NSNumber *)amount date:(NSDate *)date{
    if (self = [self init]) {
        self.payee = payee;
        self.amount = amount;
        self.date = date;
        
        
    }
    return self;
}



@end
