//
//  XIB_ObjectViewController.m
//  MyCollectionAbility
//
//  Created by seasaw on 2018/5/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "XIB_ObjectViewController.h"
#import "XIB_CustomButton.h"
@interface XIB_ObjectViewController ()

@end

@implementation XIB_ObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)printTest2:(XIB_CustomButton *)sender {
    NSLog(@"%s",__func__);
}
- (IBAction)printTest3:(UIButton *)sender {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
