//
//  NSKeyedArichiverDemo1.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSKeyedArichiverModel1.h"

@implementation NSKeyedArichiverModel1

+ (void)ArichiverBaseMethod{
    
//代码来源    http://www.cnblogs.com/ios8/p/ios-archive.html
    NSString *homeDictionary = NSHomeDirectory();//获取根目录
        
    //atany.archiver  无论后缀是什么样都可以
    NSString *homePath  = [homeDictionary stringByAppendingPathComponent:@"atany.archiver"];//添加储存的文件名
    

    
    
    //判断归档是否成功
    BOOL flag = [NSKeyedArchiver archiveRootObject:@"归档测试" toFile:homePath];//归档一个字符串
    
    if (!flag) {
        NSLog(@"归档失败");
        return;
    }
    
    //解档
    NSString *getStr =  [NSKeyedUnarchiver unarchiveObjectWithFile:homePath];
    NSLog(@"%@",getStr);
}
@end
