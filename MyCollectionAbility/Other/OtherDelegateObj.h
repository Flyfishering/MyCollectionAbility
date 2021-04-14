//
//  OtherDelegateObj.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/3/2.
//  Copyright © 2021 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OtherDelegateObjDelegate <NSObject>

- (void)OtherDelegateObjTest;

@end

@interface OtherDelegateObj : NSObject

@property(nonatomic, weak) id<OtherDelegateObjDelegate> delegate;

- (void)test;

@end

NS_ASSUME_NONNULL_END
