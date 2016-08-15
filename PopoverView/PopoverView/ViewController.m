//
//  ViewController.m
//  PopoverView
//
//  Created by HZ on 16/8/15.
//  Copyright © 2016年 len. All rights reserved.
//

#import "ViewController.h"
#import "TPPopoverView.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate, TPPopoverViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popover:(UIBarButtonItem *)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"PopoverList.plist"];
    NSMutableArray *dataList = [NSMutableArray arrayWithContentsOfFile:path];
    
    
    TPPopoverView *contentController = [[TPPopoverView alloc] init];
    contentController.modalPresentationStyle = UIModalPresentationPopover;
    contentController.preferredContentSize = CGSizeMake(120, 45 * [dataList count]);
    contentController.delegate = self;
    contentController.dataList = dataList;
    
    
    UIPopoverPresentationController *popVC = contentController.popoverPresentationController;
    popVC.delegate = self;
    popVC.barButtonItem = sender;
    popVC.popoverBackgroundViewClass = [TPPopoverBackgroundView class];
    [self presentViewController:contentController animated:YES completion:nil];
}

#pragma mark - UIPopoverPresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

#pragma mark - TPPopoverViewDelegate
- (void)popoverView:(TPPopoverView *)popoverView didSelectRowAtIndex:(NSInteger)index
{
    NSLog(@"%@",@(index));
}
@end
