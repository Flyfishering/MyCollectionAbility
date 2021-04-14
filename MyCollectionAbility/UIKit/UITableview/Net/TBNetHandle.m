//
//  TBNetHandle.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TBNetHandle.h"

@implementation TBNetHandle

- (void)requst
{
    dispatch_queue_t queueglobal = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queueglobal, ^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.delegate requestSuccess];
        });
        
    });
}
@end
