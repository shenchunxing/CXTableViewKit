//
//  CXMessageCell.m
//  CXTableViewManager_Example
//
//  Created by shenchunxing on 2021/9/25.
//  Copyright © 2021 shenchunxing. All rights reserved.
//

#import "CXMessageCell.h"
#import <Masonry/Masonry.h>
#import <CXTableViewKit/CXTableViewKit.h>
#import "CXMessageItem.h"

@interface CXMessageCell ()<CXTableViewCellProtocol>
/* title label */
@property (nonatomic, strong) UILabel *titleLabel;
/* content label */
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation CXMessageCell

- (void)cellDidLoad {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@20);
        make.right.equalTo(self.contentLabel.mas_left);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@20);
        make.trailing.offset(-10);
    }];
    
}

+ (CGFloat)heightForCellWithItem:(CXMessageItem *)item {
    
    return item.height;
}

- (void)configCellWithItem:(CXMessageItem *)item {
    
    self.titleLabel.text = item.title;
    self.contentLabel.text = item.content;
}

- (UILabel *)titleLabel {
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:15.0];
        _contentLabel.textAlignment = NSTextAlignmentRight;
    }
    return _contentLabel;
}

@end
