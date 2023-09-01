//
//  CXTableViewManager.h
//  CXTableViewManager
//
//  Created by 沈春兴 on 2021/9/25.
//

#import <Foundation/Foundation.h>

//用于外部处理tableview代理事件
@protocol CXTableViewManagerDelegate <UIScrollViewDelegate>

@optional
//返回索引数组
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView;

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@class CXTableViewSection,CXTableViewItem;
@interface CXTableViewManager : NSObject

/* 处理tableview代理事件 */
@property (nonatomic, weak) id<CXTableViewManagerDelegate> managerDelegate;

/* 组集合 */
@property (nonatomic, copy, readonly) NSArray<CXTableViewSection *> *sections;

@property (nonatomic,assign) BOOL canEdit;

/**
 初始化方法

 @param tableView tableview
 @return manager
 */
- (instancetype)initWithTableView:(UITableView *)tableView;

/**
 注册单个cell

 @param cellName cell类名
 @param itemName item类名
 */
- (void)registerCell:(NSString *)cellName item:(NSString *)itemName;

/**
 添加单个组

 @param section 组
 */
- (void)addSection:(CXTableViewSection *)section;

/**
 在指定组前插入组

 @param section CXTableViewSection
 @param baseSection 指定sectin
 */
- (void)insertSection:(CXTableViewSection *)section
         aboveSection:(CXTableViewSection *)baseSection;

/**
 在指定组后插入组

 @param section CXTableViewSection
 @param baseSection 指定section
 */
- (void)insertSection:(CXTableViewSection *)section
         belowSection:(CXTableViewSection *)baseSection;

/**
 在指定位置插入组

 @param section CXTableViewSection
 @param index index
 */
- (void)insertSection:(CXTableViewSection *)section atIndex:(NSUInteger)index;

/**
 移除指定位置的组

 @param index index
 */
- (void)removeSectionAtIndex:(NSUInteger)index;

/**
 批量移除组

 @param arry 组集合
 */
- (void)removeSectionWithIteamArry:(NSMutableArray*)arry;

/**
 移除最后一个组
 */
- (void)removeLastSection;

/**
 移除所有组
 */
- (void)removeAllSections;

/**
 移除指定组

 @param section CXTableViewSection
 */
- (void)removeSection:(CXTableViewSection *)section;

/**
 刷新页面
 */
- (void)reloadData;

/**
 刷新指定cell

 @param indexPath cell的indexPath
 */
- (void)reloadCellAtIndexPath:(NSIndexPath *)indexPath;

- (CXTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
