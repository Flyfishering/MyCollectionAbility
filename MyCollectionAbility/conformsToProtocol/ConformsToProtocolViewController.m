//
//  ConformsToProtocolViewController.m
//  MyCollectionAbility
//
//  Created by mac on 17/2/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ConformsToProtocolViewController.h"
#import "ConformsToProtocolFather.h"
#import "ConformsToProtocolSon.h"
#import <objc/runtime.h>
@interface ConformsToProtocolViewController ()

@end

@implementation ConformsToProtocolViewController
/**
 ConformsToProtocol  判断是否实现了协议会传递到父类，如果父类实现，该类也会实现
 class_conformsToProtocol 判断该类是否实现了协议，跟父类无关
 **/
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ConformsToProtocolFather *father = [ConformsToProtocolFather new];
    ConformsToProtocolSon    *son    = [ConformsToProtocolSon new];
    [father callDelegateMehod];
    BOOL isConforms = class_conformsToProtocol([ConformsToProtocolSon class], @protocol(ConformsToProtocolFatherDlegate));
    if (isConforms) {
        NSLog(@"class_conformsToProtocol YES");
    }
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
