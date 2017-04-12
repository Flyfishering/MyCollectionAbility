//
//  ConformsToProtocolFather.h
//  MyCollectionAbility
//
//  Created by mac on 17/2/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConformsToProtocolFatherDlegate <NSObject>
@required
- (void)doSomething;
- (void)doOtherthing;

@end

@interface ConformsToProtocolFather : NSObject
@property (nonatomic, assign) id <ConformsToProtocolFatherDlegate> fatherDelegate;

- (void)callDelegateMehod;
@end
