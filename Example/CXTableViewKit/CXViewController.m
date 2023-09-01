//
//  CXViewController.m
//  CXTableViewKit
//
//  Created by shenchunxing on 09/25/2021.
//  Copyright (c) 2021 shenchunxing. All rights reserved.
//

#import "CXViewController.h"
#import <Masonry/Masonry.h>
#import <CXTableViewKit/CXTableViewKit.h>
#import "CXMessageItem.h"

@interface CXViewController ()<CXTableViewManagerDelegate>

/* table */
@property (nonatomic, strong) UITableView *tableView;
/* manager */
@property (nonatomic, strong) CXTableViewManager *manager;
/* section */
@property (nonatomic, strong) CXTableViewSection *section;
/* section */
@property (nonatomic, strong) CXTableViewSection *section2;
/* view */
@property (nonatomic, strong) UIView *customView;
@end

@implementation CXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self configManager];
}

- (void)configManager {
    
    for (NSInteger index = 0; index < 10; index++) {
        CXMessageItem *item = [CXMessageItem item];
        item.title = [NSString stringWithFormat:@"title--%ld",index];
        item.content = [NSString stringWithFormat:@"content--%ld",index];
        [self.section addItem:item];
    }
    for (NSInteger index = 0; index < 10; index++) {
        CXMessageItem *item = [CXMessageItem item];
        item.title = [NSString stringWithFormat:@"title--%ld",index];
        item.content = [NSString stringWithFormat:@"content--%ld",index];
        [self.section2 addItem:item];
    }
    [self.manager reloadData];
    
}


- (UITableView *)tableView {
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    return _tableView;
}

- (CXTableViewManager *)manager {
    
    if (_manager == nil) {
        _manager = [[CXTableViewManager alloc] initWithTableView:self.tableView];
//        [_manager addSection:self.section];
//        [_manager addSection:self.section2];
        [_manager addManagerSections:@[self.section,self.section2]];
        [_manager registerItems:@[S(CXMessageItem)]];
        _manager.managerDelegate = self;
    }
    return _manager;
}

- (CXTableViewSection *)section {
    
    if (_section == nil) {
        _section = [CXTableViewSection section];
        _section.headerView = self.customView;
        _section.headerHeight = 10;
    }
    return _section;
}

- (CXTableViewSection *)section2 {
    
    if (_section2 == nil) {
        _section2 = [CXTableViewSection section];
        _section2.headerView = self.customView;
        _section2.headerHeight = 10;
    }
    return _section2;
}

- (UIView *)customView {
    
    if (_customView == nil) {
        _customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 10)];
        _customView.backgroundColor = [UIColor redColor];
    }
    return _customView;
}

@end

