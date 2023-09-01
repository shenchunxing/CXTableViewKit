//
//  CXTableViewCellProtocol.h
//  CXTableViewKit
//
//  Created by 沈春兴 on 2021/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CXTableViewItem;
@protocol CXTableViewCellProtocol <NSObject>

@required
/**
 cell创建的时候调用，只调用一次，一般做布局操作
 */
- (void)cellDidLoad;

/**
 绑定item

 @param item CXTableViewItem子类
 */
- (void)configCellWithItem:(CXTableViewItem *)item;

/**
 cell高度

 @param item CXTableViewItem子类
 @return cell高度
 */
+ (CGFloat)heightForCellWithItem:(CXTableViewItem *)item;

@optional
/**
 cell 即将展示时执行
 */
- (void)cellWillDisplay;

/**
 cell 已经展示时执行
 */
- (void)cellDidEndDisplay;

@end

NS_ASSUME_NONNULL_END
