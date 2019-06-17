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
#import "NSKeyedArichiverViewController.h"
#import "AboutNSUserDefualtViewController.h"
#import "FileManagerViewController.h"
#import "EnumerateObjectsViewController.h"
#import "ConformsToProtocolViewController.h"
#import "SingleInstanceViewController.h"
#import "WeakObjectViewController.h"
#import "KVCViewController.h"
#import "RunTimeViewController.h"
#import "XibDemoTableViewController.h"
#import "UndoViewController.h"
//#import "LayoutSubviewDemoVC.h"
#import "MyCollectionAbility-Swift.h"
@interface HomeTableViewController ()

@property (nonatomic, strong) HomeTabelViewDelegateObj *tableViewDelegateObj;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *viewControllers;

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
    UIViewController *viewController = [NSClassFromString(self.viewControllers[indexPath.row]) new] ;
    if (indexPath.row == 17) {
        viewController = [[LayoutSubviewDemoVC alloc] init];
        
    }
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma amrk - lazy method

- (NSArray *)viewControllers{
    return @[@"AboutNSUserDefualtViewController",
             @"NSKeyedArichiverViewController",
             @"FileManagerViewController",
             @"EnumerateObjectsViewController",
             @"DelegateInheritanceVC",
             @"KVOViewController",
             @"KVCViewController",
             @"NotificationViewController",
             @"NSCharacterSetViewController",
             @"ConformsToProtocolViewController",
             @"SingelAndBlockViewController",
             @"MJExtensionLearnViewController",
             @"SingleInstanceViewController",
             @"WeakObjectViewController",
             @"RunTimeViewController",
             @"XibDemoTableViewController",
             @"UndoViewController",
             @"LayoutSubviewDemoVC"];
}
//#import "NotificationViewController.h"
- (NSArray *)titleArr{
    return @[@"01--NSUserDefaults 保存对象",
             @"02--归档",
             @"03--文件管理",
             @"04--遍历数组字典的几种方法",
             @"05--代理的继承",
             @"06--KVO",
             @"07--KVC",
             @"08--通知中心",
             @"09--NSChracterSet",
             @"10--ConformsToProtocolViewController",
             @"11--单类中使用block",
             @"12--MJExtension 学习",
             @"13--单例模式",
             @"14--weak 弱引用",
             @"15--runtime",
             @"16--xib 相关",
             @"17-- Undo 撤销 和 重做",
             @"18-- view 的 layoutSubviews 方法"];
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
