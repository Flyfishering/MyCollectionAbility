//
//  OtherViewController.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/3/2.
//  Copyright © 2021 mac. All rights reserved.
//

#import "OtherViewController.h"
#import "OtherObj.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    OtherObj *obj = [OtherObj new];
    [obj otherTest];
}

@end
