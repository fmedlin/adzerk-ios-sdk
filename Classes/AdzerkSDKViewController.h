//
//  AdzerkSDKViewController.h
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdzerkAdView.h"

@interface AdzerkSDKViewController : UIViewController {
	AdzerkAdView *adView;
}

@property (nonatomic, retain) AdzerkAdView *adView;

@end

