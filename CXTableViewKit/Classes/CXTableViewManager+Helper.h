//
//  CXTableViewManager+Helper.h
//  CXTableViewManager
//
//  Created by 沈春兴 on 2021/9/25.
//

#import <CXTableViewKit/CXTableViewManager.h>


#define S(item) NSStringFromClass([item class])
@interface CXTableViewManager (Helper)

/**
 批量添加组

 @param sections CXTableViewSection子类集合
 */
- (void)addManagerSections:(NSArray<CXTableViewSection *> *)sections;

/**
 批量注册cell，example：CXTextFieldItem--CXTextFieldCell,xxxItem--xxxCell
 */
- (void)registerItems:(NSArray<NSString *> *)items;

/**
 刷新item响应到界面
 
 @param item 刷新的item
 */
- (void)reloadDisplayedItem:(CXTableViewItem *)item;

/**
 刷新多个item响应到界面
 
 @param items 需要刷新的items
 */
- (void)reloadDisplayedItems:(NSArray <CXTableViewItem *> *)items;

/**
 删除item响应到界面
 
 @param item 删除的item
 */
- (void)deleteDisplayedItem:(CXTableViewItem *)item;


- (void)showItemsForSections:(NSArray<CXTableViewSection *> *)sections shouldShow:(BOOL)shouldShow;
- (void)showItems:(NSArray<CXTableViewItem *> *)items shouldShow:(BOOL)shouldShow;

@end

