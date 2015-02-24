//
//  DVTTextCompletionDataSource+URBNLin.m
//  Lin
//
//  Created by Katsuma Tanaka on 2015/02/08.
//  Copyright (c) 2015年 Katsuma Tanaka. All rights reserved.
//

#import "DVTTextCompletionDataSource+URBNLin.h"
#import "MethodSwizzle.h"
#import "Xcode.h"
#import "URBNLin.h"
#import "URBNLINTextCompletionItem.h"

@implementation DVTTextCompletionDataSource (URBNLin)

+ (void)load
{
    MethodSwizzle(self,
                  @selector(generateCompletionsForDocumentLocation:context:completionBlock:),
                  @selector(urbnLin_generateCompletionsForDocumentLocation:context:completionBlock:));
}

- (void)urbnLin_generateCompletionsForDocumentLocation:(id)arg1 context:(id)arg2 completionBlock:(void (^)(id, id))arg3
{
    DVTSourceTextView *textView = [arg2 objectForKey:@"DVTTextCompletionContextTextView"];
    DVTTextStorage *textStorage = (DVTTextStorage *)textView.textStorage;
    DVTSourceCodeLanguage *language = textStorage.language;
    
    BOOL shouldAutoComplete = [[URBNLin sharedInstance] shouldAutoCompleteInTextView:textView location:textView.selectedRange.location];
    
    if (shouldAutoComplete) {
        IDEWorkspace *workspace = [arg2 objectForKey:@"IDETextCompletionContextWorkspaceKey"];
        NSArray *items = [[URBNLin sharedInstance] completionItemsForWorkspace:workspace];
        
        URBNLINSourceCodeLanguage sourceCodeLanguage = [language urbnLin_isObjectiveC] ? URBNLINSourceCodeLanguageObjectiveC : URBNLINSourceCodeLanguageSwift;
        for (URBNLINTextCompletionItem *item in items) {
            item.sourceCodeLanguage = sourceCodeLanguage;
        }
        
        void (^completionBlock)(id, id) = ^(id obj1, id obj2) {
            if (arg3) arg3(items, obj2);
        };
        
        [self urbnLin_generateCompletionsForDocumentLocation:arg1 context:arg2 completionBlock:completionBlock];
    } else {
        [self urbnLin_generateCompletionsForDocumentLocation:arg1 context:arg2 completionBlock:arg3];
    }
}

@end
