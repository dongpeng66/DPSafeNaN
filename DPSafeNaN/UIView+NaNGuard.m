//
//  UIView+NaNGuard.m
//  DPNaNGuard
//
//  Created by BJSTTLP185 on 2025/4/9.
//

#import "UIView+NaNGuard.h"
#import <objc/runtime.h>

@implementation UIView (NaNGuard)
#pragma mark - # Origin
- (CGPoint)origin {
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark - # Size
- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - # Center
- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark - # Coords
- (CGFloat)top {
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

#pragma mark - # Max
- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        SEL originalSelector = @selector(setFrame:);
//        SEL swizzledSelector = @selector(swizzled_setFrame:);
//        
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    });
//}
//
//- (void)swizzled_setFrame:(CGRect)frame {
//    // 过滤NaN值，替换为0
//    CGRect validatedFrame = frame;
//            
//    // 过滤 NaN 和非法值
//    if ([self isnanOrinf:validatedFrame.origin.x] || [self isnanOrinf:validatedFrame.origin.y]) {
//        validatedFrame.origin = CGPointZero;
//        NSLog(@"⚠️ 拦截非法 origin: frame :%@",[NSString stringWithFormat:@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height]);
//    }
//    
//    if ([self isnanOrinf:validatedFrame.size.width] || validatedFrame.size.width < 0) {
//        validatedFrame.size.width = 0;
//        NSLog(@"⚠️ 拦截非法 width: frame :%@",[NSString stringWithFormat:@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height]);
//    }
//    if ([self isnanOrinf:validatedFrame.size.height] || validatedFrame.size.height < 0) {
//        validatedFrame.size.height = 0;
//        NSLog(@"⚠️ 拦截非法 height: frame :%@",[NSString stringWithFormat:@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height]);
//    }
//    // 调用原始方法
//    [self swizzled_setFrame:validatedFrame];
//}

- (BOOL)isnanOrinf:(CGFloat)va {
    if (isnan(va) || isinf(va)) {
        return YES;
    }
    return NO;
}
#pragma mark - safe
- (CGFloat)safeValue:(CGFloat)safeValue defaultValue:(CGFloat)defaultValue {
    if ([self isnanOrinf:safeValue] || safeValue < 0) {
        return defaultValue;
    }
    return safeValue;
}
- (void)safe_setFrame:(CGRect)frame {
    // 过滤NaN值，替换为0
    CGRect validatedFrame = frame;
            
    // 过滤 NaN 和非法值
    if ([self isnanOrinf:validatedFrame.origin.x] || [self isnanOrinf:validatedFrame.origin.y]) {
        validatedFrame.origin = CGPointZero;
        NSLog(@"⚠️ 拦截非法 origin: frame :%@",[NSString stringWithFormat:@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height]);
    }
    
    if ([self isnanOrinf:validatedFrame.size.width] || validatedFrame.size.width < 0) {
        validatedFrame.size.width = 0;
        NSLog(@"⚠️ 拦截非法 width: frame :%@",[NSString stringWithFormat:@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height]);
    }
    if ([self isnanOrinf:validatedFrame.size.height] || validatedFrame.size.height < 0) {
        validatedFrame.size.height = 0;
        NSLog(@"⚠️ 拦截非法 height: frame :%@",[NSString stringWithFormat:@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height]);
    }
    self.frame = validatedFrame;
}
- (void)safe_setOrigin:(CGPoint)origin defaultOrigin:(CGPoint)defaultOrigin {
    CGRect frame = self.frame;
    CGPoint safeOrigin = origin;
    safeOrigin.x = [self safeValue:origin.x defaultValue:defaultOrigin.x];
    safeOrigin.y = [self safeValue:origin.y defaultValue:defaultOrigin.y];
    frame.origin = safeOrigin;
    self.frame = frame;
}
- (void)safe_setX:(CGFloat)x defaultX:(CGFloat)defaultX {
    CGRect frame = self.frame;
    frame.origin.x = [self safeValue:x defaultValue:defaultX];
    self.frame = frame;
}
- (void)safe_setY:(CGFloat)y defaultY:(CGFloat)defaultY {
    CGRect frame = self.frame;
    frame.origin.y = [self safeValue:y defaultValue:defaultY];
    self.frame = frame;
}
- (void)safe_setSize:(CGSize)size defaultSize:(CGSize)defaultSize {
    CGRect frame = self.frame;
    CGSize safeSize = size;
    safeSize.width = [self safeValue:size.width defaultValue:defaultSize.width];
    safeSize.height = [self safeValue:size.height defaultValue:defaultSize.height];
    frame.size = safeSize;
    self.frame = frame;
}
- (void)safe_setWidth:(CGFloat)width defaultWidth:(CGFloat)defaultWidth {
    CGRect frame = self.frame;
    frame.size.width = [self safeValue:width defaultValue:defaultWidth];
    self.frame = frame;
}
- (void)safe_setHeight:(CGFloat)height defaultHeight:(CGFloat)defaultHeight {
    CGRect frame = self.frame;
    frame.size.height = [self safeValue:height defaultValue:defaultHeight];
    self.frame = frame;
}
- (void)safe_setCenterX:(CGFloat)centerX defaultCenterX:(CGFloat)defaultCenterX {
    self.center = CGPointMake([self safeValue:centerX defaultValue:defaultCenterX], self.center.y);
}
- (void)safe_setCenterY:(CGFloat)centerY defaultCenterY:(CGFloat)defaultCenterY {
    self.center = CGPointMake(self.center.x, [self safeValue:centerY defaultValue:defaultCenterY]);
}
- (void)safe_setTop:(CGFloat)top defaultTop:(CGFloat)defaultTop {
    CGRect frame = self.frame;
    frame.origin.y = [self safeValue:top defaultValue:defaultTop];
    self.frame = frame;
}
- (void)safe_setBottom:(CGFloat)bottom defaultBottom:(CGFloat)defaultBottom {
    CGRect frame = self.frame;
    frame.origin.y = [self safeValue:bottom defaultValue:defaultBottom] - self.frame.size.height;
    self.frame = frame;
}
- (void)safe_setLeft:(CGFloat)left defaultLeft:(CGFloat)defaultLeft {
    CGRect frame = self.frame;
    frame.origin.x = [self safeValue:left defaultValue:defaultLeft];
    self.frame = frame;
}
- (void)safe_setRight:(CGFloat)right defaultRight:(CGFloat)defaultRight {
    CGRect frame = self.frame;
    frame.origin.x = [self safeValue:right defaultValue:defaultRight] - self.frame.size.width;
    self.frame = frame;
}
@end

