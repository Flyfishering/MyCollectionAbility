//
//  TableviewTimerCellDemo.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TableviewTimerCellDemo.h"
#import "TBTimerCell.h"

@interface TableviewTimerCellDemo ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableview;
@property(nonatomic, strong) NSArray <TBTimerCellModel *>*dataSource;
@property(nonatomic, strong) NSArray *dataArr;
@end

@implementation TableviewTimerCellDemo

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
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBTimerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TBTimerCell"];
    TBTimerCellModel *model = self.dataSource[indexPath.row];
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
        [_tableview registerClass:[TBTimerCell class] forCellReuseIdentifier:@"TBTimerCell"];
    }
    return _tableview;
}

- (NSArray<TBTimerCellModel *> *)dataSource
{
    if (!_dataSource) {
        NSMutableArray *mutable = [NSMutableArray array];
        for (NSInteger i = 0; i < self.dataArr.count; i++) {
            TBTimerCellModel *model = [TBTimerCellModel new];
            model.cellName = self.dataArr[i][@"name"];
            model.cellId = self.dataArr[i][@"id"];
            model.countDown = [(NSString *)self.dataArr[i][@"time"] integerValue];
            [mutable addObject:model];
        }
        _dataSource = [mutable copy];
    }
    return _dataSource;
}

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = @[
            @{@"id":@"cell_0",
              @"name":@"第 0 个cell",
              @"time":@"100"
            },
            @{@"id":@"cell_1",
              @"name":@"第 1 个cell",
              @"time":@"50"
            },
            @{@"id":@"cell_2",
              @"name":@"第 2 个cell",
              @"time":@"200"
            },
            @{@"id":@"cell_3",
              @"name":@"第 3 个cell",
              @"time":@"100"
            },
            @{@"id":@"cell_4",
              @"name":@"第 4 个cell",
              @"time":@"10"
            },
            @{@"id":@"cell_5",
              @"name":@"第 5 个cell",
              @"time":@"50"
            },
            @{@"id":@"cell_6",
              @"name":@"第 6 个cell",
              @"time":@"80"
            },
            @{@"id":@"cell_7",
              @"name":@"第 7 个cell",
              @"time":@"100"
            },
            @{@"id":@"cell_8",
              @"name":@"第 8 个cell",
              @"time":@"200"
            },
            @{@"id":@"cell_9",
              @"name":@"第 9 个cell",
              @"time":@"999"
            },
            @{@"id":@"cell_10",
              @"name":@"第 10 个cell",
              @"time":@"111"
            },
            @{@"id":@"cell_11",
              @"name":@"第 11 个cell",
              @"time":@"44"
            },
            @{@"id":@"cell_12",
              @"name":@"第 12 个cell",
              @"time":@"222"
            },
            @{@"id":@"cell_13",
              @"name":@"第 13 个cell",
              @"time":@"123"
            },
            @{@"id":@"cell_14",
              @"name":@"第 14 个cell",
              @"time":@"15"
            },
            @{@"id":@"cell_15",
              @"name":@"第 15 个cell",
              @"time":@"24"
            },
            @{@"id":@"cell_16",
              @"name":@"第 16 个cell",
              @"time":@"89"
            },
            @{@"id":@"cell_17",
              @"name":@"第 17 个cell",
              @"time":@"34"
            },
            ];
    }
    return _dataArr;
}

@end
