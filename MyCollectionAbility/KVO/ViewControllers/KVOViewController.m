//
//  KVOViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "KVOViewController.h"
#import "KVO_target.h"
#import "KVO_Observer.h"
#import "KVO_TargetWrapper.h"
#import "KVO_Foo.h"
#import "KVCBankAccount.h"
#import <objc/runtime.h>
#import "KVO_ManualChangeNotification.h"
#import "KVO_DependentKeys.h"

@interface KVOViewController ()

@end

@implementation KVOViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self kvoMethod];
//    [self KVO_ManualChangeNotification];
    
    [self KVO_DependentKeysMethod];
//    [self kvoMethod111];
}

- (void)kvoMethod111{
    //文章地址 http://blog.csdn.net/kesalin/article/details/8194240
    KVO_target *target = [[KVO_target alloc] init];
    KVO_Observer *observer = [[KVO_Observer alloc] init];
    
    [target addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)([KVO_target class])];
    [target setAge:100];
    // observer = nil; 如果在 removeObserver 之前 释放 observer, 会出现异常
    [target setGrade:100];
    [target removeObserver:observer forKeyPath:@"age"];
    
    //键值观察依赖键
    KVO_TargetWrapper *wrapper = [[KVO_TargetWrapper alloc] init:target];
    [wrapper addObserver:observer forKeyPath:@"information" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)([KVO_TargetWrapper class])];
    [target setGrade:1];
    [wrapper removeObserver:observer forKeyPath:@"information"];
    
    
    KVO_Foo * anything = [[KVO_Foo alloc] init];
    KVO_Foo * x = [[KVO_Foo alloc] init];
    KVO_Foo * y = [[KVO_Foo alloc] init];
    KVO_Foo * xy = [[KVO_Foo alloc] init];
    KVO_Foo * control = [[KVO_Foo alloc] init];
    
    [x addObserver:anything forKeyPath:@"x" options:0 context:NULL];
    [y addObserver:anything forKeyPath:@"y" options:0 context:NULL];
    
    [xy addObserver:anything forKeyPath:@"x" options:0 context:NULL];
    [xy addObserver:anything forKeyPath:@"y" options:0 context:NULL];
    
    PrintDescription(@"control", control);
    PrintDescription(@"x", x);
    PrintDescription(@"y", y);
    PrintDescription(@"xy", xy);
    
    NSLog(@"\n\tUsing NSObject methods, normal setX: is %p, overridden setX: is %p\n",
          [control methodForSelector:@selector(setX:)],
          [x methodForSelector:@selector(setX:)]);
    NSLog(@"\n\tUsing libobjc functions, normal setX: is %p, overridden setX: is %p\n",
          method_getImplementation(class_getInstanceMethod(object_getClass(control),
                                                           @selector(setX:))),
          method_getImplementation(class_getInstanceMethod(object_getClass(x),
                                                           @selector(setX:))));
    [x removeObserver:anything forKeyPath:@"x"];
    [y removeObserver:anything forKeyPath:@"y"];
    [xy removeObserver:anything forKeyPath:@"x"];
    [xy removeObserver:anything forKeyPath:@"y"];
}

- (void)kvoMethod{
    KVCBankAccount *account = [[KVCBankAccount alloc] init];
    // add
    [account addObserver:self forKeyPath:@"currentBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [account addObserver:self forKeyPath:@"owner" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [account addObserver:self forKeyPath:@"owner.name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [account addObserver:self forKeyPath:@"transactions" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [account addObserver:self forKeyPath:@"mutableArr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    // change
//    account.currentBalance = @(100);
//    account.owner = [self configOwner];
//    account.owner.name  =  @"王某某";
    account.transactions = [self configTransactions];
    NSMutableArray *mutableTransactions = [account mutableArrayValueForKey:@"transactions"];
    [mutableTransactions addObject:[[KVCTransaction alloc] initWithPayee:@"ennnn" amount:@(123) date:[NSDate date]]];
    KVCTransaction *transaction = mutableTransactions.lastObject;
    transaction.amount = @(0);
    account.mutableArr = [@[@"1",@"2",@"3"] mutableCopy];
    NSMutableArray *mutableArr = [account mutableArrayValueForKey:@"mutableArr"];
    //// 这个方法不会触发 kvo
    [account.mutableArr addObject:@"4"];
    ///// 这个方法可以触发 kvo 
    [mutableArr addObject:@"4"];
    // remove
    [account removeObserver:self forKeyPath:@"currentBalance"];
    [account removeObserver:self forKeyPath:@"owner"];
    [account removeObserver:self forKeyPath:@"owner.name"];
    [account removeObserver:self forKeyPath:@"transactions"];
    [account removeObserver:self forKeyPath:@"mutableArr"];
}

/// 手动管理 kvo
- (void)KVO_ManualChangeNotification{
    KVO_ManualChangeNotification *obj = [[KVO_ManualChangeNotification alloc] init];
    [obj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [obj addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [obj addObserver:self forKeyPath:@"arr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [obj addObserver:self forKeyPath:@"mutableArr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    obj.name = @"李大爷";
    obj.number = 100;
    obj.arr = @[@"apple",@"google",@"IBM"];
    
    // 下面会贴上 kvo 响应方法 observeValueForKeyPath，中参数  change
    NSMutableArray *mutableArr = [obj mutableArrayValueForKey:@"mutableArr"];
    [mutableArr addObject:@"100"];
        //change: {
        //    indexes = "<_NSCachedIndexSet: 0x600000deb680>[number of indexes: 1 (in 1 ranges), indexes: (3)]";
        //    kind = 2;
        //    new =     (100);
        //}
    [mutableArr removeObjectAtIndex:0];
        //change: {
        //    indexes = "<_NSCachedIndexSet: 0x600000deb620>[number of indexes: 1 (in 1 ranges), indexes: (0)]";
        //    kind = 3;
        //    old =     (one);
        //},
    [mutableArr addObjectsFromArray:@[@"90",@"91"]];
        //change: {
        //    indexes = "<_NSCachedIndexSet: 0x600000deb680>[number of indexes: 1 (in 1 ranges), indexes: (3)]";
        //    kind = 2;
        //    new =     (
        //               90
        //               );
        //},
    
        //change: {
        //    indexes = "<_NSCachedIndexSet: 0x600000deb6a0>[number of indexes: 1 (in 1 ranges), indexes: (4)]";
        //    kind = 2;
        //    new =     (
        //               91
        //               );
        //},
    [mutableArr removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)]];
        //change: {
        //    indexes = "<NSIndexSet: 0x600000da8c40>[number of indexes: 2 (in 1 ranges), indexes: (0-1)]";
        //    kind = 3;
        //    old =     (
        //               two,
        //               three
        //               );
        //},
    [mutableArr replaceObjectAtIndex:0 withObject:@"替换"];
        //change: {
        //    indexes = "<_NSCachedIndexSet: 0x6000017f7100>[number of indexes: 1 (in 1 ranges), indexes: (0)]";
        //    kind = 4;
        //    new =     (
        //               "替换"
        //               );
        //    old =     (
        //               one
        //               );
        //},
    NSArray *objs = @[@"替换: 1",@"替换: 2"];
    [mutableArr replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, objs.count)] withObjects:objs];
    //change: {
    //    indexes = "<NSIndexSet: 0x600003d12cc0>[number of indexes: 2 (in 1 ranges), indexes: (0-1)]";
    //    kind = 4;
    //    new =     (
    //               "替换: 1",
    //               "替换: 2"
    //               );
    //    old =     (
    //               "替换",
    //               two
    //               );
    //},
    
    /// remove
    [obj removeObserver:self forKeyPath:@"name"];
    [obj removeObserver:self forKeyPath:@"number"];
    [obj removeObserver:self forKeyPath:@"arr"];
    [obj removeObserver:self forKeyPath:@"mutableArr"];
}

/// kvo 存在 key依赖的情况， fullName 依赖于 firstName 和 lastName
- (void)KVO_DependentKeysMethod{
    // key 依赖
    KVO_DependentKeys *obj = [[KVO_DependentKeys alloc] init];
    {
        [obj addObserver:self forKeyPath:@"fullName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
        obj.firstName = @"wang";
        obj.lastName = @"bin bin";
        NSLog(@"fullName = %@",obj.fullName);
        
        [obj removeObserver:self forKeyPath:@"fullName"];
    }
    
    // keyPath 依赖
    KVO_target *target;
    {
        target = [[KVO_target alloc] init];
        target.age = 20;
        target.grade = 5;
    }
    
    KVO_DependentKeys *objKeyPath = [[KVO_DependentKeys alloc] init];
    {
        objKeyPath.target = target;
        [objKeyPath addObserver:self forKeyPath:@"information" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        target.age = 22;
        target.grade = 7;
        NSLog(@"information = %@",objKeyPath.information);
        [objKeyPath removeObserver:self forKeyPath:@"information" ];
    }
}

#pragma mark - KVO responsed
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"kvo responsed");
    NSLog(@"\n\t keyPath: %@,  \n\t object: %@, \n\t change: %@, \n\t context: @%",keyPath,object,change,context);
}

#pragma mark - c methods
//获取所有方法
static NSArray * ClassMethodNames(Class c)
{
    NSMutableArray * array = [NSMutableArray array];
    
    unsigned int methodCount = 0;
    Method * methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for(i = 0; i < methodCount; i++) {
        //NSLog(@"%@",NSStringFromSelector(method_getName(methodList[i])));
        [array addObject: NSStringFromSelector(method_getName(methodList[i]))];
    }
    
    free(methodList);
    
    return array;
}

//打印
static void PrintDescription(NSString * name, id obj)
{
    NSString * str = [NSString stringWithFormat:
                      @"\n\t%@: %@\n\tNSObject class %s\n\tlibobjc class %s\n\timplements methods <%@>",
                      name,
                      obj,
                      class_getName([obj class]),
                      class_getName(object_getClass(obj)),
                      [ClassMethodNames(object_getClass(obj)) componentsJoinedByString:@", "]];
    NSLog(@"%@", str);
}





#pragma - mark private method

- (NSArray *)configTransactions {
    NSArray *payees = @[@"Green Power",@"Green Power",@"Green Power",
                        @"Car Loan",@"Car Loan",@"Car Loan",
                        @"General Cable",@"General Cable",@"General Cable",
                        @"Mortgage",@"Mortgage",@"Mortgage",
                        @"Animal Hospital"
                        ];
    NSArray *amounts = @[@(120.0),@(150.0),@(170.0),
                         @(250.00),@(250.00),@(250.00),
                         @(120.00),@(155.00),@(120.00),
                         @(1250.00),@(1250.00),@(1250.00),
                         @(600.00)];
    NSArray *dateString = @[@"04-09-2016",@"06-12-2016",@"08-01-2015",
                            @"05-16-2015",@"07-12-2015",@"08-10-2015",
                            @"01-12-2015",@"04-12-2015",@"03-12-2015",
                            @"02-03-2015",@"05-12-2015",@"02-12-2016",
                            @"02-11-2015"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    dateFormatter.dateFormat = @"M-d-yyyy";
    
    NSMutableArray *mutableArr = [NSMutableArray array];
    for (NSInteger i=0; i<payees.count; i++) {
        NSDate *date = [dateFormatter dateFromString:dateString[i]];
        KVCTransaction *tra = [[KVCTransaction alloc] initWithPayee:payees[i] amount:amounts[i] date:date];
        [mutableArr addObject:tra];
    }
    return [mutableArr copy];
}

- (KVCPerson *)configOwner{
    KVCPerson * person = [KVCPerson new];
    person.name = @"王大爷";
    KVCAddress *address = [KVCAddress new];
    address.street = @"复兴路";
    person.address = address;
    return person;
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
