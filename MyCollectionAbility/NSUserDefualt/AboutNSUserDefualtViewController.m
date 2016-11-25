//
//  AboutNSUserDefualtViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AboutNSUserDefualtViewController.h"
#import "MJExtension.h"
static NSString *const kAboutNSUserDefualtModelKey = @"kAboutNSUserDefualtModel";
static NSString *const kAboutNSUserDefualtModelKeyTwo = @"kAboutNSUserDefualtModelKeyTwo";
@interface AboutNSUserDefualtViewController ()
@property (nonatomic, strong) AboutNSUserDefualtModel *aboutNSUserDefualtModel;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation AboutNSUserDefualtViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self demo2];
    
}


/*
   NSUserDefaults 保存的文件在Library/Preferences 中wbb.MyCollectionAbility.plist文件中
 wbb.MyCollectionAbility 是项目bundle identifier
 */


- (void)deleteUserDefault{
//    如何删除NSUserDefaults对应的plist文件？
//    
//    其实就是删除plist文件中所有的键值对。
    NSDictionary *dictionary = [self.userDefaults dictionaryRepresentation];
    for(NSString* key in [dictionary allKeys]){
        [self.userDefaults removeObjectForKey:key];
        [self.userDefaults synchronize];
    }
}


- (void)demo2{

    self.aboutNSUserDefualtModel.name = @"joyon";
    self.aboutNSUserDefualtModel.title = @"the movies";
    
    //不能直接存取NSObject，需要先归档转成NSData
    NSData * data  = [NSKeyedArchiver archivedDataWithRootObject:self.aboutNSUserDefualtModel];
    
    [self.userDefaults setObject:data forKey:kAboutNSUserDefualtModelKeyTwo];
    
    [self.userDefaults synchronize];
    
    
    //创建服务，获取用户token

    NSData * getData = [self.userDefaults objectForKey:kAboutNSUserDefualtModelKeyTwo];
    //在这里解档
    AboutNSUserDefualtModel *getModel = [NSKeyedUnarchiver unarchiveObjectWithData:getData];
    NSLog(@"%@---%@",getModel.name,getModel.title);
}


- (void)demo1{
    
    self.model.name = @"__W B B__";
    self.model.title = @"the price of love";
    
    NSDictionary *modeDic= [self.aboutNSUserDefualtModel mj_keyValues];
    [self.userDefaults setObject:modeDic forKey:kAboutNSUserDefualtModelKey];
    
    //取出字典。
    NSDictionary *verificationDic = [self.userDefaults valueForKey:kAboutNSUserDefualtModelKey];
    
    AboutNSUserDefualtModel *getModel = [AboutNSUserDefualtModel mj_objectWithKeyValues:verificationDic];
    NSLog(@"%@",verificationDic);
    NSLog(@"%@---%@",getModel.name,getModel.title);

}

#pragma mark - lazy method

- (AboutNSUserDefualtModel *)model{
    if (!_aboutNSUserDefualtModel) {
        _aboutNSUserDefualtModel
        = [[AboutNSUserDefualtModel alloc] init];
    }
    return _aboutNSUserDefualtModel;
}

- (NSUserDefaults *)userDefaults{
    return [NSUserDefaults standardUserDefaults];
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
