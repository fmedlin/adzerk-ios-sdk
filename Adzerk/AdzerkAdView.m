//
//  AdzerkAdView.m
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import "AdzerkAdView.h"
#import "AdzerkWebViewController.h"

@implementation AdzerkAdView
@synthesize adTimer, parentViewController, currentAd, zone, adzerk;

// *** Request the next ad from the Adzerk web service
- (void) fadeAdIn {
	[self.adzerk getNextAdForCategory:self.zone];	
}

// *** Set the current image to the new banner image
// *** Fade the new ad in gradually
// *** Start the timer to notify the view when it's time to show the next ad
- (void) adzerkDidGetNextAd:(AdzerkAd *)ad forCategory:(NSString *)categoryId {
	self.currentAd = ad;
	self.image = self.currentAd.bannerImage;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
	self.alpha = 1.0;	
	[UIView commitAnimations];
	
	[self.adTimer invalidate];
	self.adTimer = [NSTimer scheduledTimerWithTimeInterval:[self.currentAd.secondsToShow intValue] target:self selector:@selector(changeAd) userInfo:nil repeats:NO];	
}

// *** Fade the current ad out
// *** Set the didStopSelector to fadeAdIn, so the new ad will fade in once the current one fades out.
- (void) changeAd {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(fadeAdIn)];
	[UIView setAnimationDuration:0.75];
	self.alpha = 0.0;	
	[UIView commitAnimations];	
}

// *** BEGIN THE AD ROTATION (this should be called from the containing view in order to start showing ads)
- (void) startRotatingAds {
	[self changeAd];
}

// *** END THE AD ROTATION (this should be called from the containing view in order to stop showing ads)
- (void) stopRotatingAds {
	[self.adTimer invalidate];
}

// *** When the ad view is touched, a web view is shown using the current target URL
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	AdzerkWebViewController *webView;
	
	if (self.currentAd.isHTML) {
		webView = [[AdzerkWebViewController alloc] initWithHTML:self.currentAd.htmlContent];		
	}
	else {
		webView = [[AdzerkWebViewController alloc] initWithURL:self.currentAd.targetURL];
	}

	webView.isToolbarHidden = YES;
	[parentViewController presentModalViewController:webView animated:YES];

}

// *** For use with views that may be hooked up to an IBOutlet
// *** If IBOutlets are used, zone and parentViewController must be set manually
- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.userInteractionEnabled = YES;
		self.adzerk = [[Adzerk alloc] initWithDelegate:self];
	}
	
	return self;
}

// *** Frame size should be set as 320x50 in the location you choose on your view
// *** Zone should correspond to the zone ID found in your Adzerk account.  Multiple zones can be used across views in a single app.
// *** ParentViewController will tell the ad view which view controller to use for displaying modal web views when ads are touched
- (id) initWithFrame:(CGRect)adViewFrame zone:(NSString *)zoneId parentViewController:(UIViewController *)viewController {
	if (self = [super initWithFrame:adViewFrame]) {
		self.userInteractionEnabled = YES;
		self.parentViewController = viewController;
		self.zone = zoneId;
		self.adzerk = [[Adzerk alloc] initWithDelegate:self];
	}
	return self;
}

// *** stop and release timer
// *** release class properties that have been retained
- (void)dealloc {
	[adTimer invalidate];
	[parentViewController release];
	[zone release];
	[adzerk release];
	
	[super dealloc];
}


@end
