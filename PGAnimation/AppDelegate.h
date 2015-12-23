//
//  AppDelegate.h
//  PGAnimation
//
//  Created by Pankaj on 04/12/15.
//  Copyright © 2015 Pankaj Gondaliya. All rights reserved.
//
// You can contact me on : https://www.facebook.com/pankaj.gondaliya.16

#import <UIKit/UIKit.h>

#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *navHome;
}

@property (strong, nonatomic) UIWindow *window;


@end

