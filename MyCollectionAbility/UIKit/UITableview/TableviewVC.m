//
//  TableviewVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TableviewVC.h"

@interface TableviewVC ()
{
    NSArray<TableviewCellItem *> *_data;
}

@end

@implementation TableviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
