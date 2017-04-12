//
//  NSKeyedArichiverViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSKeyedArichiverViewController.h"
#import "NSKeyedArichiverModel1.h"
#import "APLProduct.h"
#import "PersonArichiver.h"
#import "SonArichiver.h"
#import "SecureCodingArichiver.h"
@interface NSKeyedArichiverViewController ()

@end

@implementation NSKeyedArichiverViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    //[NSKeyedArichiverModel1 ArichiverBaseMethod];
   
    //[APLProduct productWithType:@"WANG" name:@"binbin" year:@1992 price:@32];
    //NSString *type = [APLProduct displayNameForType:@"WANG"];
    //NSArray *arr = [APLProduct deviceTypeNames];
    
    //[self p_archieveObjectAndUnarchieveObject];
    [self p_archieveSecureObject];
}


#pragma mark - event response

#pragma mark - private methods

//归档 解档对象
- (void)p_archieveObjectAndUnarchieveObject{
    // 创建person对象
    PersonArichiver *person = [[PersonArichiver alloc] init];
    person.name = @"DNS";
    // 获取cache
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    // 拼接文件全路径
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"person.data"];
    
    // 把自定义对象归档
    BOOL isSuccess =  [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    if (isSuccess) {
        
    }else{
        NSLog(@"归档失败");
    }
    //NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    //NSString *filePath = [cachePath stringByAppendingPathComponent:@"person.data"];
    // 解档
    PersonArichiver *unArchiverPerson =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"解档之后，name = %@",unArchiverPerson.name);
    
    //子类对象归档
    SonArichiver *son = [[SonArichiver alloc] init];
    son.address = @"新疆农七师123团15连";
    son.name = @"高彦虎";
    isSuccess = [NSKeyedArchiver archiveRootObject:son toFile:filePath];
    if(isSuccess){
        
    }else{
        NSLog(@"SonArichiver 归档失败");
    }
    SonArichiver *unArchiverSon = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"解档后，son.address = %@",unArchiverSon.address);
    NSLog(@"接档后，son.name = %@",unArchiverSon.name);
}


- (void)p_archieveSecureObject{
    SecureCodingArichiver *secure = [SecureCodingArichiver new];
    secure.title = @"secure";
    secure.cout = 100;
    secure.isMore = YES;
    secure.longth = 12.32;
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    // 拼接文件全路径
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"secure.data"];
    BOOL isSuccess = [NSKeyedArchiver archiveRootObject:secure toFile:filePath];
    if (isSuccess) {
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
    
    SecureCodingArichiver *unArchiveSecure = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"unArchiveSecure.title = %@",unArchiveSecure.title);
    NSLog(@"unArchiveSecure.cout = %d",unArchiveSecure.cout);
    NSLog(@"unArchiveSecure.isMore = %d",unArchiveSecure.isMore);
    NSLog(@"unArchiveSecure.longth = %lf",unArchiveSecure.longth);

}
#pragma mark - getters and setters




@end
