//
//  DVTSourceCodeLanguage+Lin.m
//  Lin
//
//  Created by Katsuma Tanaka on 2015/02/08.
//  Copyright (c) 2015年 Katsuma Tanaka. All rights reserved.
//

#import "DVTSourceCodeLanguage+URBNLin.h"

@implementation DVTSourceCodeLanguage (URBNLin)

- (BOOL)urbnLin_isObjectiveC
{
    return [self.languageName isEqualToString:@"Objective-C"];
}

- (BOOL)urbnLin_isSwift
{
    return [self.languageName isEqualToString:@"Swift"];
}

@end
