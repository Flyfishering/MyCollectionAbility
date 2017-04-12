//
//  DelegateInheritanceFather.h
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//声明协议
@protocol DelegateInheritanceFatherDlegate <NSObject>

- (void)sayILoveYou;

@end
@interface DelegateInheritanceFather : NSObject<DelegateInheritanceFatherDlegate>
//代理
@property (nonatomic, weak) id<DelegateInheritanceFatherDlegate>delegate;

@end
