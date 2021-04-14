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
        item.name = @"tableview-倒计时";
        item.viewController = @"TableviewTimerCellDemo";
        [arr addObject:item];
        _data = [arr copy];
    }
    return _data;
}


@end
