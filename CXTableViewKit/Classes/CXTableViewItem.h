//
//  CXTableViewItem.h
//  CXTableViewManager
//
//  Created by shenchunxing on 2021/9/25.
//

#import <Foundation/Foundation.h>

@protocol CXTableViewItemDelegate <NSObject>

@optional

/**
 cell添加圆角

 @param cell cell
 @param indexPath indexPath
 */
- (void)filletedCornersForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@protocol CXCellShowProtocol <NSObject>

@required
/* 是否显示cell */
@property (nonatomic, assign) BOOL shouldShow;

@end

@interface CXTableViewItem : NSObject<CXCellShowProtocol>
/* 是否是组内的最后一项 */
@property (nonatomic, assign) BOOL isLastItemInSection;
/* 是否是组内的第一项 */
@property (nonatomic, assign) BOOL isFirstItemInSection;
@property (nonatomic, strong) NSIndexPath *indexPath;
/* CXTableViewItemDelegate */
@property (nonatomic, weak) id<CXTableViewItemDelegate> tableViewItemDelegate;

@property (nonatomic, copy) void(^selectItemHandler)(NSIndexPath *indexPath);
@property (nonatomic, copy) void(^removeItemHandler)(NSIndexPath *indexPath);

/* 上传给服务端值对应的key，使用CXEditViewHelper生成json时用到 */
@property (nonatomic, strong) NSString *requestKey;

/* cell对应的值，一般和textValue相等，但是对于picker类型的，则对应其选中的值，CXEditViewHelper中用到 */
@property (nonatomic, strong) id requestValue;
/* 首次设置requestValue时的值，用于校验是否有修改 */
@property (nonatomic, strong) id preValue;

/* 有时候cell选中的值不是要上传的格式，可以通过这个转换成服务端需要的格式，CXEditViewHelper中用到 */
@property (nonatomic, copy) id (^mapRequestBlock)(id requestValue);

/* cell最大宽度，和tableview宽度一致,自动获取 */
@property (nonatomic, assign) CGFloat maxWidth;

@property (nonatomic,assign) BOOL hasSpaceing;
///区别于其他同section的item，方便批量删除 or 批量添加
@property (nonatomic, copy) NSString *groupKey;
/// 是否隐藏
@property (nonatomic, assign) BOOL  hidden;

+ (instancetype)item;

@end


