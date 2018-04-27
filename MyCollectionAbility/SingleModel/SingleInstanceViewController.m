//
//  SingleInstanceViewController.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SingleInstanceViewController.h"
#import "SingleObject.h"
#import "SingleInstance.h"
#import "SingleInstance1.h"
#import "SingleInstance1.h"
#import "SingleInstance2.h"
#import "SingleInstance3.h"

@interface SingleInstanceViewController ()

@end

@implementation SingleInstanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    SingleInstance1 *obj1 = [SingleInstance1 shareInstance];
    //    obj1.name = @"王某某";
    //    obj1.age = 26;
    //    SingleInstance1 *obj2 = [SingleInstance1  allocWithZone:nil];
    //    SingleInstance1 *obj3 = [SingleInstance1 new];
    //    SingleInstance1 *obj4 = [[SingleInstance1 alloc] init];
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj1,obj1.name,obj1.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj2,obj2.name,obj2.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj3,obj3.name,obj3.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj4,obj4.name,obj4.age);
    
    
    
    //    SingleInstance2 *obj1 = [SingleInstance2 shareInstance];
    //    obj1.name = @"王某某";
    //    obj1.age = 26;
    //    SingleInstance2 *obj2 = [SingleInstance2  allocWithZone:nil];
    //    SingleInstance2 *obj3 = [SingleInstance2 new];
    //    SingleInstance2 *obj4 = [[SingleInstance2 alloc] init];
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj1,obj1.name,obj1.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj2,obj2.name,obj2.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj3,obj3.name,obj3.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj4,obj4.name,obj4.age);
    
    
    SingleInstance3 *obj1 = [SingleInstance3 shareInstance];
    obj1.name = @"王某某";
    obj1.age = 26;
    SingleInstance3 *obj2 = [SingleInstance3  allocWithZone:nil];
    SingleInstance3 *obj3 = [SingleInstance3 new];
    SingleInstance3 *obj4 = [[SingleInstance3 alloc] init];
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj1,obj1.name,obj1.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj2,obj2.name,obj2.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj3,obj3.name,obj3.age);
    //    NSLog(@"obj1 = %@---,姓名 = %@, 年龄 = %ld",obj4,obj4.name,obj4.age);
    NSLog(@"%@",obj1);
    NSLog(@"%@",obj2);
    NSLog(@"%@",obj3);
    NSLog(@"%@",obj4);
    

}

- (void)viewWillLayoutSubviews{
    [self creatTipsLable];
}

- (void)creatTipsLable{
    UILabel *tips = [UILabel new];
    tips.frame = CGRectMake(0, 0, 150, 40);
    tips.center = self.view.center;
    tips.text = @"单例文档 ， 看代码";
    [self.view addSubview:tips];
    NSLog(@"%@",NSStringFromCGRect(tips.frame));
    NSLog(@"%@",NSStringFromCGRect(tips.bounds));
    
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
