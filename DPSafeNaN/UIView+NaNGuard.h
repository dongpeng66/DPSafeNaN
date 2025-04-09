//
//  UIView+NaNGuard.h
//  DPNaNGuard
//
//  Created by BJSTTLP185 on 2025/4/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NaNGuard)
#pragma mark - Origin
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

#pragma mark - Size
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

#pragma mark - Center
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

#pragma mark - Coords
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

#pragma mark - Max
@property (nonatomic, assign, readonly) CGFloat maxX;
@property (nonatomic, assign, readonly) CGFloat maxY;

#pragma mark - safe
- (void)safe_setFrame:(CGRect)frame;
- (void)safe_setOrigin:(CGPoint)origin defaultOrigin:(CGPoint)defaultOrigin;
- (void)safe_setX:(CGFloat)x defaultX:(CGFloat)defaultX;
- (void)safe_setY:(CGFloat)y defaultY:(CGFloat)defaultY;
- (void)safe_setSize:(CGSize)size defaultSize:(CGSize)defaultSize;
- (void)safe_setWidth:(CGFloat)width defaultWidth:(CGFloat)defaultWidth;
- (void)safe_setHeight:(CGFloat)height defaultHeight:(CGFloat)defaultHeight;
- (void)safe_setCenterX:(CGFloat)centerX defaultCenterX:(CGFloat)defaultCenterX;
- (void)safe_setCenterY:(CGFloat)centerY defaultCenterY:(CGFloat)defaultCenterY;
- (void)safe_setTop:(CGFloat)top defaultTop:(CGFloat)defaultTop;
- (void)safe_setBottom:(CGFloat)bottom defaultBottom:(CGFloat)defaultBottom;
- (void)safe_setLeft:(CGFloat)left defaultLeft:(CGFloat)defaultLeft;
- (void)safe_setRight:(CGFloat)right defaultRight:(CGFloat)defaultRight;
@end

NS_ASSUME_NONNULL_END
