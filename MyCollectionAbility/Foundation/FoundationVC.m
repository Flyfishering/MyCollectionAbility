//
//  FoundationVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "FoundationVC.h"

@interface FoundationVC ()
{
    NSArray<TableviewCellItem *> *_data;
}

@end

@implementation FoundationVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSArray<TableviewCellItem *> *)data
{
    if (!_data) {
        NSMutableArray *arr = [@[] mutableCopy];
        TableviewCellItem *item = [TableviewCellItem new];
        item.name = @"集合-Collection";
        item.viewController = @"CollectionVC";
        [arr addObject:item];
        _data = [arr copy];
    }
    return _data;
}

@end
