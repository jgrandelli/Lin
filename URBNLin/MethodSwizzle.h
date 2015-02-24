//
//  MethodSwizzle.h
//  Lin
//
//  Created by Katsuma Tanaka on 2015/02/05.
//  Copyright (c) 2015年 Katsuma Tanaka. All rights reserved.
//

#import <objc/runtime.h>

void MethodSwizzle(Class cls, SEL org_sel, SEL alt_sel);
