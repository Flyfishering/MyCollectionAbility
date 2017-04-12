//
//  DelegateInheritanceVC.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DelegateInheritanceVC.h"
#import "DelegateInheritanceSon.h"
@interface DelegateInheritanceVC ()

@end

@implementation DelegateInheritanceVC

- (void)viewDidLoad {
    [super viewDidLoad];

    DelegateInheritanceSon *delegateSon = [[DelegateInheritanceSon alloc] init];
    [delegateSon.delegate sayILoveYou];
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
