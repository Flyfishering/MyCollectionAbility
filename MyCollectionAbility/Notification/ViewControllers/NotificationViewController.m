//
//  NotificationViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NotificationViewController.h"

static NSString *const myNotificationName = @"myNotification";
@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     observer :观察者
     selector :执行的方法
     name     :通知名字
     object   :接收通知的类型 (要和myNotificationName中的object保持一致)
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCenter:) name:myNotificationName object:myNotificationName];
}
- (void)dealloc{
    /*
     Observer:  :观察者
     name       :通知名字
     object     :通知类型
     */
    [[NSNotificationCenter defaultCenter] removeObserver:self name:myNotificationName object:myNotificationName];
}

- (IBAction)postNotificationMethod:(id)sender {
    [self initNorification];
}

- (void)initNorification{
    
   NSNotification *llNotification =  [[NSNotification alloc] initWithName:myNotificationName object:myNotificationName userInfo:@{@"title":@"the value to pass"}];
    [[NSNotificationCenter defaultCenter] postNotification:llNotification];
    
    /*
     Name       :通知名字
     object     :通知类型 (要和 addObserver 中object保                              
                 持一致)
     userInfo   :传递的参数
     */
//    [[NSNotificationCenter defaultCenter] postNotificationName:myNotificationName object:myNotificationName userInfo:@{@"title":@"post的userInfo"}];
}

- (void)notificationCenter:(NSNotification *)notification{
    
    //这里的notification.object 用来区分不同的通知类型(不同的通知可以调用一个方法)
    //notification.userInfo是通知传参
    if (notification.object == myNotificationName) {
        NSLog(@"该通知类型是 %@",myNotificationName);
    }
    NSLog(@"%@",[notification class]);
    NSLog(@"%@",notification);
    
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"%@",userInfo);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
