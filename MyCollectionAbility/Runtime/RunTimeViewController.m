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

}


@end
