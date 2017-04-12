//
//  StatusResult.h
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ad : NSObject

@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *url;

@end


@interface StatusResult : NSObject

/** 数组中存储模型Status类型数据 */
@property (strong, nonatomic) NSMutableArray *statuses;
/** 数组中存储模型Ad类型数据 */
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) NSNumber *totalNumber;

@end
