//
//  PopoverBackgroundView.m
//  CustomPopover
//
//  Created by Aaron Crabtree on 3/25/13.
//  Copyright (c) 2013 Tap Dezign. All rights reserved.
//

#import "TPPopoverBackgroundView.h"
#define kArrowBase 20.0f
#define kArrowHeight 10.0f
#define kBorderInset 0.0f
#define kOffset 15.0f

@interface TPPopoverBackgroundView() <UIPopoverBackgroundViewMethods>
@property (nonatomic, strong) UIImageView *arrowImageView;
- (UIImage *)drawArrowImage:(CGSize)size;
@end


@implementation TPPopoverBackgroundView

@synthesize arrowDirection  = _arrowDirection;
@synthesize arrowOffset     = _arrowOffset;

#pragma mark - Graphics Methods
- (UIImage *)drawArrowImage:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] setFill];
    CGContextFillRect(ctx, CGRectMake(0.0f, 0.0f, size.width, size.height));
    
    CGMutablePathRef arrowPath = CGPathCreateMutable();
    CGPathMoveToPoint(arrowPath, NULL, (size.width/2.0f), 0.0f); //Top Center
    CGPathAddLineToPoint(arrowPath, NULL, size.width, size.height); //Bottom Right
    CGPathAddLineToPoint(arrowPath, NULL, 0.0f, size.height); //Bottom Right
    CGPathCloseSubpath(arrowPath);
    CGContextAddPath(ctx, arrowPath);
    CGPathRelease(arrowPath);
    
    UIColor *fillColor = [UIColor whiteColor];
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFill);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}


#pragma mark - UIPopoverBackgroundView Overrides
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        //TODO: update with border image view
        UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.arrowImageView = arrowImageView;
//        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        
        [self addSubview:self.arrowImageView];
        
    }
    return self;
}

+ (CGFloat)arrowBase {
    return kArrowBase;
}

+ (CGFloat)arrowHeight {
    return kArrowHeight;
}

+ (UIEdgeInsets)contentViewInsets {
    return UIEdgeInsetsMake(kOffset, kBorderInset, kBorderInset, kBorderInset);
}

+ (BOOL)wantsDefaultContentAppearance {
    return NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //TODO: test for arrow UIPopoverArrowDirection
    CGSize arrowSize = CGSizeMake([[self class] arrowBase], [[self class] arrowHeight]);
    self.arrowImageView.image = [self drawArrowImage:arrowSize];
    
    self.arrowImageView.frame = CGRectMake(((self.bounds.size.width - arrowSize.width) - 8), kOffset, arrowSize.width, arrowSize.height);
}

@end
