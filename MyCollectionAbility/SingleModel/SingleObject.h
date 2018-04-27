//
//  SingleObject.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleInstance.h"
@interface SingleObject : NSObject<NSCopying,NSMutableCopying>
HJSingletonH(SingleObject)
@end
