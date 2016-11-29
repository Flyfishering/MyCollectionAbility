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
#import <UIKit/UIKit.h>
@implementation FileManagerObject


#pragma mark - 文件路径获取
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


#pragma mark - 二、NSString类路径的处理方法
- (void)pathWithStringMethods{
    //http://www.jianshu.com/p/2421e55cb73d
    
//    二、NSString类路径的处理方法
    
//    文件路径的处理
//    
    NSString *path = @"/Uesrs/apple/testfile.txt";
//
//    常用方法如下
//    
//    获得组成此路径的各个组成部分，结果：（"/","User","apple","testfile.txt"）
//    
//    - (NSArray *)pathComponents;
    [self pathComponents:path];

//
//    提取路径的最后一个组成部分，结果：testfile.txt
//    
//    - (NSString *)lastPathComponent;
    [self lastPathComponent:path];
//    
//    删除路径的最后一个组成部分，结果：/Users/apple
//    
//    - (NSString *)stringByDeletingLastPathCpmponent;
    [self stringByDeletingLastPathCpmponent:path];
//    
//    将path添加到先邮路径的末尾，结果：/Users/apple/testfile.txt/app.txt
//    
//    - (NSString *)stringByAppendingPathConmponent:(NSString *)str;
    [self stringByAppendingPathConmponent:path];
//    
//    获取路劲扩展名，结果：text
//    
//    - (NSString *)pathExtension;
    [self pathExtension:path];
//    
//    删除路径最后部分的扩展名，结果：/Users/apple/testfile
//    
//    - (NSString *)stringByDeletingPathExtension;
    [self stringByDeletingPathExtension:path];
//    
//    路径最后部分追加扩展名，结果：/User/apple/testfile.txt.jpg
//    
//    - (NSString *)stringByAppendingPathExtension:(NSString *)str;
    [self stringByAppendingPathExtension:path];
//
}



//    获取文件夹的各个组成部分
//    获得组成此路径的各个组成部分，结果：（"/","User","apple","testfile.txt"）
- (void)pathComponents:(NSString *)path{
    
    NSArray *components = [path pathComponents];
    [components enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"获取文件夹的各个组成部分 %@",obj);
    }];
}

//    提取路径的最后一个组成部分，结果：testfile.txt
- (void)lastPathComponent:(NSString *)path{
    NSString *lastPath = [path lastPathComponent];
    NSLog(@"提取路径的最后一个组成部分 \n%@",lastPath);
}

//    删除路径的最后一个组成部分，结果：/Users/apple
- (void)stringByDeletingLastPathCpmponent:(NSString *)path{
    NSString *str = [path stringByDeletingLastPathComponent];
    NSLog(@"删除路径的最后一个组成部分 \n%@",str);
}

//    将path添加到先邮路径的末尾，结果：/Users/apple/testfile.txt/app.txt
- (void)stringByAppendingPathConmponent:(NSString *)path{
    NSString *str = [path stringByAppendingPathComponent:@"app.txt"];
    NSLog(@"将path添加到先邮路径的末尾 \n%@",str);
}

//    获取路劲扩展名，结果：text
- (void)pathExtension:(NSString *)path{
    NSString *str = [path pathExtension];
    NSLog(@"获取路劲扩展名 \n%@",str);
}

//    删除路径最后部分的扩展名，结果：/Users/apple/testfile
- (void)stringByDeletingPathExtension:(NSString *)path{
    NSString *str = [path stringByDeletingPathExtension];
    NSLog(@"删除路径最后部分的扩展名 \n%@",str);
}

//    路径最后部分追加扩展名，结果：/User/apple/testfile.txt.jpg
- (void)stringByAppendingPathExtension:(NSString *)path{
    NSString *str = [path stringByAppendingPathExtension:@".jpg"];
    NSLog(@"路径最后部分追加扩展名 \n%@",str);
}


#pragma mark - 三、NSData

- (void)aboutNSData{
//    NSData是用来包装数据的
//    
//    NSData存储的是二进制数据，屏蔽了数据之间的差异，文本、音频、图像等数据都可用NSData来存储
//    
//    NSData的用法
//    
//    1.NSString与NSData互相转换
//    
//    NSData－> NSString                                                                                     NSString *aString = [[NSString alloc] initWithData:adataencoding:NSUTF8StringEncoding];
//    
//    NSString－>NSData                                                                                      NSString *aString = @"1234abcd";
//    
//    NSData *aData = [aString dataUsingEncoding: NSUTF8StringEncoding];
//    
//    将data类型的数据,转成UTF8的数据
    //NSString 和 NSData 相互转化
    [self theInterconversionOfStringAndData];
//
//    +(NSString *)dataToUTF8String:(NSData *)data
//    
//    {
//        
//        NSString *buf = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        
//        return [buf autorelease];
//        
//    }
//    
//    将string转换为指定编码
//    
//    +(NSString *)changeDataToEncodinString:(NSData *)data encodin:(NSStringEncoding )encodin{
//        
//        NSString *buf = [[[NSString alloc] initWithData:data encoding:encodin] autorelease];
//        
//        return buf;
//        
//    }
//    
//    2. NSData 与 UIImage
//    
//    NSData－>UIImage

    [self imageWithData];
//    
//    3.NSData与NSArray  NSDictionary
//    
//    +(NSString *)getLocalFilePath:(NSString *) fileName
//    
//    {
//        
//        return [NSString stringWithFormat:@"%@/%@%@", NSHomeDirectory(),@“Documents”,fileName];
//        
//    }
//    
//    包括将NSData写进Documents目录
//    
//    从Documents目录读取数据
//    
//    在进行网络数据通信的时候，经常会遇到NSData类型的数据。在该数据是dictionary结构的情况下，系统没有提供现成的转换成NSDictionary的方法，为此可以通过Category对NSDictionary进行扩展，以支持从NSData到NSDictionary的转换。声明和实现如下：
//
    
    [self theInterconversionOfDictionaryAndData];
    
    


    

    
}


//NSString 和 NSData 相互转化
- (void)theInterconversionOfStringAndData{
    NSString *str = @"1234567";
    NSData *data= [str dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"data = %@",data);
    
    NSString *strFromData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"strFromData = %@",strFromData);
}


//    2. NSData 与 UIImage
- (void)imageWithData{
    //
    //    UIImage *aimage = [UIImage imageWithData: imageData];
    //
    //    //例：从本地文件沙盒中取图片并转换为NSData
    //
        NSString *path = [[NSBundle mainBundle] bundlePath];
    
        NSString *name = [NSString stringWithFormat:@"ceshi.png"];
    
        NSString *finalPath = [path stringByAppendingPathComponent:name];
    //
        NSData *imageData = [NSData dataWithContentsOfFile: finalPath];
    //
        UIImage *aimage = [UIImage imageWithData: imageData];
}


- (void)theInterconversionOfDictionaryAndData{
    
    NSDictionary *dic = @{@"name":@"macRong",@"webHome":@"eqi.cc"};
    
    if (![NSJSONSerialization isValidJSONObject:dic]) {
        NSLog(@"data can't be convers to JSON DATA");
        return;
    }
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"NSDictionary 转 NSData = %@",data);
    
    NSLog(@"NSData 转 NSDictionary =%@",dictionary);
}

#pragma mark -  四、文件管理常用方法
- (void)aboutNSFileManager{
//    四、文件管理常用方法
//    
//    NSFileManager
//    
//    创建一个文件并写入数据- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr;
//    [[NSFileManager defaultManager] createFileAtPath:@"writeFile" contents:<#(nullable NSData *)#> attributes:<#(nullable NSDictionary<NSString *,id> *)#>]
//
//    从一个文件中读取数据- (NSData *)contentsAtPath:(NSString *)path;
//    
//    scrPath路径上的文件移动到dstPath路径上，注意这里的路径是文件路径而不是目录- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **) error;
//    
//    scrPath路径上的文件复制到dstPath路径上- (BOOL)copyItemAtPath:(NSString *)scrPath toPath:(NSString *)dstPath error:(NSError **) error;
//    
//    比较两个文件的内容是否一样- (BOOL)contentsEqualAtPath:(NSString *)path1 andPath:(NSString *)path2;
//    
//    文件时候存在- (BOOL)fileExistsAtPath:(NSString *)path;
//    
//    移除文件- (BOOL)removeItemAtPath:(NSString *)path error:(NSError **) error;
//    
//    创建文件管理
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];                          NSString *path = [NSHomeDirectory( )  stringByAppendingPathComponent:@"holyBible.txt"];                                                                                                     NSString *text = @"abcdefg";
//    
//    将字符串转成NSData类型NSData *data = [text dataUsingEncoding: NSUTF8StringEncoding];
//    
//    写入文件BOOL success = [fileManager createFileAtPath:path contents:data attributes:nil];
//    
//    创建文件夹
//    
//    NSString *filePath = [path stringByAppendingPathComponent:@"holyBible.txt"];     NSString *contect = @"abcdefg";                                                                     BOOL success = [fm createFileAtPath:filePath contents:[content dataUsingEncoding: NSUTF8StringEncoding] attributes:nil];
//    
//    NSFileManager-读取内容NSData *fileData = [fileManager contentsAtPath:filePath];                                   NSString *content = [[NSString alloc] initWithData:fileData dataUsingEncoding: NSUTF8StringEncoding];
//    
//    NSData-读取内容NSString *filePath = [path stringByAppendingPathComponent:@"holyBible.txt"];     NSData *data = [NSData dataWithContentOfFile:filePath];
//    
//    NSString-读取内容NSString *filePath = [path stringByAppendingPathComponent:@"holyBible.txt"];     NSString *content = [[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//                                                                                                                       
//                                                                                                                       移动、复制文件
//                                                                                                                       
//                                                                                                                       移动文件（重命名）NSString *toPath = [NSHomeDirectory( ) stringByAppendingPathComponent:@"hellogod/New Testament.txt"];                                                                              [fm createDirectoryAtPath:[toPath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];                                                   NSError *error;                                                                                             BOOL isSuccess = [fm moveItemAtPath:filePath toPath:toPath error:&error];
//                                                                                                                       
//                                                                                                                       复制文件（重命名）NSString *copyPath = [NSHomeDirectory( ) stringByAppendingPathComponent:@"备份/Old Testament.txt"];[fm createDirectoryAtPath:[toPath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];                                                   BOOL success = [fm copyItemAtPath:toPath toPath:toPath error:nil];
//                                                                                                                       
//                                                                                                                       删除文件、获取文件大小
//                                                                                                                       
//                                                                                                                       判断文件是否存在和删除文件if([fm fileExistsAtPath])                                                                                     {                                                                                                                    if ([fm removeItemAtPath:copyPath])                                                                {                                                                                                                   NSLog(@"remove success");                                                                            }                                                                                                                  }
//                                                                                                                       
//                                                                                                                       获取文件大小NSFileManager *fileManager = [NSFileManager defaultManager];                         获得文件的属性字典                                                                                         NSDictionary *attrDic = [fileManager attributesOfItemAtpath:sourcePath error:nil];  NSNumber *fileSize = [attrDic objectForKey:NSFileSize];
//                                                                                                                       
//                                                                                                                       获取目录文件信息NSFileManager *fileManager = [NSFileManager defaultManager];                         NSString *enuPath = [NSHomeDirectoty( ) stringByAppendingPathComponent:@"Test"];                                                                                                           NSDictionaryEnumerator *dirEnum = [fileManager enumeratorAtPath:enuPath];     NSString *path = nil;                                                                                      while ((path = [dirEnum nextObject]} != nil)                                                        {                                                                                                                  NSLog(@"%@",path);
//        
//        五、Plist文件
//        
//        String方式添加
//        
//        NSString *path = [NSHomeDirectory( )  stringByAppendingPathComponent:@"Array.plist"];
//        
//        NSString *content = @"abcd";
//        
//        [contect writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        
//        Array方式添加
//        
//        NSString *path = [NSHomeDirectory( )  stringByAppendingPathComponent:@"Array.plist"];
//        
//        [NSArray *array = [[NSArray alloc] initWithObjects:@"123", @"798"，@"000",nil];       [array writeToFile:path atomically:YES];
//         
//         Dictionary方式添加
//         
//         NSString *path = [NSHomeDirectory( )  stringByAppendingPathComponent:@"Dic.plist"];
//         
//         NSDictionary *dic = [NSDictionary alloc] initWithObjects:@"first",@"second",@"third"forKeys:@"123",@"456",@"798"];                                                                       [dic writeToFile:path atomically:YES];
//        
//        数组、字典只能将BOOL、NSNumber、NSString、NSData、NSDate、NSArray、NSDictionary写入属性列表plist文件
//        
//       
//
}
    
@end
