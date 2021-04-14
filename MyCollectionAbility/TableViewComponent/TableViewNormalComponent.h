//
//  TableViewNormalComponent.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewComponentProtocl.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewNormalComponent : NSObject

@property(nonatomic, weak) id<TableViewComponentProtocl> delegate;

/// 配置 tableivew 在 viewDidLoad 中调用
- (void)configTableView;

@end

NS_ASSUME_NONNULL_END
