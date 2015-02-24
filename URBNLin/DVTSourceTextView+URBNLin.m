//
//  DVTCompletingTextView+URBNLin.m
//  Lin
//
//  Created by Katsuma Tanaka on 2015/02/05.
//  Copyright (c) 2015年 Katsuma Tanaka. All rights reserved.
//

#import "DVTSourceTextView+URBNLin.h"
#import "MethodSwizzle.h"
#import "URBNLin.h"

@implementation DVTSourceTextView (URBNLin)

+ (void)load
{
    MethodSwizzle(self,
                  @selector(shouldAutoCompleteAtLocation:),
                  @selector(urbnLin_shouldAutoCompleteAtLocation:));
}

- (BOOL)urbnLin_shouldAutoCompleteAtLocation:(unsigned long long)arg1
{
    BOOL shouldAutoComplete = [self urbnLin_shouldAutoCompleteAtLocation:arg1];
    
    if (!shouldAutoComplete) {
        shouldAutoComplete = [[URBNLin sharedInstance] shouldAutoCompleteInTextView:self location:arg1];
    }
    
    return shouldAutoComplete;
}

@end
