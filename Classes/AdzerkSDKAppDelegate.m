//
//  AdzerkSDKAppDelegate.m
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import "AdzerkSDKAppDelegate.h"
#import "AdzerkSDKViewController.h"

@implementation AdzerkSDKAppDelegate

@synthesize window;
@synthesize viewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // *** Initialize Adzerk with the appropriate App Key.  This only needs to be done one time for each application.
	[Adzerk startSessionWithAppKey:@"10980"];
	
    // Add the view controller's view to the window and display.
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

	
    return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
   
	[super dealloc];
}


@end
