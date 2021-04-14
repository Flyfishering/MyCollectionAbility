//
//  TBNetCell.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TBNetCell.h"
#import "TBNetHandle.h"


@implementation TBNetCellModel
- (NSString *)description
{
    return self.name;
}

@end

@interface TBNetCell()<TBNetHandleProtocol>

@property(nonatomic, strong) TBNetHandle *netHandle;
@property(nonatomic, strong) TBNetCellModel *model;
@end

@implementation TBNetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configWithData:(TBNetCellModel *)model
{
    NSLog(@"开始展示 %@",model);
    self.model = model;
    self.textLabel.text = model.name;
    if (model.indexPath.row == 0) {
        [self.netHandle requst];
    }
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    NSLog(@"prepareForReuse %@",self.model);
}

//MARK: - TBNetHandleProtocol

-  (void)requestSuccess
{
    // 执行这个代码时，这时候的 cell 已经不是发起网络请求的 cell 了
    NSLog(@"self.model = %@",self.model);
}

//MARK: - get

- (TBNetHandle *)netHandle
{
    if (!_netHandle) {
        _netHandle = [TBNetHandle new];
        _netHandle.delegate = self;
    }
    return _netHandle;
}

@end
