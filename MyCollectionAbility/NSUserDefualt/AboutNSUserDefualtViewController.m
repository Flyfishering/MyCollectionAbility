//
//  AboutNSUserDefualtViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AboutNSUserDefualtViewController.h"

@interface AboutNSUserDefualtViewController ()
@property (nonatomic, strong) AboutNSUserDefualtModel *model;
@end

@implementation AboutNSUserDefualtViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.model.name = @"冷眼";
    self.model.title = @"旁观";
    
    
}



#pragma mark - lazy method

- (AboutNSUserDefualtModel *)model{
    if (!_model) {
        _model = [[AboutNSUserDefualtModel alloc] init];
    }
    return _model;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
