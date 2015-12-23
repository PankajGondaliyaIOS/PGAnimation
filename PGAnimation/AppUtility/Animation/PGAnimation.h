//
//  PGAnimation.h
//  Animations
//
//  Created by Pankaj on 03/12/15.
//  Copyright © 2015 Pankaj Gondaliya. All rights reserved.
//
// You can contact me on : https://www.facebook.com/pankaj.gondaliya.16

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface PGAnimation : NSObject

/** Animate Zoom Bounce */
+(void)AnimateZoomBounce:(UIView *)view_;

/** Animate Shake */
+(CAKeyframeAnimation *)AnimateShake;

/** Animate Spin */
+(CABasicAnimation *)AnimateSpin :(int) nSpinCount animationDuration:(float)nDuration;

/** Animate Flip */
+(CATransition *)AnimateFlip :(int) nFlipCount animationDuration:(float)nDuration;

/** Animate SpringRotation */
+(CASpringAnimation*)AnimateSpringRotation:(int) nRotationCount animationDuration:(float)nDuration;

/** Animate Fade */
+(CATransition *) AnimateFade :(float)nDuration;

/** Animate from Right */
+(CATransition *)AnimateFromRight : (float)nDuration;

/** Animate from Left */
+(CATransition *)AnimateFromLeft : (float)nDuration;

/** Animate from Top */
+(CATransition *)AnimateFromTop : (float)nDuration;

/** Animate from Bottom */
+(CATransition *)AnimateFromBottom : (float)nDuration;

/** Animate Bounce */
+(CABasicAnimation *)AnimateBounce :(int) nZoomCount noomDuration:(float)nDuration;

/** Animate from zero rect */
+(void)AnimateFromZeroRect :(UIView*)view animationDuration:(float)nDuration;

/** Animate from Centre of view with zero rect */
+(void)AnimateFromCentreWithZeroRect :(UIView*)view nAnimationDuration:(float)nDuration;

/** Animate a view to Zero rect*/
+(void)AnimateToZeroRect :(UIView*)view nAnimationDuration:(float)nDuration;

/** Animate Top to Centre With Rect */
+(void)AnimateTopToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to Bottom With Rect */
+(void)AnimateCentreToBottomWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Bottom to Centre With Rect */
+(void)AnimateBottomToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to TOP With Rect */
+(void)AnimateCentreToTopWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Top to Centre With Rect With Block */
+(void)AnimateBottomToCentreWithRectWithBlock:(UIView*)view block:(void (^)(NSDictionary *dict, NSError *error))block ;

/** Animate Left to Centre With Rect */
+(void)AnimateLeftToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to right With Rect */
+(void)AnimateCentreToRightWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Right to Centre With Rect */
+(void)AnimateRightToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to Left With Rect */
+(void)AnimateCentreToLeftWithRect :(UIView*)view Duration:(float) nDuration;

/** View Color spread animation */
 +(void)AnimateViewFillWithColor :(UIView*)view Duration:(float)nDuration;

/** Animate X of view */
+(void)AnimateXOfView :(UIView*)view Duration:(float) nDuration newX:(float)nXPosition;

/** Animate Y of view */
+(void)AnimateYOfView :(UIView*)view Duration:(float) nDuration newY:(float)nYPosition;

/** Animate Width of view */
+(void)AnimateWidthOfView :(UIView*)view Duration:(float) nDuration newWidth:(float)nNewWidth;

/** Animate Height of view */
+(void)AnimateHeightOfView :(UIView*)view Duration:(float) nDuration newHeight:(float)nNewHeight;

/** Animate Top left to center */
+(void)AnimateTopLeftCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Top Right to center */
+(void)AnimateTopRightCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Bottom left to center */
+(void)AnimateBottomLeftCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Bottom right to center */
+(void)AnimateBottomRightCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to right bottom corner */
+(void)AnimateCentreToRightBottomCornerWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to left bottom corner */
+(void)AnimateCentreToLeftBottomCornerWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to right top corner */
+(void)AnimateCentreToRightTopCornerWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Centre to left top corner */
+(void)AnimateCentreToLeftTopCornerWithRect :(UIView*)view Duration:(float) nDuration;

/** Animate Blink */
+(void)AnimateBlink:(int)nMustBeOne nMaxBlink:(int)nMaxBlinkCount Duration:(float)nDuration view:(UIView *)view;

/** Animate Whole RECT/FRAME */

+(void)AnimateWholeFrame:(CGRect)frame view:(UIView *)view Duration:(float)nDuration ;

#pragma mark Navigation Animation Methods

/** Animate PushViewController with Present Effect */

+(void)AnimatePushViewControllerWithPresentEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with Zoom Effect */

+(void)AnimatePushViewControllerWithZoomEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with Spin Effect */

+(void)AnimatePushViewControllerWithSpinEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with PresentDown Effect */

+(void)AnimatePushViewControllerWithPresentDownEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with Pop Effect */

+(void)AnimatePushViewControllerWithPopEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with Fade Effect */

+(void)AnimatePushViewControllerWithFadeEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with Spring Effect */

+(void)AnimatePushViewControllerWithSpringEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with FlipFromRight Effect */

+(void)AnimatePushViewControllerWithFlipFromRightEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with FlipFromLeftEffect Effect */

+(void)AnimatePushViewControllerWithFlipFromLeftEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with CurlUpLeft Effect */

+(void)AnimatePushViewControllerWithCurlUpLeftEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

/** Animate PushViewController with CurlDown Effect */

+(void)AnimatePushViewControllerWithTransitionCurlDownEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

#pragma mark - End Navigation Methods

@end
