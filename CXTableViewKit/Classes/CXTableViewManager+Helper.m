//
//  CXTableViewManager+Helper.m
//  CXTableViewManager
//
//  Created by 沈春兴 on 2021/9/25.
//

#import "CXTableViewManager+Helper.h"
#import "CXTableViewItem.h"
#import "CXTableViewSection.h"

@implementation CXTableViewManager (Helper)

- (void)addManagerSections:(NSArray<CXTableViewSection *> *)sections {
    
    [sections enumerateObjectsUsingBlock:^(CXTableViewSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSection:obj];
    }];
}

- (void)registerItems:(NSArray<NSString *> *)items {
    
    NSString *realItem = nil;
    for (NSString *item in items) {
        if ([item hasSuffix:@"Item"]) {
            realItem = [item stringByReplacingOccurrencesOfString:@"Item" withString:@""];
        }
        NSString *cell = [realItem stringByAppendingString:@"Cell"];
        NSString *item = [realItem stringByAppendingString:@"Item"];
        
        NSAssert(NSClassFromString(cell) && NSClassFromString(item), @"can't find cell %@ or item %@", cell, item);
        
        [self registerCell:cell item:item];
    }
}

- (void)reloadDisplayedItem:(CXTableViewItem *)item {
    NSCParameterAssert(item.indexPath);
    
    UITableView *tableView = [self valueForKey:@"tableView"];
    [tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)reloadDisplayedItems:(NSArray<CXTableViewItem *>*)items {
    
    UITableView *tableView = [self valueForKey:@"tableView"];
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    [items enumerateObjectsUsingBlock:^(CXTableViewItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [indexPaths addObject:obj.indexPath];
    }];
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}

- (void)deleteDisplayedItem:(CXTableViewItem *)item {
    NSCParameterAssert(item.indexPath);
    
    UITableView *tableView = [self valueForKey:@"tableView"];
    [tableView deleteRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)showItemsForSections:(NSArray<CXTableViewSection *> *)sections shouldShow:(BOOL)shouldShow {
    [sections enumerateObjectsUsingBlock:^(CXTableViewSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.items enumerateObjectsUsingBlock:^(CXTableViewItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([item conformsToProtocol:@protocol(CXCellShowProtocol)] &&
                ![(id <CXCellShowProtocol>)item shouldShow]) {
                item.shouldShow = shouldShow;
            }
        }];
    }];
}

- (void)showItems:(NSArray<CXTableViewItem *> *)items shouldShow:(BOOL)shouldShow {
    [items enumerateObjectsUsingBlock:^(CXTableViewItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([item conformsToProtocol:@protocol(CXCellShowProtocol)] &&
            ![(id <CXCellShowProtocol>)item shouldShow]) {
            item.shouldShow = shouldShow;
        }
    }];
}

@end
