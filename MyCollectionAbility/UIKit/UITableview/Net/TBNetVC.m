//
//  TBNetVC.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TBNetVC.h"
#import "TBNetCell.h"

@interface TBNetVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableview;
@property(nonatomic, strong) NSArray *dataArr;
@end

@implementation TBNetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    self.tableview.frame = self.view.bounds;
}

//MAKR: - UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBNetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TBNetCell"];
    TBNetCellModel *model = [TBNetCellModel new];
    model.indexPath = indexPath;
    model.name = [NSString stringWithFormat:@"cell --- %ld", indexPath.row];
    [cell configWithData:model];
    return cell;
}

//MARK: - get

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerClass:[TBNetCell class] forCellReuseIdentifier:@"TBNetCell"];
    }
    return _tableview;
}

@end
