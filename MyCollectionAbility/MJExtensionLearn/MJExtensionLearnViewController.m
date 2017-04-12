//
//  MJExtensionLearnViewController.m
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//


/**
 *  文章地址：http://www.jianshu.com/p/4782fbd029cc
 *
 * date：2017-04-12
 *
 * author:
 *
 **/



#import "MJExtensionLearnViewController.h"
#import "Status.h"
#import "User.h"
#import "StatusResult.h"
#import "MJExtension.h"
#import "Student.h"
#import "Book.h"
@interface MJExtensionLearnViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 标题数组 */
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *methodsArr;
@end

@implementation MJExtensionLearnViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MJExtension 学习";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
}




#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > self.methodsArr.count-1) {
        return;
    }
    NSLog(@"%@",self.methodsArr[indexPath.row]);
    SEL selector = NSSelectorFromString(self.methodsArr[indexPath.row]);
    if([self respondsToSelector:selector]){
        [self performSelector:selector];
    }

}

#pragma mrk - private methods



//1. 简单的字典 --> 模型
- (void)simpleDictionaryToModel{
    
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),/* 枚举需要使用NSNumber包装 */
                           @"gay" : @"NO"
                           };
    
    //字典转模型，使用的是mj_objectWithKeyValues:方法
    User *user = [User mj_objectWithKeyValues:dict];
    NSLog(@"%@",[user description]);
    
}

//2. JSON字符串 --> 模型
- (void)jsonStringToModle{
    // 定义一个JSON字符串
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    // JSON字符串转模型
    User *user = [User mj_objectWithKeyValues:jsonString];
    NSLog(@"%@",[user description]);
}

//3. 复杂的字典 --> 模型 (模型里面包含了模型)
- (void)complexDictionaryToModel{
    NSDictionary *dict = @{
                           @"text" : @"Agree!Nice weather!",
                           @"user" : @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png"
                                   },
                           @"retweetedStatus" : @{
                                   @"text" : @"Nice weather!",
                                   @"user" : @{
                                           @"name" : @"Rose",
                                           @"icon" : @"nami.png"
                                           }
                                   }
                           };
    //字典转模型，模型里面含有模型
    Status *status = [Status mj_objectWithKeyValues:dict];

    NSLog(@"%@",[status description]);
}

//4. 复杂的字典 --> 模型 (模型的数组属性里面又装着模型)
- (void)complexDictionaryToModel1{
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"Nice weather!",
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   @{
                                       @"text" : @"Go camping tomorrow!",
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   ],
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.ad01.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.ad02.com"
                                       }
                                   ],
                           @"totalNumber" : @"2014"
                           };
    //字典转模型，支持模型的数组属性里面又装着模型
    StatusResult *result = [StatusResult mj_objectWithKeyValues:dict];
//    //打印博主信息
//    for (Status *status in result.statuses) {
//        NSString *text = status.text;
//        NSString *name = status.user.name;
//        NSString *icon = status.user.icon;
//        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
//    }
//    // text=Nice weather!, name=Rose, icon=nami.png
//    // text=Go camping tomorrow!, name=Jack, icon=lufy.png
//    //打印广告
//    for (Ad *ad in result.ads) {
//        NSLog(@"image=%@, url=%@", ad.image, ad.url);
//    }
//    // image=ad01.png, url=http://www.ad01.com
//    // image=ad02.png, url=http://www.ad02.com
    NSLog(@"************下面是StatusResult*****************");
    NSLog(@"%@",[result description]);
}


//5. 复杂的字典 --> 模型（模型属性名和字典的key不一样）
- (void)complexDictionaryToModel2{
    NSDictionary *dict = @{
                           @"id" : @"20",
                           @"desciption" : @"kids",
                           @"name" : @{
                                   @"newName" : @"lufy",
                                   @"oldName" : @"kitty",
                                   @"info" : @[
                                           @"test-data",
                                           @{
                                               @"nameChangedTime" : @"2013-08"
                                               }
                                           ]
                                   },
                           @"other" : @{
                                   @"bag" : @{
                                           @"name" : @"a red bag",
                                           @"price" : @100.7
                                           }
                                   }
                           };
    //字典转模型，支持多级映射
    Student *stu = [Student mj_objectWithKeyValues:dict];
    //打印
    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@",
          stu.ID, stu.desc, stu.oldName, stu.nowName, stu.nameChangedTime);
    // ID=20, desc=kids, oldName=kitty, nowName=lufy, nameChangedTime=2013-08
    NSLog(@"bagName=%@, bagPrice=%f", stu.bag.name, stu.bag.price);
    // bagName=a red bag, bagPrice=100.700000
}


//6. 字典数组 --> 模型数组
- (void)dictionatyArrToModelArr{
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png"
                               },
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png"
                               }
                           ];
    //字典数组转模型数组，使用的是mj_objectArrayWithKeyValuesArray:方法
    NSArray *userArray = [User mj_objectArrayWithKeyValuesArray:dictArray];
    //打印
    for (User *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);
    }
    // name=Jack, icon=lufy.png
    // name=Rose, icon=nami.png
}


//7. 模型 --> 字典
- (void)modelToDictionaty{
    //创建一个模型对象
    User *user = [[User alloc] init];
    user.name = @"Jack";
    user.icon = @"lufy.png";
    Status *status = [[Status alloc] init];
    status.user = user;
    status.text = @"Nice mood!";
    //模型转字典，使用的是mj_keyValues属性
    NSDictionary *statusDict = status.mj_keyValues;
    NSLog(@"%@", statusDict);
    /*
     {
     text = "Nice mood!";
     user =     {
     icon = "lufy.png";
     name = Jack;
     };
     }
      */
}

//8. 模型数组 --> 字典数组
- (void)modelArrToDictionayArr{
    //创建模型数组
    User *user1 = [[User alloc] init];
    user1.name = @"Jack";
    user1.icon = @"lufy.png";
    User *user2 = [[User alloc] init];
    user2.name = @"Rose";
    user2.icon = @"nami.png";
    NSArray *userArray = @[user1, user2];
    //模型数组转字典数组，使用的是mj_keyValuesArrayWithObjectArray:方法
    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];
    NSLog(@"%@", dictArray);
    /*
     (
     {
     icon = "lufy.png";
     name = Jack;
     },
     {
     icon = "nami.png";
     name = Rose;
     }
     )
     */
}


// 9. 字典 --> CoreData模型
- (void)dictionatyToCoreData{
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @1.55,
                           @"money" : @"100.9",
                           @"sex" : @(SexFemale),
                           @"gay" : @"true"
                           };
    //字典转为CoreData模型
    NSManagedObjectContext *context = nil;
    User *user = [User mj_objectWithKeyValues:dict
                                      context:context];
    [context save:nil];
}

//10. 归档与解档NSCoding
- (void)archiveAndUnarchiver{
    //创建模型
    Bag *bag = [[Bag alloc] init];
    bag.name = @"Red bag";
    bag.price = 200.8;
    //获取归档路径
    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/bag.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:bag toFile:file];
    //解档
    Bag *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"name=%@, price=%f", decodedBag.name, decodedBag.price);
    // name=(null), price=200.800000
}

//11. 过滤字典的值

- (void)filterDictionaryKeys{
    NSDictionary *dict = @{
                           @"name" : @"5分钟突破iOS开发",
                           @"publishedTime" : @"2011-09-10"
                           };
    //字典转模型，过滤name为nil的情况，把NSString转为NSDate
    Book *book = [Book mj_objectWithKeyValues:dict];
    //打印
    NSLog(@"name=%@, publishedTime=%@", book.name, book.publishedTime);
}


#pragma mark - lazy methods

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.translatesAutoresizingMaskIntoConstraints = NO;
        _tableview.backgroundColor = [UIColor whiteColor];
        _tableview.tableFooterView = [UIView new];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.estimatedRowHeight = 60;
        _tableview.rowHeight = UITableViewAutomaticDimension;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableview;
}

- (NSArray *)titleArr{
    return @[@"1.简单的字典 --> 模型",
             @"2.JSON字符串 --> 模型",
             @"3.复杂的字典 --> 模型 (模型里面包含了模型)",
             @"4.复杂的字典 --> 模型 (模型的数组属性里面又装着模型)",
             @"5.复杂的字典 --> 模型（模型属性名和字典的key不一样）",
             @"6.字典数组 --> 模型数组",
             @"7.模型 --> 字典",
             @"8.模型数组 --> 字典数组",
             @"9.字典 --> CoreData模型",
             @"10.归档与解档NSCoding",
             @"11.过滤字典的值"];
}

- (NSArray *)methodsArr{
    NSArray *selectorArr = @[@"simpleDictionaryToModel",
                             @"jsonStringToModle",
                             @"complexDictionaryToModel",
                             @"complexDictionaryToModel1",
                             @"complexDictionaryToModel2",
                             @"dictionatyArrToModelArr",
                             @"modelToDictionaty",
                             @"modelArrToDictionayArr",
                             @"dictionatyToCoreData",
                             @"archiveAndUnarchiver",
                             @"filterDictionaryKeys"];
    return selectorArr;
}

@end
