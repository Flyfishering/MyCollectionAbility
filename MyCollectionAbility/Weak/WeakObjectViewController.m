//
//  WeakObjectViewController.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WeakObjectViewController.h"
#import "WeakObject.h"
@interface WeakObjectViewController ()
@property (nonatomic, weak) WeakObject *weakObj;
@end

@implementation WeakObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 对象在弱引用之后 会立马释放
    self.weakObj = [WeakObject new];
    self.weakObj.name = @"weakOnject";
    self.weakObj.age = 12;
    // 打印 （null）
    NSLog(@"%@",self.weakObj);
    [self logWeakObject];
    
}

- (void)logWeakObject{
    // 打印 （null）
    NSLog(@"%@",self.weakObj);
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
