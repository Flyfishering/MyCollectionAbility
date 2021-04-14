//
//  TBTimerCell.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface TBTimerCellModel:NSObject
// id
@property(nonatomic, copy) NSString *cellId;
// name
@property(nonatomic, copy) NSString *cellName;
// 倒计时
@property(nonatomic, assign) NSInteger countDown;
@end

@interface TBTimerCell : UITableViewCell

- (void)configWithData:(TBTimerCellModel *)model;

@end

NS_ASSUME_NONNULL_END
