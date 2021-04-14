//
//  TBTimerCell.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "TBTimerCell.h"
#import "BBTimer.h"

@implementation TBTimerCellModel

- (NSString *)description
{
    NSString *result = @"";
    result = [result stringByAppendingString:@"{\n"];
    
    result = [result stringByAppendingString:@"\t"];
    result = [result stringByAppendingFormat:@"cellID = %@",self.cellId];
    result = [result stringByAppendingString:@"\n"];
    
    result = [result stringByAppendingString:@"\t"];
    result = [result stringByAppendingFormat:@"cellName = %@",self.cellName];
    result = [result stringByAppendingString:@"\n"];

    result = [result stringByAppendingString:@"\t"];
    result = [result stringByAppendingFormat:@"countDown = %ld",self.countDown];
    result = [result stringByAppendingString:@"\n"];

    result = [result stringByAppendingString:@"\n}"];
    
    return result;
}
@end


@interface TBTimerCell()

@property(nonatomic, strong) BBTimer *timer;

@property(nonatomic, strong) UILabel *cellIdLabel;
@property(nonatomic, strong) UILabel *cellNameLabel;
@property(nonatomic, strong) UILabel *countDownLabel;
@end


@implementation TBTimerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.cellIdLabel];
        [self.contentView addSubview:self.cellNameLabel];
        [self.contentView addSubview:self.countDownLabel];
        
        self.cellNameLabel.frame = CGRectMake(10, 4, 150, 50);
        self.cellNameLabel.frame = CGRectMake(10, CGRectGetMaxY(self.cellNameLabel.frame), 150, 50);
        self.countDownLabel.frame = CGRectMake(10, CGRectGetMaxY(self.cellNameLabel.frame), 150, 50);
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configWithData:(TBTimerCellModel *)model
{
    
    [self.timer cancel];

    
    __block NSInteger endTime = model.countDown;
    self.cellNameLabel.text = [NSString stringWithFormat:@"%@--%@",model.cellId,model.cellName];
    self.cellIdLabel.text = model.cellId;
    
    self.timer = [BBTimer timerWithTimeInterval:5 block:^(BBTimer * _Nonnull timer) {
        if (endTime <= 0) {
            [timer cancel];
        }
        endTime--;
        self.countDownLabel.text = [NSString stringWithFormat:@"倒计时: %ld",endTime];
        NSLog(@"%@",model);
    }];
    
    [self.timer resume];
}

//MARK: - get
- (UILabel *)cellIdLabel
{
    if (!_cellIdLabel) {
        _cellIdLabel = [UILabel new];
    }
    return _cellIdLabel;
}

- (UILabel *)cellNameLabel
{
    if (!_cellNameLabel) {
        _cellNameLabel = [UILabel new];
    }
    return _cellNameLabel;
}

- (UILabel *)countDownLabel
{
    if (!_countDownLabel) {
        _countDownLabel = [UILabel new];
    }
    return _countDownLabel;
}


@end
