//
//  IDEWorkspace+URBNLin.m
//  Lin
//
//  Created by Katsuma Tanaka on 2015/02/05.
//  Copyright (c) 2015年 Katsuma Tanaka. All rights reserved.
//

#import "IDEWorkspace+URBNLin.h"
#import "MethodSwizzle.h"
#import "URBNLin.h"

@implementation IDEWorkspace (URBNLin)

+ (void)load
{
    MethodSwizzle(self,
                  @selector(_updateIndexableFiles:),
                  @selector(urbnLin__updateIndexableFiles:));
}

- (void)urbnLin__updateIndexableFiles:(id)arg1
{
    [self urbnLin__updateIndexableFiles:arg1];
    
    [[URBNLin sharedInstance] indexNeedsUpdate:self.index];
}

@end
