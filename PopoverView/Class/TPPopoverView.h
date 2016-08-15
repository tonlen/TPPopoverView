//
//  CXPopoverView.h
//  ChangNet
//
//  Created by HZ on 16/6/2.
//  Copyright © 2016年 SCHH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPPopoverBackgroundView.h"
@class TPPopoverView;
@protocol TPPopoverViewDelegate <NSObject>
@required
- (void)popoverView:(TPPopoverView *)popoverView didSelectRowAtIndex:(NSInteger)index;
@end

@interface TPPopoverView : UITableViewController
@property (nonatomic, assign) id<TPPopoverViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end
