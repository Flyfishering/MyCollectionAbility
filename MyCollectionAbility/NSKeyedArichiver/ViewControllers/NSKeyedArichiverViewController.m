//
//  NSKeyedArichiverViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSKeyedArichiverViewController.h"
#import "NSKeyedArichiverModel1.h"
@interface NSKeyedArichiverViewController ()

@end

@implementation NSKeyedArichiverViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [NSKeyedArichiverModel1 ArichiverBaseMethod];
}


#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters and setters


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
