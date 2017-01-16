//
//  UISearchBar+YCYBlocks.m
//  UISearchBarBlocks
//
//  Created by Håkon Bogen on 20.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "UISearchBar+YCYBlocks.h"
#import <objc/runtime.h>

/* Only for convenience and readabilty in delegate methods */
typedef BOOL (^YCY_UISearchBarReturnBlock) (UISearchBar *searchBar);
typedef void (^YCY_UISearchBarVoidBlock) (UISearchBar *searchBar);
typedef void (^YCY_UISearchBarSearchTextBlock) (UISearchBar *searchBar,NSString *searchText);
typedef BOOL (^YCY_UISearchBarInRangeReplacementTextBlock) (UISearchBar *searchBar,NSRange range,NSString *text);
typedef void (^YCY_UISearchBarScopeIndexBlock)(UISearchBar *searchBar, NSInteger selectedScope);

@implementation UISearchBar (YCYBlocks)


static const void *YCY_UISearchBarDelegateKey                                = &YCY_UISearchBarDelegateKey;
static const void *YCY_UISearchBarShouldBeginEditingKey                      = &YCY_UISearchBarShouldBeginEditingKey;
static const void *YCY_UISearchBarTextDidBeginEditingKey                     = &YCY_UISearchBarTextDidBeginEditingKey;
static const void *YCY_UISearchBarShouldEndEditingKey                        = &YCY_UISearchBarShouldEndEditingKey;
static const void *YCY_UISearchBarTextDidEndEditingKey                       = &YCY_UISearchBarTextDidEndEditingKey;
static const void *YCY_UISearchBarTextDidChangeKey                           = &YCY_UISearchBarTextDidChangeKey;
static const void *YCY_UISearchBarShouldChangeTextInRangeKey                 = &YCY_UISearchBarShouldChangeTextInRangeKey;
static const void *YCY_UISearchBarSearchButtonClickedKey                                = &YCY_UISearchBarSearchButtonClickedKey;
static const void *YCY_UISearchBarBookmarkButtonClickedKey                                = &YCY_UISearchBarBookmarkButtonClickedKey;
static const void *YCY_UISearchBarCancelButtonClickedKey                                = &YCY_UISearchBarCancelButtonClickedKey;
static const void *YCY_UISearchBarResultsListButtonClickedKey                                = &YCY_UISearchBarResultsListButtonClickedKey;
static const void *YCY_UISearchBarSelectedScopeButtonIndexDidChangeKey                                = &YCY_UISearchBarSelectedScopeButtonIndexDidChangeKey;




#pragma mark UISearchBar delegate Methods
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;
{
    YCY_UISearchBarReturnBlock block = searchBar.ycy_completionShouldBeginEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]){
        return [delegate searchBarShouldBeginEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    YCY_UISearchBarVoidBlock block = searchBar.ycy_completionTextDidBeginEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]){
        [delegate searchBarTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    YCY_UISearchBarReturnBlock block = searchBar.ycy_completionShouldEndEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]){
        return [delegate searchBarShouldEndEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
   YCY_UISearchBarVoidBlock block = searchBar.ycy_completionTextDidEndEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]){
        [delegate searchBarTextDidEndEditing:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    YCY_UISearchBarSearchTextBlock block = searchBar.ycy_completionTextDidChangeBlock;
    if (block) {
        block(searchBar,searchText);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:textDidChange:)]){
        [delegate searchBar:searchBar textDidChange:searchText];
    }
}
// called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    YCY_UISearchBarInRangeReplacementTextBlock block = searchBar.ycy_completionShouldChangeTextInRangeBlock;
    if (block) {
        return block(searchBar,range,text);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]){
        return [delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    YCY_UISearchBarVoidBlock block = searchBar.ycy_completionSearchButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]){
        [delegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    YCY_UISearchBarVoidBlock block = searchBar.ycy_completionBookmarkButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]){
        [delegate searchBarBookmarkButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    YCY_UISearchBarVoidBlock block = searchBar.ycy_completionCancelButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]){
        [delegate searchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    YCY_UISearchBarVoidBlock block = searchBar.ycy_completionResultsListButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]){
        [delegate searchBarResultsListButtonClicked:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    YCY_UISearchBarScopeIndexBlock block = searchBar.ycy_completionSelectedScopeButtonIndexDidChangeBlock;
    if (block) {
        block(searchBar,selectedScope);
    }
    id delegate = objc_getAssociatedObject(self, YCY_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]){
        [delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}


#pragma mark Block setting/getting methods
- (BOOL (^)(UISearchBar *))ycy_completionShouldBeginEditingBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarShouldBeginEditingKey);
}

- (void)setYcy_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldBeginEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarShouldBeginEditingKey, searchBarShouldBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))ycy_completionTextDidBeginEditingBlock
{
    return objc_getAssociatedObject(self,YCY_UISearchBarTextDidBeginEditingKey);
}

- (void)setYcy_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *))searchBarTextDidBeginEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarTextDidBeginEditingKey, searchBarTextDidBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *))ycy_completionShouldEndEditingBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarShouldEndEditingKey);
}

- (void)setYcy_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldEndEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarShouldEndEditingKey, searchBarShouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))ycy_completionTextDidEndEditingBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarTextDidEndEditingKey);
}

- (void)setYcy_completionTextDidEndEditingBlock:(void (^)(UISearchBar *))searchBarTextDidEndEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarTextDidEndEditingKey, searchBarTextDidEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSString *))ycy_completionTextDidChangeBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarTextDidChangeKey);
}

- (void)setYcy_completionTextDidChangeBlock:(void (^)(UISearchBar *, NSString *))searchBarTextDidChangeBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarTextDidChangeKey, searchBarTextDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *, NSRange, NSString *))ycy_completionShouldChangeTextInRangeBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarShouldChangeTextInRangeKey);
}

- (void)setYcy_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *, NSRange, NSString *))searchBarShouldChangeTextInRangeBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarShouldChangeTextInRangeKey, searchBarShouldChangeTextInRangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))ycy_completionSearchButtonClickedBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarSearchButtonClickedKey);
}

- (void)setYcy_completionSearchButtonClickedBlock:(void (^)(UISearchBar *))searchBarSearchButtonClickedBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarSearchButtonClickedKey, searchBarSearchButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))ycy_completionBookmarkButtonClickedBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarBookmarkButtonClickedKey);
}

- (void)setYcy_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *))searchBarBookmarkButtonClickedBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarBookmarkButtonClickedKey, searchBarBookmarkButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))ycy_completionCancelButtonClickedBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarCancelButtonClickedKey);
}

- (void)setYcy_completionCancelButtonClickedBlock:(void (^)(UISearchBar *))searchBarCancelButtonClickedBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarCancelButtonClickedKey, searchBarCancelButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))ycy_completionResultsListButtonClickedBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarResultsListButtonClickedKey);
}

- (void)setYcy_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *))searchBarResultsListButtonClickedBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarResultsListButtonClickedKey, searchBarResultsListButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSInteger))ycy_completionSelectedScopeButtonIndexDidChangeBlock
{
    return objc_getAssociatedObject(self, YCY_UISearchBarSelectedScopeButtonIndexDidChangeKey);
}

- (void)setYcy_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *, NSInteger))searchBarSelectedScopeButtonIndexDidChangeBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCY_UISearchBarSelectedScopeButtonIndexDidChangeKey, searchBarSelectedScopeButtonIndexDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void)ycy_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UISearchBarDelegate>)self) {
        objc_setAssociatedObject(self, YCY_UISearchBarDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UISearchBarDelegate>)self;
    }
}

@end
