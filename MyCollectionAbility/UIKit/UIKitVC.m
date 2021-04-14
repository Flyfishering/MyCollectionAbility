//
//  UIKitVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "UIKitVC.h"

@interface UIKitVC ()
{
    NSArray<TableviewCellItem *> *_data;
}
@end

@implementation UIKitVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray<TableviewCellItem *> *)data
{
    if (!_data) {
        NSMutableArray *arr = [@[] mutableCopy];
        TableviewCellItem *item = [TableviewCellItem new];
        item.name = @"列表试图-Tableview";
        item.viewController = @"TableviewVC";
        [arr addObject:item];
        _data = [arr copy];
    }
    return _data;
}


@end
