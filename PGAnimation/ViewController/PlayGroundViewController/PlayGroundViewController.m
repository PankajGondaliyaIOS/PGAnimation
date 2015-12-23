//
//  PlayGroundViewController.m
//  PGAnimation
//
//  Created by Pankaj on 04/12/15.
//  Copyright © 2015 Pankaj Gondaliya. All rights reserved.
//
// You can contact me on : https://www.facebook.com/pankaj.gondaliya.16

#import "PlayGroundViewController.h"

@interface PlayGroundViewController (){
    IBOutlet UILabel *lblTitle;
    IBOutlet UIView  *viewPlayingObject, *viewHeader;
    PushedViewController *pushedVC;
}

@end

@implementation PlayGroundViewController


@synthesize strAnimation,nType;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initiateView];
}

#pragma mark - View Initiation Methods

-(void)initiateView {
    lblTitle.text = strAnimation;
    pushedVC = [[PushedViewController alloc] init];// This will be used only for push animations.
}

#pragma mark - Action Methods

-(IBAction)btnPerformAnimation:(UIButton *)button {
    if (nType == 0) {
        [PGAnimation AnimateZoomBounce:viewPlayingObject];
    }
    else if (nType == 1) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateShake] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 2) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateSpin:1 animationDuration:0.5] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 3) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateFlip:8.0 animationDuration:0.5] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 4) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateSpringRotation:1.0 animationDuration:0.5] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 5) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateFade:1.0] forKey:@"Pankaj Gondaliya"];
        viewPlayingObject.hidden = !viewPlayingObject.hidden;
    }
    else if (nType == 6) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateFromRight:0.8] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 7) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateFromLeft:0.8] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 8) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateFromTop:0.8] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 9) {
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateFromBottom:0.8] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 10) { // Generally used in like
        [viewPlayingObject.layer addAnimation:[PGAnimation AnimateBounce:2 noomDuration:0.2] forKey:@"Pankaj Gondaliya"];
    }
    else if (nType == 11) {
        [PGAnimation AnimateFromZeroRect:self.view animationDuration:0.5];
    }
    else if (nType == 12) {
        [PGAnimation AnimateFromCentreWithZeroRect:viewHeader nAnimationDuration:0.5];
    }
    else if (nType == 13) {
        [PGAnimation AnimateToZeroRect:viewPlayingObject nAnimationDuration:0.5];
    }
    else if (nType == 14) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateTopToCentreWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 15) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToBottomWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 16) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateBottomToCentreWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 17) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToTopWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 18) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateBottomToCentreWithRectWithBlock:viewPlayingObject block:^(NSDictionary *dict, NSError *error) {
            NSLog(@"Animation is completed");
        }];
    }
    else if (nType == 19) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateLeftToCentreWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 20) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToRightWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 21) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateRightToCentreWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 22) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToLeftWithRect:viewPlayingObject Duration:1.0];
    }
    else if (nType == 23) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateViewFillWithColor:viewPlayingObject Duration:1.0];
    }
    else if (nType == 24) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateXOfView:viewPlayingObject Duration:1.0 newX:viewPlayingObject.frame.origin.x+50];
    }
    else if (nType == 25) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateYOfView:viewPlayingObject Duration:1.0 newY:viewPlayingObject.frame.origin.y+50];
    }
    else if (nType == 26) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateWidthOfView:viewPlayingObject Duration:1.0 newWidth:viewPlayingObject.frame.size.width+50];
    }
    else if (nType == 27) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateHeightOfView:viewPlayingObject Duration:1.0 newHeight:viewPlayingObject.frame.size.height+50];
    }
    else if (nType == 28) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateTopLeftCornerToCentreWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 29) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateTopRightCornerToCentreWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 30) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateBottomLeftCornerToCentreWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 31) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateBottomRightCornerToCentreWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 32) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToRightBottomCornerWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 33) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToLeftBottomCornerWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 34) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToRightTopCornerWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 35) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateCentreToLeftTopCornerWithRect:viewPlayingObject Duration:0.8];
    }
    else if (nType == 36) { // First parameter must be 0
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateBlink:0 nMaxBlink:5 Duration:0.5 view:viewPlayingObject];
    }
    else if (nType == 37) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateWholeFrame:viewHeader.frame view:viewPlayingObject Duration:1.0];
    }
    else if (nType == 37) {
        [self.view bringSubviewToFront:viewPlayingObject];
        [PGAnimation AnimateWholeFrame:viewHeader.frame view:viewPlayingObject Duration:1.0];
    }
    else if (nType == 38) {
        [PGAnimation AnimatePushViewControllerWithPresentEffect:self toViewController:pushedVC];
    }
    else if (nType == 39) {
        [PGAnimation AnimatePushViewControllerWithZoomEffect:self toViewController:pushedVC];
    }
    else if (nType == 40) {
        [PGAnimation AnimatePushViewControllerWithSpinEffect:self toViewController:pushedVC];
    }
    else if (nType == 41) {
        [PGAnimation AnimatePushViewControllerWithPresentDownEffect:self toViewController:pushedVC];
    }
    else if (nType == 42) {
        [PGAnimation AnimatePushViewControllerWithPopEffect:self toViewController:pushedVC];
    }
    else if (nType == 43) {
        [PGAnimation AnimatePushViewControllerWithFadeEffect:self toViewController:pushedVC];
    }
    else if (nType == 44) {
        [PGAnimation AnimatePushViewControllerWithSpringEffect:self toViewController:pushedVC];
    }
    else if (nType == 45) {
        [PGAnimation AnimatePushViewControllerWithFlipFromRightEffect:self toViewController:pushedVC];
    }
    else if (nType == 46) {
        [PGAnimation AnimatePushViewControllerWithFlipFromLeftEffect:self toViewController:pushedVC];
    }
    else if (nType == 47) {
        [PGAnimation AnimatePushViewControllerWithCurlUpLeftEffect:self toViewController:pushedVC];
    }
    else if (nType == 48) {
        [PGAnimation AnimatePushViewControllerWithTransitionCurlDownEffect:self toViewController:pushedVC];
    }
}

-(IBAction)btnBack:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
