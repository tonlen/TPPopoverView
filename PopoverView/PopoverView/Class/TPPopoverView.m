//
//  CXPopoverView.m
//  ChangNet
//
//  Created by HZ on 16/6/2.
//  Copyright © 2016年 SCHH. All rights reserved.
//

#import "TPPopoverView.h"

@implementation TPPopoverView

- (instancetype)init
{
    return [super initWithStyle:UITableViewStylePlain];
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.superview.layer.cornerRadius = 3;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"POPOVERCELL"];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"POPOVERCELL"];
    NSDictionary *listData = self.dataList[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:listData[@"icon"]];
    cell.textLabel.text = listData[@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(popoverView:didSelectRowAtIndex:)]) {
        [self.delegate popoverView:self didSelectRowAtIndex:indexPath.row];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    bg.backgroundColor = [UIColor clearColor];
    return bg;
}

@end
