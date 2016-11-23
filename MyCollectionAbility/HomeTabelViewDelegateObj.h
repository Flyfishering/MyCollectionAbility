//
//  HomeTabelViewDelegate.h
//  MyCollectionAbility
//
//  Created by mac on 16/11/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^selectCell) (NSIndexPath *indexPath);

@interface HomeTabelViewDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>


/**
 *  创建代理对象实例，并将数据列表传进去
 *  代理对象将消息传递出去，是通过block的方式向外传递消息的
 *  @return 返回实例对象
 */
+ (instancetype)createTableViewDelegateWithDataList:(NSArray *)dataList
                                        selectBlock:(selectCell)selectBlock;


@end
