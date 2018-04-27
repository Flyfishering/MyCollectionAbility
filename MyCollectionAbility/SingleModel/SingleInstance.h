//
//  SingleInstance.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/// 宏定义 单例
@interface SingleInstance : NSObject
// 在.h文件使用的宏定义
#define HJSingletonH(name) + (instancetype)shared##name;

#if __has_feature(objc_arc)
// 当前的编译器环境是ARC
// 在.m文件使用的宏定义
#define HJSingletonM(name) \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}-(id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}

#else
// 当前的编译器环境是MRC
// 在.m文件使用的宏定义
#define HJSingletonM(name) \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
} \
-(id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
- (oneway void)release {} \
- (id)retain {return self;} \
- (NSUInteger)retainCount {return 1;} \
- (id)autorelease {return self;}
#endif
@end
