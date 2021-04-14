//
//  HomeTableView.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeTableView.h"

@implementation HomeTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 
 
 这里主要做一些平常知识点的归纳和总结
 1. NSUserDefualt 保存对象
 http://www.jianshu.com/p/6a6c0c63a438
 
 2.NSTime 的用法  
 http://www.cocoachina.com/ios/20150710/12444.html
 http://www.jianshu.com/p/fc2e4c2bfead
 http://blog.csdn.net/davidsph/article/details/7899483
 http://blog.csdn.net/samuelltk/article/details/7484533
 http://www.cnblogs.com/smileEvday/archive/2012/12/21/NSTimer.html 这个是重点
 http://www.jianshu.com/p/d8fdaf04cad6
 
 */

#pragma mark - life cycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        
    }
    return self;

}


- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor orangeColor];
    NSLog(@"HomeTableView %s",__func__);
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
