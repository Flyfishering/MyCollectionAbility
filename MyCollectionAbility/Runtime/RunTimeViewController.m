//
//  RunTimeViewController.m
//  MyCollectionAbility
//
//  Created by seasaw on 2018/5/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RunTimeViewController.h"
#import "NSInvocationDemo.h"
@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[NSInvocationDemo alloc] init] nsInvocationTest];
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
