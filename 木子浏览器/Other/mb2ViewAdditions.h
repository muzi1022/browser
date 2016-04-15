#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (mb2Additions)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

- (void)removeAllSubviews;

/**
 * Return the width in portrait or the height in landscape.
 */
//@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
//@property (nonatomic, readonly) CGFloat orientationHeight;

@end
