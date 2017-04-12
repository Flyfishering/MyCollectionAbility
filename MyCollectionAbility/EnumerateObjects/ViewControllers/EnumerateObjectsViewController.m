//
//  EnumerateObjectsViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "EnumerateObjectsViewController.h"
#import "EnumerateObjects.h"
@interface EnumerateObjectsViewController ()

@end

@implementation EnumerateObjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[EnumerateObjects new] enumerateObjects];
    
    [self p_configUI];
}

- (void)p_configUI{
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"发现" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    button.center = self.view.center;
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
