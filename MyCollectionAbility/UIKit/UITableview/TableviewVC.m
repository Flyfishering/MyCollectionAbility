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

@property(nonatomic, strong) NSArray *dicArr;
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
        
        for (NSInteger i = 0; i < self.dicArr.count; i++) {
            TableviewCellItem *item = [TableviewCellItem new];
            item.name = self.dicArr[i][@"name"];
            item.viewController = self.dicArr[i][@"vc"];
            [arr addObject:item];
        }
        
        _data = [arr copy];
    }
    return _data;
}


- (NSArray *)dicArr
{
    if (!_dicArr) {
        _dicArr = @[
            @{@"name":@"tableview-倒计时",
              @"vc":@"TableviewTimerCellDemo"
            },
            @{@"name":@"tableview-网络请求",
              @"vc":@"TBNetVC"
            },
        ];
    }
    return _dicArr;
}

@end
