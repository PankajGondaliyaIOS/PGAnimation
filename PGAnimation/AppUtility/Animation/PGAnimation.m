//
//  PGAnimation.m
//  Animations
//
//  Created by Pankaj on 03/12/15.
//  Copyright © 2015 Pankaj Gondaliya. All rights reserved.
//
// You can contact me on : https://www.facebook.com/pankaj.gondaliya.16

#import "PGAnimation.h"

@implementation PGAnimation


// Bounce

+(void)AnimateZoomBounce:(UIView *)view_ {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];

    view_.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [UIView animateWithDuration:0.3/1.5 animations:^{
        view_.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            view_.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                view_.transform = CGAffineTransformIdentity;
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
            }];
        }];
    }];
}

// Shake

+(CAKeyframeAnimation *)AnimateShake {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
    return animation;
}

// Spin

+(CABasicAnimation *)AnimateSpin :(int) nSpinCount animationDuration:(float)nDuration{
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    animation.duration = nDuration;
    animation.repeatCount = nSpinCount;
    return animation;
}

// Flip

+(CATransition *)AnimateFlip :(int) nFlipCount animationDuration:(float)nDuration {
    CATransition* transition = [CATransition animation];
    transition.startProgress = 0;
    transition.endProgress = 1.0;
    transition.type = @"flip";
    transition.subtype = @"fromRight";
    transition.duration = nDuration;
    transition.repeatCount = nFlipCount;//500000000000 to countinous flip
    transition.delegate = self;
    return transition;
}

//springRotation

+(CASpringAnimation*)AnimateSpringRotation:(int) nRotationCount animationDuration:(float)nDuration  {
    CASpringAnimation* springRotation = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    springRotation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/];
    springRotation.duration = 2.0f;
    springRotation.cumulative = YES;
    springRotation.repeatCount = 1;
    springRotation.damping = 8;
    return springRotation;
}

// Fade

+(CATransition *) AnimateFade :(float)nDuration {
    CATransition *animation = [CATransition animation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionFade;
    animation.duration = nDuration;
    return animation;
}

//Animate From Right

+(CATransition *)AnimateFromRight : (float)nDuration {
    CATransition *transition = [CATransition animation];
    transition.duration = nDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype =kCATransitionFromRight;
    transition.delegate = self;
    return transition;
}

//Animate from Left

+(CATransition *)AnimateFromLeft : (float)nDuration {
    CATransition *transition = [CATransition animation];
    transition.duration = nDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype =kCATransitionFromLeft;
    transition.delegate = self;
    return transition;
}

//Animate from Top

+(CATransition *)AnimateFromTop : (float)nDuration {
    CATransition *transition = [CATransition animation];
    transition.duration = nDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype =kCATransitionFromBottom;
    transition.delegate = self;
    return transition;
}

//Animate from Bottom

+(CATransition *)AnimateFromBottom : (float)nDuration {
    CATransition *transition = [CATransition animation];
    transition.duration = nDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype =kCATransitionFromTop;
    transition.delegate = self;
    return transition;
}

//Animate Zoom

+(CABasicAnimation *)AnimateBounce :(int) nZoomCount noomDuration:(float)nDuration{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = nDuration;
    animation.repeatCount = nZoomCount;
    animation.autoreverses = YES;
    animation.removedOnCompletion = YES;
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)];
    return animation;
}

// Animate from zero rect

+(void)AnimateFromZeroRect :(UIView*)view animationDuration:(float)nDuration {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    view.transform = CGAffineTransformMakeScale(0, 0);;
    [UIView animateWithDuration:nDuration animations:^{
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }];
}

// Animate from Centre of view with zero rect 

+(void)AnimateFromCentreWithZeroRect :(UIView*)view nAnimationDuration:(float)nDuration {
    CGRect frameCentre = view.frame;
    frameCentre.origin.x = (APP_DELEGATE.window.frame.size.width/2) - (frameCentre.size.width/2);
    frameCentre.origin.y = (APP_DELEGATE.window.frame.size.height/2) - (frameCentre.size.height/2);
    view.frame = frameCentre;
    [self AnimateFromZeroRect:view animationDuration:nDuration];
}

// Animate View to zero rect
+(void)AnimateToZeroRect :(UIView*)view nAnimationDuration:(float)nDuration {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake((APP_DELEGATE.window.frame.size.width/2),
                                (APP_DELEGATE.window.frame.size.height/2),
                                0,
                                0);
    } completion:^(BOOL finished) {
        view.frame = oldFrame;
        view.hidden = YES;
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Top to Centre With Rect

+(void)AnimateTopToCentreWithRect :(UIView*)view Duration:(float) nDuration{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    view.frame = CGRectMake(view.frame.origin.x,
                            -view.superview.frame.size.height,
                            view.frame.size.width,
                            view.frame.size.height);
    [UIView animateWithDuration:nDuration animations:^{
        view.center = view.superview.center;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Centre to Bottom With Rect ONLY FOR ONE ORIENTATION OR WITHOUT AUTOLAYOUT
+(void)AnimateCentreToBottomWithRect :(UIView*)view Duration:(float) nDuration {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(view.frame.origin.x,
                                APP_DELEGATE.window.frame.size.height + view.frame.size.height,
                                view.frame.size.width,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        view.hidden = YES;
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Top to Centre With Rect 
+(void)AnimateBottomToCentreWithRect :(UIView*)view Duration:(float) nDuration {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    view.frame = CGRectMake(view.frame.origin.x,
                            APP_DELEGATE.window.frame.size.height + view.frame.size.height,
                            view.frame.size.width,
                            view.frame.size.height);
    [UIView animateWithDuration:nDuration animations:^{
        view.center = view.superview.center;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];}

// Animate Centre to TOP With Rect

+(void)AnimateCentreToTopWithRect :(UIView*)view Duration:(float) nDuration {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(view.frame.origin.x,
                                -view.frame.origin.y - view.frame.size.height,
                                view.frame.size.width,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        view.hidden = YES;
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

+(void)AnimateBottomToCentreWithRectWithBlock:(UIView*)view block:(void (^)(NSDictionary *, NSError *))block {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    view.frame = CGRectMake(view.frame.origin.x,
                            APP_DELEGATE.window.frame.size.height + view.frame.size.height,
                            view.frame.size.width,
                            view.frame.size.height);
    
    [UIView animateWithDuration:0.7 animations:^{
        view.center = view.superview.center;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        block(nil, nil);
    }];
}

// Animate Left to Centre With Rect
+(void)AnimateLeftToCentreWithRect :(UIView*)view Duration:(float) nDuration{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    view.frame = CGRectMake(-APP_DELEGATE.window.frame.size.width - view.frame.size.width,
                            view.frame.origin.y,
                            view.frame.size.width,
                            view.frame.size.height);
    [UIView animateWithDuration:nDuration animations:^{
        view.center = view.superview.center;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Centre to Right With Rect
+(void)AnimateCentreToRightWithRect :(UIView*)view Duration:(float) nDuration{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(+APP_DELEGATE.window.frame.size.width + view.frame.size.width,
                                view.frame.origin.y,
                                view.frame.size.width,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Right to Centre With Rect
+(void)AnimateRightToCentreWithRect :(UIView*)view Duration:(float) nDuration{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    view.frame = CGRectMake(+APP_DELEGATE.window.frame.size.width + view.frame.size.width,
                            view.frame.origin.y,
                            view.frame.size.width,
                            view.frame.size.height);
    [UIView animateWithDuration:nDuration animations:^{
        view.center = view.superview.center;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Centre to Left With Rect
+(void)AnimateCentreToLeftWithRect :(UIView*)view Duration:(float) nDuration{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(-APP_DELEGATE.window.frame.size.width - view.frame.size.width,
                                view.frame.origin.y,
                                view.frame.size.width,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// View Color spread animation
+(void)AnimateViewFillWithColor :(UIView*)view Duration:(float)nDuration {
    //    view.hidden = NO;
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    CGAffineTransform Oldtransform = view.transform;
    [UIView animateWithDuration:nDuration animations:^{
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 10, 10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:nDuration animations:^{
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        } completion:^(BOOL finished) {
            view.transform = Oldtransform;
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }];
}

// Animate X of view
+(void)AnimateXOfView :(UIView*)view Duration:(float) nDuration newX:(float)nXPosition {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(nXPosition,
                                view.frame.origin.y,
                                view.frame.size.width,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Y of view
+(void)AnimateYOfView :(UIView*)view Duration:(float) nDuration newY:(float)nYPosition {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(view.frame.origin.x,
                                nYPosition,
                                view.frame.size.width,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Width of view
+(void)AnimateWidthOfView :(UIView*)view Duration:(float) nDuration newWidth:(float)nNewWidth {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(view.frame.origin.x,
                                view.frame.origin.y,
                                nNewWidth,
                                view.frame.size.height);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Height of view
+(void)AnimateHeightOfView :(UIView*)view Duration:(float) nDuration newHeight:(float)nNewHeight {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(view.frame.origin.x,
                                view.frame.origin.y,
                                view.frame.size.width,
                                nNewHeight);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Top left to center

+(void)AnimateTopLeftCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = YES;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(0,
                                0,
                                0,
                                0);
    } completion:^(BOOL finished) {
        view.hidden = NO;
        [UIView animateWithDuration:nDuration animations:^{
            view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width/2-oldFrame.size.width/2,
                                    APP_DELEGATE.window.frame.size.height/2-oldFrame.size.height/2,
                                    oldFrame.size.width,
                                    oldFrame.size.height);
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }];
}

// Animate Top Right to center

+(void)AnimateTopRightCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = YES;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width,
                                0,
                                0,
                                0);
    } completion:^(BOOL finished) {
        view.hidden = NO;
        [UIView animateWithDuration:nDuration animations:^{
            view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width/2-oldFrame.size.width/2,
                                    APP_DELEGATE.window.frame.size.height/2-oldFrame.size.height/2,
                                    oldFrame.size.width,
                                    oldFrame.size.height);
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }];
}

// Animate Bottom left to center

+(void)AnimateBottomLeftCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = YES;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(0,
                                APP_DELEGATE.window.frame.size.height,
                                0,
                                0);
    } completion:^(BOOL finished) {
        view.hidden = NO;
        [UIView animateWithDuration:nDuration animations:^{
            view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width/2-oldFrame.size.width/2,
                                    APP_DELEGATE.window.frame.size.height/2-oldFrame.size.height/2,
                                    oldFrame.size.width,
                                    oldFrame.size.height);
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }];
}

// Animate Bottom right to center

+(void)AnimateBottomRightCornerToCentreWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = YES;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width,
                                APP_DELEGATE.window.frame.size.height,
                                0,
                                0);
    } completion:^(BOOL finished) {
        view.hidden = NO;
        [UIView animateWithDuration:nDuration animations:^{
            view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width/2-oldFrame.size.width/2,
                                    APP_DELEGATE.window.frame.size.height/2-oldFrame.size.height/2,
                                    oldFrame.size.width,
                                    oldFrame.size.height);
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }];
}

// Animate Centre to right bottom corner

+(void)AnimateCentreToRightBottomCornerWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = NO;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width, APP_DELEGATE.window.frame.size.height,                                    oldFrame.size.width,
                                oldFrame.size.height);
    } completion:^(BOOL finished) {
        view.hidden = YES;
        view.frame = oldFrame; // Setting it to its old frame
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Centre to left bottom corner

+(void)AnimateCentreToLeftBottomCornerWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = NO;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(0-oldFrame.size.width, APP_DELEGATE.window.frame.size.height,                                    oldFrame.size.width,
                                oldFrame.size.height);
    } completion:^(BOOL finished) {
        view.hidden = YES;
        view.frame = oldFrame; // Setting it to its old frame
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Centre to right top corner

+(void)AnimateCentreToRightTopCornerWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = NO;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(APP_DELEGATE.window.frame.size.width, 0-oldFrame.size.height,                                    oldFrame.size.width,
                                oldFrame.size.height);
    } completion:^(BOOL finished) {
        view.hidden = YES;
        view.frame = oldFrame; // Setting it to its old frame
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Centre to left top corner

+(void)AnimateCentreToLeftTopCornerWithRect :(UIView*)view Duration:(float) nDuration  {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    CGRect oldFrame = view.frame;
    view.hidden = NO;
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = CGRectMake(0-oldFrame.size.width, 0-oldFrame.size.height,                                    oldFrame.size.width,
                                oldFrame.size.height);
    } completion:^(BOOL finished) {
        view.hidden = YES;
        view.frame = oldFrame; // Setting it to its old frame
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Whole RECT/FRAME ****

+(void)AnimateWholeFrame:(CGRect)frame view:(UIView *)view Duration:(float)nDuration {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    [UIView animateWithDuration:nDuration animations:^{
        view.frame = frame;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

// Animate Blink ****

+(void)AnimateBlink:(int)nMustBeOne nMaxBlink:(int)nMaxBlinkCount Duration:(float)nDuration view:(UIView *)view {
    nMustBeOne = nMustBeOne+1;
    [UIView animateWithDuration:nDuration animations:^{
        [view setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [self BlinkHelper :nMustBeOne nMaxBlink:nMaxBlinkCount Duration:nDuration view:view];
    }];
}

+(void)BlinkHelper:(int)nMustBeOne nMaxBlink:(int)nMaxBlinkCount Duration:(float)nDuration view:(UIView*)view {
    [UIView animateWithDuration:nDuration animations:^{
        [view setAlpha:1.0f];
    } completion:^(BOOL finished) {
        if (nMaxBlinkCount >nMustBeOne) {
            [self AnimateBlink:nMustBeOne nMaxBlink:nMaxBlinkCount Duration:nDuration view:view];
        }
    }];
}

#pragma mark Navigation Animation Methods

// Animate PushViewController with Present Effect ****

+(void)AnimatePushViewControllerWithPresentEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [fromViewController.navigationController.view.layer addAnimation:[PGAnimation AnimateFromBottom:0.4]                                               forKey:kCATransition];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with Zoom Effect ****

+(void)AnimatePushViewControllerWithZoomEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [fromViewController.navigationController.view.layer addAnimation:[PGAnimation AnimateBounce:1 noomDuration:0]                                               forKey:nil];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with Spin Effect ****

+(void)AnimatePushViewControllerWithSpinEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [fromViewController.navigationController.view.layer addAnimation:[PGAnimation AnimateSpin:1.0 animationDuration:0.4]                                               forKey:nil];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with PresentDown Effect ****

+(void)AnimatePushViewControllerWithPresentDownEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [fromViewController.navigationController.view.layer addAnimation:[PGAnimation AnimateFromTop:0.4] forKey:kCATransition];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with Pop Effect ****

+(void)AnimatePushViewControllerWithPopEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [fromViewController.navigationController.view.layer addAnimation:[PGAnimation AnimateFromLeft:0.4]
                                                              forKey:kCATransition];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with Fade Effect ****

+(void)AnimatePushViewControllerWithFadeEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.4f;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFade;
    [fromViewController.navigationController.view.layer addAnimation:transition
                                                              forKey:kCATransition];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with Spring Effect ****

+(void)AnimatePushViewControllerWithSpringEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [fromViewController.navigationController.view.layer addAnimation:[PGAnimation AnimateSpringRotation:1 animationDuration:0.5]                                                forKey:nil];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
}

// Animate PushViewController with FlipFromRight Effect ****

+(void)AnimatePushViewControllerWithFlipFromRightEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [UIView  beginAnimations: @"Pankaj Gondaliya"context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:fromViewController.navigationController.view cache:NO];
    [UIView commitAnimations];
}

// Animate PushViewController with FlipFromLeftEffect Effect ****

+(void)AnimatePushViewControllerWithFlipFromLeftEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [UIView  beginAnimations: @"Pankaj Gondaliya"context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:fromViewController.navigationController.view cache:NO];
    [UIView commitAnimations];
}

// Animate PushViewController with CurlUpLeft Effect ****

+(void)AnimatePushViewControllerWithCurlUpLeftEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [UIView  beginAnimations: @"Pankaj Gondaliya"context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:fromViewController.navigationController.view cache:NO];
    [UIView commitAnimations];
}

// Animate PushViewController with CurlDown Effect ****

+(void)AnimatePushViewControllerWithTransitionCurlDownEffect:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    [UIView  beginAnimations: @"Pankaj Gondaliya"context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [fromViewController.navigationController pushViewController:toViewController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:fromViewController.navigationController.view cache:NO];
    [UIView commitAnimations];
}

#pragma mark - End Navigation Methods

@end
