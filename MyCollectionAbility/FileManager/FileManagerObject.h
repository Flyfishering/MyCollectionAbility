//
//  FileManagerObject.h
//  MyCollectionAbility
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManagerObject : NSObject


/**
 获取沙盒目录
 */
+ (void)getSandboxPaths;
#pragma mark - 二、NSString类路径的处理方法
- (void)pathWithStringMethods;
- (void)aboutNSData;
@end
