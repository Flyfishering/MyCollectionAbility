//
//  NSCharacterSetViewController.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSCharacterSetViewController.h"

@interface NSCharacterSetViewController ()
@property (nonatomic, strong) UIButton *printButton;//打印NSCharaters
@end

@implementation NSCharacterSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.printButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)printNSChracters{
    dumpCharacterSet( @"alphanumericCharacterSet" );
    dumpCharacterSet( @"controlCharacterSet" );
    dumpCharacterSet( @"decimalDigitCharacterSet" );
    dumpCharacterSet( @"decomposableCharacterSet" );
    dumpCharacterSet( @"illegalCharacterSet" );
    dumpCharacterSet( @"letterCharacterSet" );
    dumpCharacterSet( @"lowercaseLetterCharacterSet" );
    dumpCharacterSet( @"nonBaseCharacterSet" );
    dumpCharacterSet( @"punctuationCharacterSet" );
    dumpCharacterSet( @"uppercaseLetterCharacterSet" );
    dumpCharacterSet( @"whitespaceAndNewlineCharacterSet" );
    dumpCharacterSet( @"whitespaceCharacterSet" );
    dumpCharacterSet( @"URLQueryAllowedCharacterSet");
}

- (UIButton *)printButton{
    if (!_printButton) {
        _printButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
        _printButton.backgroundColor = [UIColor orangeColor];
        [_printButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_printButton setTitle:@"打印NSCharaters" forState:UIControlStateNormal];
        [_printButton addTarget:self action:@selector(printNSChracters) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _printButton;
}

void dumpCharacterSet( NSString *name )
{
    unichar idx;
    NSCharacterSet *cset = [NSCharacterSet performSelector: NSSelectorFromString(name)];
    
    printf("Character set (0-127): %s\n7-Bit: ", [name UTF8String]);

    for( idx = 0; idx < 256; idx++ )
    {
        if ( 128 == idx ) {
            printf( "\n8-Bit: " );
        }
        
        //Returns a Boolean value that indicates whether a given character is in the receiver.
        if ([cset characterIsMember: idx])
        {
            //判断字符c是否为可打印字符（含空格）
            if ( isprint(idx) ) {
                printf( "%c ", idx);
            }
            else {
                printf( "%02x ", idx);
            }
        }
    }
    printf("\n\n");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
