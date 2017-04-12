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
#import <objc/runtime.h>
@interface KVOViewController ()

@end

@implementation KVOViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
//文章地址 http://blog.csdn.net/kesalin/article/details/8194240
    KVO_target *target = [[KVO_target alloc] init];
    KVO_Observer *observer = [[KVO_Observer alloc] init];
    
    [target addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)([KVO_target class])];
    [target setAge:100];
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



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
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
