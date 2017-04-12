//
//  User.m
//  MyCollectionAbility
//
//  Created by mac on 17/4/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)description{
    [super description];
    
    return [NSString stringWithFormat:@"\n\tname    =   %@\n\ticon    =   %@\n\tage   =   %d\n\theight    =   %@\n\tmoney =   %@\n\tsex   =   %u\n\tgay   =   %@",_name,_icon,_age,_height,_money,_sex,(_gay ? @"YES":@"NO")];
    
}
@end
