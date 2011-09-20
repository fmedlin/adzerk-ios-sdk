//
//  AdzerkAd.h
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AdzerkAd : NSObject {
	NSString *adId;
	NSString *categoryId;	
	NSURL *bannerURL;
	NSURL *targetURL;
	UIImage *bannerImage;
	NSNumber *secondsToShow;

	BOOL isHTML;
	NSString *htmlContent;
}

@property (nonatomic, retain) NSString *adId;
@property (nonatomic, retain) NSString *categoryId;
@property (nonatomic, retain) NSURL *bannerURL;
@property (nonatomic, retain) NSURL *targetURL;
@property (nonatomic, retain) UIImage *bannerImage;
@property (nonatomic, retain) NSNumber *secondsToShow;

@property BOOL isHTML;
@property (nonatomic , retain) NSString *htmlContent;

- (id) initWithJSON:(NSString *)jsonResponseString;

@end
