//
//  KVO_TargetWrapper.h
//  MyCollectionAbility
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KVO_target;
@interface KVO_TargetWrapper : NSObject
{
    @private
    KVO_target *_target;
}
@property(nonatomic, assign) NSString * information;
@property(nonatomic, retain) KVO_target * target;

-(id) init:(KVO_target *)aTarget;
@end
