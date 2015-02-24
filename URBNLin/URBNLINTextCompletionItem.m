//
//  LINTextCompletionItem.m
//  Lin
//
//  Created by Katsuma Tanaka on 2015/02/05.
//  Copyright (c) 2015年 Katsuma Tanaka. All rights reserved.
//

#import "URBNLINTextCompletionItem.h"
#import <AppKit/AppKit.h>
#import "URBNLin.h"

// Models
#import "URBNLINLocalization.h"

@interface URBNLINTextCompletionItem ()

@property (nonatomic, copy, readwrite) NSArray *localizations;
@property (nonatomic, copy) NSString *body;

@end

@implementation URBNLINTextCompletionItem

- (instancetype)initWithLocalizations:(NSArray *)localizations
{
    self = [super init];
    
    if (self) {
        self.priority = 999.0;
        self.localizations = localizations;
        
        // Build description text
        NSMutableString *body = [NSMutableString string];
        
        [self.localizations enumerateObjectsUsingBlock:^(URBNLINLocalization *localization, NSUInteger index, BOOL *stop) {
            if (index > 0) [body appendString:@"\n"];
            [body appendFormat:@"(%@) %@", localization.languageDesignation, localization.value];
        }];
        
        self.body = body;
    }
    
    return self;
}


#pragma mark - Accessors

- (NSString *)name
{
    return [self key];
}

- (BOOL)notRecommended
{
    return NO;
}

- (DVTSourceCodeSymbolKind *)symbolKind
{
    return nil;
}

- (NSAttributedString *)descriptionText
{
    return [[NSAttributedString alloc] initWithString:self.body];
}

- (NSString *)parentText
{
    return nil;
}

- (NSString *)completionText
{
    return [NSString stringWithFormat:[self replacementText], [self key]];
}

- (NSString *)displayType
{
    return (self.sourceCodeLanguage == URBNLINSourceCodeLanguageObjectiveC) ? @"NSString *const" : @"String const";
}

- (NSString *)displayText
{
    return [NSString stringWithFormat:[self replacementText], [self key]];
}

- (NSString *)replacementText {
    return @"%@";
}

- (void)_fillInTheRest
{
}


#pragma mark - Additional Accessors

- (NSString *)key
{
    return [[self.localizations firstObject] key];
}

@end
