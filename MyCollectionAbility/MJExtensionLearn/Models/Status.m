//
//  Status.m
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Status.h"

@implementation Status

- (NSString *)description{
    [super description];

    NSString *descriptionStr = [NSString stringWithFormat:@"\n\t    text    =   %@\n**********x下面是User**************\n\t  这是User：      %@\n\t**********x下面是Status**************\n\t  这是Status：\n\t     %@\n\t",_text,[_user description],[_retweetedStatus description]];

    return descriptionStr;
}
@end
