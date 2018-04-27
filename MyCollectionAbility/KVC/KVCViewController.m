//
//  KVCViewController.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCViewController.h"
#import "KVCPerson.h"
#import "KVCAddress.h"
#import "KVCNonObjectValues.h"
#import "KVCValidatingObject.h"
#import "KVCGetSetObject.h"
@interface KVCViewController ()
@property (nonatomic, strong) KVCBankAccount *myAccount;
@end

@implementation KVCViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myAccount = [KVCBankAccount new];
    
    //-------KVC set 的简单使用 -----
    [self simpleGet];
    
    //---------KVC get 的简单使用 ----
    [self simpleSet];
    
    //--------KVC 集合对象使用-----
    [self collectObject];
    
    //--------KVC 属性验证-----
    [self KVCValidating];
    
    
    // KVC 操作结构体
    [[KVCNonObjectValues new] setValueWithStruct];
    
    [self searchPatternfortheBasicGetter];
    
    
    
}
// get 属性查找 
- (void)searchPatternfortheBasicGetter{
    // 具体 描述 查看 KVCRReadMe
    KVCGetSetObject *getObject = [KVCGetSetObject new];
    id age = [getObject valueForKey:@"age"];
    NSLog(@"obj type = %@ , value = %@", [age class],age);
    //obj type = __NSCFNumber , value = 30
    // 凡是可以转换为 NSNumber 的标量，都会转为 NSNumber
    // int -> NSNumebr
    
    id floats = [getObject valueForKey:@"floats"];
    NSLog(@"obj type = %@ , value = %@", [floats class],floats);
    // bj type = NSConcreteValue , value = <33331340 0ad78340 48e1a240>
    // 结构体 转换为了 NSConcreteValue 即 NSValue 类型
    
    
    id _title = [getObject valueForKey:@"title"];
    NSLog(@"obj type = %@ , value = %@", [_title class],_title);
   //obj type = __NSCFConstantString , value = kvc 应用
    
    id name = [getObject valueForKey:@"name"];
    NSLog(@"obj type = %@ , value = %@", [name class],name);
    //obj type = __NSCFConstantString , value = 王某某
    
    
    
    id books = [getObject valueForKey:@"books"];
    NSLog(@"obj type = %@ , value = %@", [books class],books);
//    obj type = __NSArrayI , value = (
//                                     "\U8bd7\U7ecf",
//                                     "\U6613\U7ecf",
//                                     "\U8bba\U8bed",
//                                     "\U4f20\U4e60\U5f55"
//                                     )

    id friends = [getObject valueForKey:@"friends"];
    NSLog(@"obj type = %@ , value = %@", [friends class],friends);
//    obj type = __NSSetI , value = {(
//                                    "\U5f20\U67d0\U67d0",
//                                    "\U51af\U67d0\U67d0",
//                                    "\U623f\U67d0\U67d0"
//                                    )}

    id address = [getObject valueForKey:@"address"];
    NSLog(@"obj type = %@ , value = %@", [address class],address);
    //obj type = __NSCFConstantString , value = 某某省，某某市，某某小区
    
    id school = [getObject valueForKey:@"school"];
    NSLog(@"obj type = %@ , value = %@", [school class],school);
//    obj type = __NSCFConstantString , value = 中国某某大学
    
    
    // KVC 对集合对象的 get 操作， 
    NSInteger bookCount = [getObject countOfBooks];
    id obj = [getObject objectInBooksAtIndex:0];
    
    // kvc 可以操作 匿名分类中的实例变量，私有变量
    
    
    // 可变集合类型 
    
}


- (void)simpleSet{
    //-------KVC set 的使用 -----
    [self.myAccount setValue:@(150) forKey:@"currentBalance"];
    [self.myAccount setValue:[self configTransactions] forKey:@"transactions"];
    [self.myAccount setValue:@"王某某" forKeyPath:@"owner.name"];
    [self.myAccount setValuesForKeysWithDictionary:@{@"currentBalance":@(200),@"owner":[NSNull null]}];
    
}


-(void)simpleGet{
    //---------KVC get 的使用 ----
    KVCPerson *person = [self.myAccount valueForKey:@"owner"];
    KVCAddress *address = [self.myAccount valueForKeyPath:@"owner.address"];
    
    NSDictionary *keyValueDic = [self.myAccount dictionaryWithValuesForKeys:@[@"currentBalance",@"owner",@"transactions"]];
}

- (void)collectObject{
    // ------ Using Collection Operators--- 返回集合的某个对象
    
    /*--@count--*/
    NSNumber *numberOfTransactions = [self.myAccount.transactions valueForKeyPath:@"@count"];
    NSLog(@"transactions 数量为 %d",numberOfTransactions.intValue);
    
    /*---@max---*/
    NSDate *latestDate = [self.myAccount.transactions valueForKeyPath:@"@max.date"];
    NSLog(@"最大日期是: %@",latestDate);
    
    /*---@min---*/
    NSDate *earliestDate = [self.myAccount.transactions valueForKeyPath:@"@min.date"];
    NSLog(@"最小日期是：%@",earliestDate);
    
    /*---@sum---*/
    NSNumber *amountSum = [self.myAccount.transactions valueForKeyPath:@"@sum.amount"];
    NSLog(@"总数是：%@",amountSum);
    
    //--------------Array Operators--- 应用集合对象
    /*---@distinctUnionOfObjects---去除重复对象*/
    NSArray *distinctPayees = [self.myAccount.transactions valueForKeyPath:@"@distinctUnionOfObjects.payee"];
    NSLog(@"distinctPayees = %@",distinctPayees);
    
    
    /*----@unionOfObjects---返回所有对象 */
    NSArray *payees = [self.myAccount.transactions valueForKeyPath:@"@unionOfObjects.payee"];
    NSLog(@"unionOfObjects = %@",payees);
    
    
    //-------Nesting Operators 应用集合套集合的情况
    /*------*/
    NSArray *moreTransactions = [self configMoreTransactions];
    NSArray* arrayOfArrays = @[self.myAccount.transactions, moreTransactions];
    
    /*---@distinctUnionOfArrays---*/
    // 得到一个 内容不重复的数组
    NSArray *collectedDistinctPayees = [arrayOfArrays valueForKeyPath:@"@distinctUnionOfArrays.payee"];
    NSLog(@"collectedDistinctPayees = %@",collectedDistinctPayees);
    
    /*---@unionOfArrays---*/
    // 得到一个 包含所有内容的数组
    NSArray *collectedPayees = [arrayOfArrays valueForKeyPath:@"@unionOfArrays.payee"];
    NSLog(@"collectedPayees = %@",collectedPayees);
    
    /*---@distinctUnionOfSets---*/
    // 同 @distinctUnionOfArrays
}

- (void)KVCValidating{
    // KVC 属性验证
    KVCValidatingObject *validatingObjct = [[KVCValidatingObject alloc] init];
    NSError *error;
    NSString *name = @"王某某";
    // 下面的代码不会 进入 else 模块
    // 只有 validatingObjct 实现了方法 alidate<Key>:error:. 才会去验证
    
    if ([validatingObjct validateValue:&name forKey:@"name" error:&error]){
        [validatingObjct setValue:name forKey:@"name"];
    }else{
        NSLog(@"%@", error);
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)configMoreTransactions{
    NSArray *payees = @[@"General Cable - Cottage",
                        @"General Cable - Cottage",
                        @"General Cable - Cottage",
                        @"Second Mortgage",
                        @"Second Mortgage",
                        @"Second Mortgage",
                        @"Hobby Shop"];
    
    NSArray *amounts = @[@(120.00),@(155.00),@(120.00),
                         
        @(1250.00),@(1250.00),@(1250.00),
        @(600.00)];
    NSArray *dateString = @[@"05-09-2015",@"04-09-2015",@"05-12-2015",
       @"01-12-2017",@"09-19-2013",@"01-10-2015",
                            @"04-12-2015"];
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

@end
