//
//  NomalTableviewVC.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewComponent.h"

NS_ASSUME_NONNULL_BEGIN
/// 默认 tablview 风格 (默认 cell  ， 只有一个标题， 点击事件是跳转 VC)
@interface NomalTableviewVC : UIViewController

///子类实现 get 方法
@property(nonatomic, strong, readonly) NSArray<TableviewCellItem *> *data;


@end

NS_ASSUME_NONNULL_END
