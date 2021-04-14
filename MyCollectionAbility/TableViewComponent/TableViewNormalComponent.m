//
//  TableViewNormalComponent.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TableViewNormalComponent.h"
#import "HomeTableView.h"
#import "TableviewCellItem.h"

#import <UIKit/UIKit.h>
@interface TableViewNormalComponent()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UIViewController *vc;
@property(nonatomic, strong) HomeTableView *tableview;
@property(nonatomic, strong) NSArray <TableviewCellItem *> *data;
@end

@implementation TableViewNormalComponent

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

//MARK: - public

/// 配置 tableivew 在 viewDidLoad 中调用
- (void)configTableView
{
    [self.vc.view addSubview:self.tableview];
    self.tableview.frame = self.vc.view.bounds;
}

//MARK: -  TableViewComponentProtocl
- (NSArray <TableviewCellItem *>*)dataSource
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dataSource)]) {
        return [self.delegate dataSource];
    }else{
        @throw [NSException exceptionWithName:@"TableViewComponent" reason:@"使用 TableViewNormalComponent 必须遵守 TableViewComponentProtocl 协议" userInfo:nil];
    }
    return @[];
}

- (UIViewController *)viewController
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewController)]) {
        return [self.delegate viewController];
    }else{
        @throw [NSException exceptionWithName:@"TableViewComponent" reason:@"使用 TableViewNormalComponent 必须遵守 TableViewComponentProtocl 协议" userInfo:nil];
    }

    return nil;
}

//MARK: - UITableViewDelegate  UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    TableviewCellItem *item = self.data[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TableviewCellItem *item = self.data[indexPath.row];

    UIViewController *viewController = [NSClassFromString(item.viewController) new] ;
    viewController.title = item.name;
    [self.vc.navigationController pushViewController:viewController animated:YES];
}

//MARK: - get

- (HomeTableView *)tableview
{
    if (!_tableview) {
        _tableview = [[HomeTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (UIViewController *)vc
{
    if (!_vc) {
        _vc = [self viewController];
    }
    return _vc;
}

- (NSArray<TableviewCellItem *> *)data
{
    if (!_data) {
        _data = [self dataSource];
    }
    return _data;
}
@end
