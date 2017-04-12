//
//  StatusResult.m
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "StatusResult.h"
#import "MJExtension.h"
#import "Status.h"

/* 数组中存储模型数据，需要说明数组中存储的模型数据类型 */
@implementation StatusResult
/* 实现该方法，说明数组中存储的模型数据类型 */
+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"statuses" : @"Status",
              @"ads" : @"Ad"
              };
}

- (NSString *)description{
    [super description];
    NSMutableString *mutableString = [NSMutableString stringWithFormat:@"******下面是Statu数组*******"];
    for (Status *status in _statuses) {
        NSString *str = [status description];
        [mutableString appendString:str];
    }
    [mutableString appendString:@"******下面是Ad数组*******"];
    for (Ad *ad in _ads) {
        NSString *str = [ad description];
        [mutableString appendString:str];
    }

    return [NSString stringWithFormat:@"\n\t%@",mutableString];
}
@end

@implementation Ad
- (NSString *)description{
    [super description];
    return [NSString stringWithFormat:@"\n\t\t 这是Ad:\n\t    image   =   %@\n\t  url     =   %@",_image,_url];
}
@end
