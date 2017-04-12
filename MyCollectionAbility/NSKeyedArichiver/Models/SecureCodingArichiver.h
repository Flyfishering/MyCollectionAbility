//
//  SecureCodingArichiver.h
//  MyCollectionAbility
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SecureCodingArichiver : NSObject<NSSecureCoding>
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int cout;
@property (nonatomic, assign) BOOL isMore;
@property (nonatomic, assign) float longth;

@end
