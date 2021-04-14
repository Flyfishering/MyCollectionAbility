//
//  OtherObj.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/3/2.
//  Copyright © 2021 mac. All rights reserved.
//

#import "OtherObj.h"
#import "OtherDelegateObj.h"

@interface OtherObj()<OtherDelegateObjDelegate>
@property(nonatomic, strong) OtherDelegateObj *obj;
@end


@implementation OtherObj

- (void)dealloc
{
    NSLog(@"OtherObj %s", __func__);
}

- (void)otherTest
{
    [self.obj test];
}

//MARK: - OtherDelegateObjDelegate

- (void)OtherDelegateObjTest
{
    NSLog(@"代理回调 self = %@",self);
}

- (OtherDelegateObj *)obj
{
    if (!_obj) {
        _obj = [OtherDelegateObj new];
        _obj.delegate = self;
    }
    return _obj;
}
@end
