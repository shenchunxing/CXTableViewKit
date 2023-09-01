//
//  CXTableViewSection.m
//  CXTableViewKit
//
//  Created by 沈春兴 on 2021/9/25.
//

#import "CXTableViewSection.h"
#import "CXTableViewItem.h"

@interface CXTableViewSection ()

/* 可变items数组 */
@property (nonatomic, strong) NSMutableArray *mutableItems;

@end

@implementation CXTableViewSection

#pragma mark - 初始化方法
+ (instancetype)section {
    
    CXTableViewSection *section = [[self alloc] init];
    return section;
}

#pragma mark - item
- (NSArray<CXTableViewItem *> *)items {
    return [self.mutableItems copy];
}

#pragma mark - item处理方法
- (void)addItem:(CXTableViewItem *)item {
    [self.mutableItems addObject:item];
}

- (void)addItems:(NSArray<CXTableViewItem *> *)items {
    [self.mutableItems addObjectsFromArray:items];
}

- (void)insertItem:(CXTableViewItem *)item atIndex:(NSUInteger)index {
    
    [self.mutableItems insertObject:item atIndex:index];
}

- (void)insertItem:(CXTableViewItem *)item aboveItem:(CXTableViewItem *)baseItem {
    
    NSAssert([self.mutableItems containsObject:baseItem], @"baseItem is't in this section");
    if ([self.mutableItems containsObject:baseItem]) {
        NSInteger index = [self.mutableItems indexOfObject:baseItem];
        [self.mutableItems insertObject:item atIndex:index];
    }
}

- (void)insertItem:(CXTableViewItem *)item belowItem:(CXTableViewItem *)baseItem {
    
    NSAssert([self.mutableItems containsObject:baseItem], @"baseItem is't in this section");
    if ([self.mutableItems containsObject:baseItem]) {
        NSInteger index = [self.mutableItems indexOfObject:baseItem];
        [self.mutableItems insertObject:item atIndex:index+1];
    }
}

- (void)insertItems:(NSArray<CXTableViewItem *> *)items atIndexes:(NSIndexSet *)indexes {
    
    [self.mutableItems insertObjects:items atIndexes:indexes];
}

- (void)removeItem:(CXTableViewItem *)item {
    [self.mutableItems removeObject:item];
}

- (void)removeItemAtIndex:(NSUInteger)index {
    [self.mutableItems removeObjectAtIndex:index];
}

- (void)removeLastItem {
    
    [self.mutableItems removeLastObject];
}

- (void)removeAllItems {
    [self.mutableItems removeAllObjects];
}


#pragma mark - getter
- (NSMutableArray *)mutableItems {
    
    if (_mutableItems == nil) {
        _mutableItems = [[NSMutableArray alloc] init];
        
    }
    return _mutableItems;
}



- (NSMutableArray<CXTableViewItem *> *)shouldShowItems{
    if (!_shouldShowItems) {
        _shouldShowItems  = [NSMutableArray arrayWithArray:self.items];
    }
    return _shouldShowItems;
}

- (void)removeItemsForGroupKey:(NSString *)groupKey {
    NSMutableArray *items = [self.mutableItems mutableCopy];
    for (CXTableViewItem *item in self.mutableItems) {
        if ([item.groupKey isEqualToString:groupKey]) {
            [items removeObject:item];
        }
    }
    
    self.mutableItems = items;
}

@end

