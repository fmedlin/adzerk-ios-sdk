//
//  AdzerkSDKAppDelegate.h
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdzerkSDKViewController;

@interface AdzerkSDKAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AdzerkSDKViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AdzerkSDKViewController *viewController;

@end

