//
//  TableViewComponentProtocl.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TableviewCellItem;
@class UIViewController;

@protocol TableViewComponentProtocl <NSObject>

- (NSArray <TableviewCellItem *>*)dataSource;

- (UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
