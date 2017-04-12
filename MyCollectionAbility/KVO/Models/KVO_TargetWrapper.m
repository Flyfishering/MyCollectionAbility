//
//  KVO_TargetWrapper.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "KVO_TargetWrapper.h"
#import "KVO_target.h"
@implementation KVO_TargetWrapper

@synthesize target = _target;
-(id) init:(KVO_target *)aTarget
{
    self = [super init];
    if (nil != self) {
        _target = aTarget;
    }
    
    return self;
}

-(void) dealloc
{
    self.target = nil;
}

- (NSString *)information
{
    return [[NSString alloc] initWithFormat:@"%d#%d", [_target grade], [_target age]];
}

- (void)setInformation:(NSString *)theInformation
{
    NSArray * array = [theInformation componentsSeparatedByString:@"#"];
    [_target setGrade:[[array objectAtIndex:0] intValue]];
    [_target setAge:[[array objectAtIndex:1] intValue]];
}



//关于：keyPathsForValuesAffectingValueForKey 和
//     keyPathsForValuesAffecting<value>
//https://developer.apple.com/reference/objectivec/nsobject/1414299-keypathsforvaluesaffectingvaluef?language=objc


/*
+ (NSSet *)keyPathsForValuesAffectingInformation
{
    NSSet * keyPaths = [NSSet setWithObjects:@"target.age", @"target.grade", nil];
    return keyPaths;
}
*/

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSSet * keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    NSArray * moreKeyPaths = nil;
    
    if ([key isEqualToString:@"information"])
    {
        moreKeyPaths = [NSArray arrayWithObjects:@"target.age", @"target.grade", nil];
    }
    
    if (moreKeyPaths)
    {
        keyPaths = [keyPaths setByAddingObjectsFromArray:moreKeyPaths];
    }
    
    return keyPaths;
}
@end
