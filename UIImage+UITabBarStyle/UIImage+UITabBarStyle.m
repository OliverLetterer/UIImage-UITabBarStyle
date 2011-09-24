//
//  UIImage+UITabBarStyle.m
//  UIImageUITabBarStyleSampleApplication
//
//  Created by Oliver Letterer on 24.09.11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "UIImage+UITabBarStyle.h"

/**
 UIImage (UITabBarStyle_Private) interface
 */
@interface UIImage (UITabBarStyle_Private)

/**
 @abstract will return an UIImage for an unselected tabBarItem
 @return UIImage with gradient from [UIColor grayColor] to [UIColor darkGrayColor]
 */
+ (UIImage *)tabBarStyledOverlayImageWithSize:(CGSize)size;

/**
 @abstract will return an UIImage for a selected tabBarItem
 @return UIImage with centered UITabBarItemGradient.png
 */
+ (UIImage *)tabBarStyledOverlaySelectedImageWithSize:(CGSize)size;

/**
 @return new UIImage with white color where self is transparent and black where its not
 */
@property (nonatomic, readonly) UIImage *tabBarStyledImageMask;

@end



/**
 UIImage (UITabBarStyle_Private) implementation
 */
@implementation UIImage (UITabBarStyle_Private)

+ (UIImage *)tabBarStyledOverlayImageWithSize:(CGSize)size {
    // begin a new image context
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw gradient from top to bottom in gray to bottom in dark gray color
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    NSArray *colors = [NSArray arrayWithObjects:
                       (__bridge id)[UIColor grayColor].CGColor,
                       (__bridge id)[UIColor darkGrayColor].CGColor,
                       nil];
    CGFloat locations[] = {0.0f, 1.0f};
    CGGradientRef colorGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGPoint startPoint = CGPointMake(0.0f, 0.0f);
    CGPoint endPoint = CGPointMake(0.0f, size.height);
    CGContextDrawLinearGradient(context, colorGradient, startPoint, endPoint,0);
    
    // cleanup
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(colorGradient);
    
    // get final image
    UIImage* finalBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalBackgroundImage;
}

+ (UIImage *)tabBarStyledOverlaySelectedImageWithSize:(CGSize)size {
    // begin new image context
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    // get the gradient image
    UIImage *gradientImage = [UIImage imageNamed:@"UITabBarItemGradient.png"];
    
    // draw the image centered
    CGRect centeredFrame = CGRectMake((size.width - gradientImage.size.width)/2.0f, (size.height - gradientImage.size.height)/2.0f, gradientImage.size.width, gradientImage.size.height);
    [gradientImage drawInRect:centeredFrame];
    
    // get image from context
    UIImage* finalGradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalGradientImage;
}

- (UIImage *)tabBarStyledImageMask {
    // create image rect from selfs size
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    
    // begin new image context
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    
    // get and setup current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0f, self.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    
    // fill everything white white
    [[UIColor whiteColor] setFill];
    UIRectFill(imageRect);
    
    // clip to self as mask
    CGContextClipToMask(context, imageRect, self.CGImage);
    
    // fill clipped mask with black
    [[UIColor blackColor] setFill];
    UIRectFill(imageRect);
    
    // get image from context
    UIImage* finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
}

@end


/**
 UIImage (UITabBarStyle) implementation
 */
@implementation UIImage (UITabBarStyle)

@end
