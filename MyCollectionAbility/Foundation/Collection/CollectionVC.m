//
//  CollectionVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/13.
//  Copyright © 2021 mac. All rights reserved.
//

#import "CollectionVC.h"
#import "HomeTabelViewDelegateObj.h"
#import "TableViewComponent.h"


@interface CollectionVC ()<TableViewComponentProtocl>

@property(nonatomic, strong) NSArray<TableviewCellItem *> *data;
/// tabview 组件
@property(nonatomic, strong) TableViewNormalComponent *tableviewComponent;
@end

@implementation CollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableviewComponent configTableView];
}

//MARK: - TableViewComponentProtocl

- (UIViewController *)viewController
{
    return self;
}

- (NSArray<TableviewCellItem *> *)dataSource
{
    return self.data;
}

//MARK: - get

- (TableViewNormalComponent *)tableviewComponent
{
    if (!_tableviewComponent) {
        _tableviewComponent = [TableViewNormalComponent new];
        _tableviewComponent.delegate = self;
    }
    return _tableviewComponent;
}

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
