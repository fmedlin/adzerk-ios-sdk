//
//  AdzerkAdView.h
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Adzerk.h"

@interface AdzerkAdView : UIImageView <AdzerkDelegate> {
	Adzerk *adzerk;
	AdzerkAd *currentAd;
	NSTimer *adTimer;
	NSString *zone;
	UIViewController *parentViewController;
}

@property (nonatomic, retain) Adzerk *adzerk;
@property (nonatomic, retain) AdzerkAd *currentAd;
@property (nonatomic, retain) NSTimer *adTimer;
@property (nonatomic, retain) NSString *zone;
@property (nonatomic, retain) UIViewController *parentViewController;


// *** Frame size should be set as 320x50 in the location you choose on your view
// *** Zone should correspond to the zone ID found in your Adzerk account.  Multiple zones can be used across views in a single app.
// *** ParentViewController will tell the ad view which view controller to use for displaying modal web views when ads are touched
- (id) initWithFrame:(CGRect)adViewFrame zone:(NSString *)zoneId parentViewController:(UIViewController *)viewController; 

// *** BEGIN THE AD ROTATION (this should be called from the containing view in order to start showing ads)
- (void) startRotatingAds;

// *** END THE AD ROTATION (this should be called from the containing view in order to stop showing ads)
- (void) stopRotatingAds;

@end
