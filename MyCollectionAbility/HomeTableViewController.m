//
//  HomeTableViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/23.
//  Copyright © 2016年 mac. All rights reserved.
//



//设计思路，此项目采用UIStoryboard 来初始化，首页是一个UITableViewController xib文件
//        自定义一个HomeTableView.h(UITableView),和UITableViewController xib 中的tableView相互关联，
//        自定义一个HomeTableViewController.h(UITableViewController)和UITableViewController xib 关联
//
//同时，这里对控制器进行瘦身，把tableview 的代理方法delegate method 提取出来，放到了HomeTabelViewDelegateObj.h 中，
//    在HomeTabelViewDelegateObj.h 中执行UITableView的代理方法，并将点击方法回调到控制器中




#import "HomeTableViewController.h"
#import "HomeTableView.h"
#import "HomeTabelViewDelegateObj.h"

@interface HomeTableViewController ()

@property (nonatomic, strong) HomeTabelViewDelegateObj *tableViewDelegateObj;
@property (nonatomic, strong) NSArray *titleArr;

@end



@implementation HomeTableViewController

/*  
     这里需要注意下，self.tableview 系统默认为 HomeTableView
 
 */

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self.tableViewDelegateObj;
    self.tableView.dataSource = self.tableViewDelegateObj;
    
}


#pragma mark target method 
- (void)taleviewObjSelectAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%s",__func__);
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
            
        default:
            break;
    }
}


#pragma amrk - lazy method

- (NSArray *)titleArr{
    return @[@"01--NSUserDefaults 保存对象"];
}
- (HomeTabelViewDelegateObj *)tableViewDelegateObj{
    if (!_tableViewDelegateObj) {
        __weak typeof(self) weakSelf = self;
        _tableViewDelegateObj = [HomeTabelViewDelegateObj createTableViewDelegateWithDataList:self.titleArr selectBlock:^(NSIndexPath *indexPath) {
            
            [weakSelf taleviewObjSelectAtIndexPath:indexPath];
        }];
    }
    return _tableViewDelegateObj;
}

- (void)viewDidLayoutSubviews{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
