//
//  TBNetCell.h
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBNetCellModel : NSObject
@property(nonatomic, strong) NSIndexPath *indexPath;
@property(nonatomic, strong) NSString *name;
@end

@interface TBNetCell : UITableViewCell


- (void)configWithData:(TBNetCellModel *)model;

@end

NS_ASSUME_NONNULL_END
