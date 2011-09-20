//
//  AdzerkSDKViewController.m
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import "AdzerkSDKViewController.h"
#import "Adzerk.h"

@implementation AdzerkSDKViewController
@synthesize adView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// *** Create a new view of type AdzerkAdView and add it as a subview
	// *** Frame size should be set as 320x50 in the location you choose on your view
	// *** Zone should correspond to the zone ID found in your Adzerk account.  Multiple zones can be used across views in a single app.
	// *** ParentViewController will tell the ad view which view controller to use for displaying modal web views when ads are touched
	self.adView = [[AdzerkAdView alloc] initWithFrame:CGRectMake(0, 410, 320, 50) zone:@"0" parentViewController:self];
	[self.view addSubview:adView];
		
	// *** Tell the ads to begin rotating
	[adView startRotatingAds];
}

- (void)viewDidUnload {
	// *** End the ad rotation (when switching to another view controller, etc.)
	[adView stopRotatingAds];
}

- (void)dealloc {
	// *** Release the AdzerkAdView object
	[adView release];
	[super dealloc];
}

@end
