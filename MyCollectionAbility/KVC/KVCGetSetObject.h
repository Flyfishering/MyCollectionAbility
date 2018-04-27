//
//  KVCGetObject.h
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    float x;
    float y;
    float z;
} Floats;
@interface KVCGetSetObject : NSObject
{
    NSString * _title;
}
@property (nonatomic, assign) int age;
@property (nonatomic, assign) Floats floats;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *books;
@property (nonatomic, strong) NSSet *friends;
@property (nonatomic, strong) NSMutableArray *mutableArray;
@property (nonatomic, assign) BOOL isHidden;

// kvc 返回 数组属性 方法
- (NSUInteger)countOfBooks;
- (id)objectInBooksAtIndex:(NSUInteger)index;
- (NSArray *)booksAtIndexes:(NSIndexSet *)indexes;
@end
