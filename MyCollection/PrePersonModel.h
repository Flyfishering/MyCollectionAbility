//
//  PrePersonModel.h
//  MyCollection
//
//  Created by Apple on 2022/5/19.
//  Copyright © 2022 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZLPersonSex) {
 ZLPersonSexMale = 0,
 ZLPersonSexFamale
};



@interface PrePersonModel : NSObject

/** NSString 姓名 */
@property (nonatomic, copy) NSString *name;
/** NSUInteger 年龄 */
@property (nonatomic, assign, readonly) NSUInteger age;
/** ZLPersonSex 性别 */
@property (nonatomic, assign, readonly) ZLPersonSex sex;

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age sex:(ZLPersonSex)sex;


@end

NS_ASSUME_NONNULL_END
