//
//  CXTableViewSection.h
//  CXTableViewKit
//
//  Created by 沈春兴 on 2021/9/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXTableViewItem;
@interface CXTableViewSection : NSObject

/* item */
@property (nonatomic, copy, readonly) NSArray<CXTableViewItem *> *items;

/* headerView */
@property (nonatomic, strong) UIView *headerView;
/* height for headerView */
@property (nonatomic, assign) CGFloat headerHeight;
/* height for footerView */
@property (nonatomic, assign) CGFloat footerHeight;
/* footerView */
@property (nonatomic, strong) UIView *footerView;
/* 是否需要圆角 */
@property (nonatomic, assign) BOOL needFillet;

@property (nonatomic,assign) NSInteger sectionIndex;

@property (nonatomic,assign) NSInteger tag;
/// 是否是最后一个section
@property (nonatomic, assign) BOOL  isLastSectionInManager;

//显示的items，可能有部分是隐藏的，默认全部显示
@property (nonatomic,strong) NSMutableArray <CXTableViewItem *> *shouldShowItems;

@property (nonatomic,copy) NSString *sectionTitle;


+ (instancetype)section;

/**
 添加单个item

 @param item CXTableViewItem子类
 */
- (void)addItem:(CXTableViewItem *)item;

/**
 批量添加item

 @param items CXTableViewItem子类集合
 */
- (void)addItems:(NSArray<CXTableViewItem *> *)items;

/**
 指定位置插入item

 @param item CXTableViewItem子类
 @param index 指定位置
 */
- (void)insertItem:(CXTableViewItem *)item atIndex:(NSUInteger)index;

/**
 指定item前插入

 @param item CXTableViewItem子类
 @param baseItem 指定item
 */
- (void)insertItem:(CXTableViewItem *)item aboveItem:(CXTableViewItem *)baseItem;

/**
 指定item后插入

 @param item CXTableViewItem子类
 @param baseItem 指定item
 */
- (void)insertItem:(CXTableViewItem *)item belowItem:(CXTableViewItem *)baseItem;

/**
 批量插入item

 @param items CXTableViewItem子类集合
 @param indexes 位置集合
 */
- (void)insertItems:(NSArray *)items atIndexes:(NSIndexSet *)indexes;

/**
 移除指定item

 @param item CXTableViewItem子类
 */
- (void)removeItem:(CXTableViewItem *)item;

/**
 移除指定位置item

 @param index index
 */
- (void)removeItemAtIndex:(NSUInteger)index;

/**
 移除最后一个item
 */
- (void)removeLastItem;

/**
 移除所有item
 */
- (void)removeAllItems;

/// 移除items
/// @param groupKey  groupKey
- (void)removeItemsForGroupKey:(NSString *)groupKey;

@end

NS_ASSUME_NONNULL_END

