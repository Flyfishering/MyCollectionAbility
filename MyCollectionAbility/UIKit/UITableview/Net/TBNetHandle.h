//
//  TBNetHandle.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TBNetHandleProtocol <NSObject>

- (void)requestSuccess;

@end


@interface TBNetHandle : NSObject
@property(nonatomic, weak) id <TBNetHandleProtocol> delegate;

- (void)requst;

@end

NS_ASSUME_NONNULL_END
