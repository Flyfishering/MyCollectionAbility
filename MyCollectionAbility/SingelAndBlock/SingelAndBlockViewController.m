//
//  SingelAndBlockViewController.m
//  MyCollectionAbility
//
//  Created by mac on 17/3/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SingelAndBlockViewController.h"
#import "SingelAndBlockSingel.h"
#import "SingelAndBlockFirstObjct.h"
#import "SingelAndBlockSecondObject.h"
@interface SingelAndBlockViewController ()

@end

@implementation SingelAndBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    SingelAndBlockSingel *singel = [SingelAndBlockSingel shareManager];
    
    
    SingelAndBlockSecondObject *second = [SingelAndBlockSecondObject new];
    SingelAndBlockFirstObjct *first = [SingelAndBlockFirstObjct new];
    if (singel.blockMethod) {
        singel.blockMethod();
    }
    //对于block 的调用就像是给block赋值，虽然同一个block会在不同的地方调用，但是他实际上只会调用最后一个被赋值的bolock
    //比如 上面的例子，first 和second 初始化的时候都会调用block,但是只有一个会调用成功，谁后调用谁成功
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
