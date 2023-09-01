//
//  CXMessageItem.h
//  CXTableViewManager_Example
//
//  Created by shenchunxing on 2021/9/25.
//  Copyright © 2021 shenchunxing. All rights reserved.
//

#import <CXTableViewKit/CXTableViewKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXMessageItem : CXTableViewItem

/* title */
@property (nonatomic, copy) NSString *title;
/* content */
@property (nonatomic, copy) NSString *content;
/* height */
@property (nonatomic, assign) CGFloat height;


@end

NS_ASSUME_NONNULL_END
