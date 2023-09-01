//
//  CXTableViewItem.m
//  CXTableViewManager
//
//  Created by shenchunxing on 2021/9/25.
//

#import "CXTableViewItem.h"

@interface CXTableViewItem ()
/* 默认YES */
@property (nonatomic, assign) BOOL isFirstSetValue;
@end

@implementation CXTableViewItem
@synthesize shouldShow;

+ (instancetype)item {

    CXTableViewItem *item = [[self alloc] init];
    return item;
}

- (instancetype)init {
    if (self = [super init]) {
        self.isFirstSetValue = YES;
        self.shouldShow = YES;
    }
    return self;
}

- (void)setRequestValue:(id)requestValue {
    
    _requestValue = requestValue;
    if (self.isFirstSetValue) {
        self.preValue = requestValue;
        self.isFirstSetValue = NO;
    }
}

- (void)setMaxWidth:(CGFloat)maxWidth {
    _maxWidth = maxWidth;
}

@end
