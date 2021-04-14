//
//  HomeTableViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/23.
//  Copyright © 2016年 mac. All rights reserved.
//



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
#import "TableViewComponent.h"


@interface HomeTableViewController ()
{
    NSArray<TableviewCellItem *> *_data;
}

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *viewControllers;
@end



@implementation HomeTableViewController

#pragma mark - life cycle

//MARK: - get

- (NSArray<TableviewCellItem *> *)data
{
    if (!_data) {
        NSMutableArray *arr = [@[] mutableCopy];
        for (NSInteger i = 0; i < self.viewControllers.count; i++) {
            TableviewCellItem *item = [TableviewCellItem new];
            item.name = self.titleArr[i];;
            item.viewController = self.viewControllers[i];
            [arr addObject:item];
        }
        _data = [arr copy];
    }
    return _data;
}

- (NSArray *)viewControllers{
    return @[
        @"UIKitVC",
        @"FoundationVC",
        @"AboutNSUserDefualtViewController",
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
             @"LayoutSubviewDemoVC",
             @"OtherViewController",
            ];
}
//#import "NotificationViewController.h"
- (NSArray *)titleArr{
    return @[
        @"UIKit",
        @"Foundation",
        @"01--NSUserDefaults 保存对象",
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
             @"18-- view 的 layoutSubviews 方法",
             @"19-- 其他",
             ];
}

@end
