//
//  FileManagerObject.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 mac. All rights reserved.
//


//一、iOS中的沙盒机制
//
//iOS应用程序只能对自己创建的文件系统读取文件，这个独立、封闭、安全的空间，叫做沙盒。它一般存放着程序包文件（可执行文件）、图片、音频、视频、plist文件、sqlite数据库以及其他文件。
//
//每个应用程序都有自己的独立的存储空间（沙盒）
//
//一般来说应用程序之间是不可以互相访问
//模拟器沙盒的位置
//
///User/userName/Library/Application Support/iPhone Simulator
//当我们创建应用程序时，在每个沙盒中含有三个文件，分别是Document、Library和temp。
//
//Document：一般需要持久的数据都放在此目录中，可以在当中添加子文件夹，iTunes备份和恢复的时候，会包括此目录。
//
//Library：设置程序的默认设置和其他状态信息
/*
 NSUserDefaults 保存的文件在Library/Preferences 中wbb.MyCollectionAbility.plist文件中
 wbb.MyCollectionAbility 是项目bundle identifier
 */
//
//temp：创建临时文件的目录，当iOS设备重启时，文件会被自动清除


#import "FileManagerObject.h"

@implementation FileManagerObject


+ (void)getSandboxPaths{
    
//    获取沙盒目录
    
//    获取程序的根目录（home）目录
    
    NSString *homePath = NSHomeDirectory();
    NSLog(@"homePath = %@",homePath);
//    打印：homePath = /Users/mac/Library/Developer/CoreSimulator/Devices/A86EE96B-1BF0-4CC9-812C-4DD27A6DE72E/data/Containers/Data/Application/4A9E1F21-5DA3-4628-8E3D-63227AEA664F
    
    
//    获取Document目录

    /*
     
     domains n. 域，域名；领域；网域（domain的复数形式）
     */
    /*
     NSUserDomainMask = 1,//用户主目录中
     NSLocalDomainMask = 2,//当前机器中
     NSNetworkDomainMask = 4,//网络中可见的主机
     NSSystemDomainMask = 8,//系统目录,不可修改(/System)
     NSAllDomainsMask = 0x0ffff,//全部
     */

    //查找文件指定文件路径 返回一个文件路径的数组
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //这个数组中有几个元素呢？
    
    NSString *docPath = [paths lastObject];
    NSLog(@"docPath = %@",docPath);
//    打印：docPath = /Users/mac/Library/Developer/CoreSimulator/Devices/A86EE96B-1BF0-4CC9-812C-4DD27A6DE72E/data/Containers/Data/Application/4A9E1F21-5DA3-4628-8E3D-63227AEA664F/Documents
    
    
    
//    获取Library目录
    NSArray *LibraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    //这个数组中有几个元素呢？
    NSString *libraryPath = [LibraryPaths lastObject];
    NSLog(@"libraryPath = %@",libraryPath);
//    打印：libraryPath = /Users/mac/Library/Developer/CoreSimulator/Devices/A86EE96B-1BF0-4CC9-812C-4DD27A6DE72E/data/Containers/Data/Application/4A9E1F21-5DA3-4628-8E3D-63227AEA664F/Library
    
    
//    获取Library中的Cache
    NSArray *CachesPathArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [CachesPathArr lastObject];
    NSLog(@"cachePath = %@",cachePath);
//    打印：cachePath = /Users/mac/Library/Developer/CoreSimulator/Devices/A86EE96B-1BF0-4CC9-812C-4DD27A6DE72E/data/Containers/Data/Application/4A9E1F21-5DA3-4628-8E3D-63227AEA664F/Library/Caches
    
    
    
//    获取Library中的Preferences
    NSArray *preferencesPathArr = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES);
    NSString *preferencesPath = [preferencesPathArr lastObject];
    NSLog(@"preferencesPath = %@",preferencesPath);
//    打印：preferencesPath = /Users/mac/Library/Developer/CoreSimulator/Devices/A86EE96B-1BF0-4CC9-812C-4DD27A6DE72E/data/Containers/Data/Application/4A9E1F21-5DA3-4628-8E3D-63227AEA664F/Library/PreferencePanes
    
//    获取temp路径
    
    NSString *temp = NSTemporaryDirectory();
    NSLog(@"temp = %@",temp);
//    打印：temp = /Users/mac/Library/Developer/CoreSimulator/Devices/A86EE96B-1BF0-4CC9-812C-4DD27A6DE72E/data/Containers/Data/Application/4A9E1F21-5DA3-4628-8E3D-63227AEA664F/tmp/
    
}



- (void)pathWithStringMethods{
    //http://www.jianshu.com/p/2421e55cb73d
    
    
    
}
@end
