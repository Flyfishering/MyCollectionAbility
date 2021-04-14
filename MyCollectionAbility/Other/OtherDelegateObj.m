//
//  OtherDelegateObj.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/3/2.
//  Copyright © 2021 mac. All rights reserved.
//

#import "OtherDelegateObj.h"

@implementation OtherDelegateObj

- (void)dealloc
{
    NSLog(@"OtherDelegateObj %s", __func__);
}

- (void)test
{
    NSLog(@"OtherDelegateObj %s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(OtherDelegateObjTest)]) {
        [self.delegate OtherDelegateObjTest];

//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.delegate OtherDelegateObjTest];
//        });
    }
}

@end
