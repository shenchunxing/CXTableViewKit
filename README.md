# CXTableViewKit

TableView表单管理库

## Example

###创建`CXTableViewItem`的子类，如`CXMessageItem`<br>
```
@interface CXMessageItem : CXTableViewItem

/* title */
@property (nonatomic, copy) NSString *title;
/* content */
@property (nonatomic, copy) NSString *content;
/* height */
@property (nonatomic, assign) CGFloat height;


@end

```
###创建`UITableViewCell`子类，如`CXMessageCell`<br>
```
@interface CXMessageCell : UITableViewCell<CXTableViewCellProtocol>
/* title label */
@property (nonatomic, strong) UILabel *titleLabel;
/* content label */
@property (nonatomic, strong) UILabel *contentLabel;
@end
```

###`UITableViewCell`中必须实现一下协议方法：<br>
```
/* 只调用一次，一般书写布局代码 */
- (void)cellDidLoad;

/* cell高度 */
+ (CGFloat)heightForCellWithItem:(CXTableViewItem *)item;

/* 绑定cell的UI */
- (void)configCellWithItem:(CXTableViewItem *)item;

```

###`UIViewController`中使用方式：<br>

```
//需要导入头文件
#import <CXTableViewKit/CXTableViewKit.h>


/* TableView用于展示页面UI */
@property (nonatomic, strong) UITableView *tableView;

/* 用于管理组，刷新UI */
@property (nonatomic, strong) CXTableViewManager *manager;

/* 用于管理Items */
@property (nonatomic, strong) CXTableViewSection *section;

```

###`CXTableViewManager`初始化方法：<br>
```
- (CXTableViewManager *)manager {

    if (_manager == nil) {
        _manager = [[CXTableViewManager alloc] initWithTableView:self.tableView];
        //批量添加组，
        [_manager addManagerSections:@[self.section,self.section2]];
        //批量注册cell
        [_manager registerItems:@[S(CXMessageItem)]];
        //vc中需要使用UIScrollViewDelegate代理方法时，进行设置
        _manager.managerDelegate = self;
    }
    return _manager;
}
```

###`CXTableViewSection`初始化方法：<br>
```
- (CXTableViewSection *)section {

    if (_section == nil) {
        _section = [CXTableViewSection section];
    }
    return _section;
}
```

## Requirements

###`CXTableViewManager`功能说明：<br>
初始化方法<br>
```
- (instancetype)initWithTableView:(UITableView *)tableView;
```
其他功能api查看`CXTableViewManager.h`和`CXTableViewManager+Helper.h`

###`CXTableViewSection`功能说明：<br>
初始化方法<br>
```
+ (instancetype)section;
```
其他功能api查看`CXTableViewSection.h`

###`CXTableViewItem`功能说明：<br>
初始化方法<br>
```
+ (instancetype)item;
```
其他功能api查看`CXTableViewItem.h`

注意：所有Item的父类

## Installation


```ruby
pod 'CXTableViewKit'
```

## Author

shenchunxing, 519045026@qq.com

## License

CXTableViewKit is available under the MIT license. See the LICENSE file for more info.