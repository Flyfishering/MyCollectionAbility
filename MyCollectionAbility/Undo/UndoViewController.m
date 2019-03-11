//
//  UndoViewController.m
//  MyCollectionAbility
//
//  Created by seasaw on 2018/5/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UndoViewController.h"

@interface UndoViewController ()
{
    // NSUndoManager 不能做属性，只能做实例变量
    NSUndoManager *_undoManager;
    NSInteger _a;
}
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation UndoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _undoManager = [[NSUndoManager alloc] init];
    _a = 0;
}

- (void)setNumberLabelText:(NSString *)numberText{
    NSString *currentNumebr = self.numberLabel.text;
    if (currentNumebr != numberText){
        // 注意：这里传入参数为currentNumebr 即旧值。
        [[_undoManager prepareWithInvocationTarget:self] setNumberLabelText:currentNumebr];
        _numberLabel.text = numberText;
        _a = [numberText integerValue];
    }
}

- (void)setObjLabelText:(NSString *)numberText{
    
    NSString *currentNumebr = self.numberLabel.text;
    if (currentNumebr != numberText){
        
        [_undoManager registerUndoWithTarget:self selector:@selector(setObjLabelText:) object:currentNumebr];
        _numberLabel.text = numberText;
        _a = [numberText integerValue];
    }
}

- (IBAction)methodOne:(id)sender {
//    NSInteger number = [self.numberLabel.text integerValue];
//    number++;
    _a++;
    [self setNumberLabelText:[NSString stringWithFormat:@"%ld",(long)_a]];
}

- (IBAction)methodTwo:(id)sender {
//    NSInteger number = [self.numberLabel.text integerValue];
    _a++;
    [self setObjLabelText:[NSString stringWithFormat:@"%ld",(long)_a]];
}

- (IBAction)redo:(id)sender {
    [_undoManager redo];
}

- (IBAction)undo:(id)sender {
    [_undoManager undo];
}


@end
