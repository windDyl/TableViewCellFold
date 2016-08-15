//
//  ViewController.m
//  TableViewCellFold
//
//  Created by Ethank on 16/2/18.
//  Copyright © 2016年 Ldy. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tabView;
}

@property (nonatomic, strong)NSArray *foldArray;
@property (nonatomic, strong)NSMutableArray *flagArray;
@end

@implementation ViewController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT-20) style:UITableViewStylePlain];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    _tabView.estimatedRowHeight = 60;
    _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabView];
}

#pragma mark - NetWorking

- (void)loadData {
    _foldArray = @[
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行用UITableView",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行用UITableView",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行用UITableView",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行",
                   @"利用UITableView来实现下拉菜单（可扩展列表）的效果。点击列表某一行，会下拉显示更多行利用UITableView来实现下拉列表（可扩展列表）的效果。下拉列表即支持列表每一行的展开与收起功能。点击列表某一行，会下拉显示更多行，再点击一次，即收起下面的所有行"
                   ];
    _flagArray = [NSMutableArray array];
    for (int i = 0; i < _foldArray.count; i++) {
        [_flagArray addObject:@"0"];
    }
}

#pragma mark - Public Methods

- (void)handleSelectedCell:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if ([_flagArray[indexPath.row] isEqualToString:@"0"]) {
            [_flagArray replaceObjectAtIndex:indexPath.row withObject:@"1"];
        } else {
            [_flagArray replaceObjectAtIndex:indexPath.row withObject:@"0"];
        }
        [_tabView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Action Methods

- (void)didSelectedFoldBtn:(UIButton *)btn {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    [self handleSelectedCell:indexPath];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _foldArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.contentFlag = _flagArray[indexPath.row];
    cell.contentStr = _foldArray[indexPath.row];
    cell.foldBtn.tag = indexPath.row;
    [cell.foldBtn addTarget:self action:@selector(didSelectedFoldBtn:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self handleSelectedCell:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if ([_flagArray[indexPath.row] isEqualToString:@"0"]) {
            return 44.0f;
        } else {
            return [MyTableViewCell cellHeightWith:_foldArray[indexPath.row]];
        }
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
