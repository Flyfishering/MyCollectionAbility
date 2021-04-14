//
//  CollectionVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/13.
//  Copyright © 2021 mac. All rights reserved.
//

#import "CollectionVC.h"
#import "TableViewComponent.h"


@interface CollectionVC ()
{
    NSArray<TableviewCellItem *> *_data;
}

@end

@implementation CollectionVC


- (NSArray<TableviewCellItem *> *)data
{
    if (!_data) {
        NSMutableArray *arr = [@[] mutableCopy];
        TableviewCellItem *item = [TableviewCellItem new];
        item.name = @"Dictionary-字典";
        item.viewController = @"DictionaryViewController";
        [arr addObject:item];
        _data = [arr copy];
    }
    return _data;
}
@end
