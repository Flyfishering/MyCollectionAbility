//
//  NomalTableviewVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "NomalTableviewVC.h"
#import "TableViewComponent.h"

@interface NomalTableviewVC ()<TableViewComponentProtocl>

///子类实现 get 方法
@property(nonatomic, strong) NSArray<TableviewCellItem *> *data;

/// tabview 组件
@property(nonatomic, strong) TableViewNormalComponent *tableviewComponent;

@end

@implementation NomalTableviewVC

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
    @throw [NSException exceptionWithName:@"NomalTableviewVC" reason:@"子类实现 data 的 get 方法" userInfo:nil];

    return nil;
}


@end
