//
//  XibDemoTableViewController.m
//  MyCollectionAbility
//
//  Created by seasaw on 2018/5/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "XibDemoTableViewController.h"
#import "XIB_ObjectViewController.h"
@interface XibDemoTableViewController ()
@property (nonatomic,strong) NSArray *titleArr;
@end

@implementation XibDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[XIB_ObjectViewController alloc] init] animated:YES];
            break;
            
        default:
            break;
    }
}
#pragma mark - lazy methods
- (NSArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = @[@"Xib-Object 控件"];
    }
    return
    _titleArr;
}
@end
