//
//  AdzerkAd.m
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import "AdzerkAd.h"
#import "JSON.h"

@implementation AdzerkAd
@synthesize adId, categoryId, bannerURL, targetURL, bannerImage, secondsToShow, isHTML, htmlContent;

- (id) initWithJSON:(NSString *)jsonResponseString {
	if (self = [super init]) {
		NSDictionary *jsonDict = [jsonResponseString JSONValue];
		
		self.adId = [jsonDict objectForKey:@"Id"];
		self.targetURL = [NSURL URLWithString:[jsonDict objectForKey:@"TargetUrl"]];
		self.bannerURL = [NSURL URLWithString:[jsonDict objectForKey:@"CreativeUrl"]];
		self.bannerImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.bannerURL]];
		self.secondsToShow = [jsonDict objectForKey:@"TimeToShow"];
		self.isHTML = [[jsonDict objectForKey:@"isHTML"] boolValue];
		self.htmlContent = [jsonDict objectForKey:@"HtmlContent"];
		
	}
	
	return self;
}

- (void) dealloc {
	[adId release];
	[categoryId release];
	[bannerURL release];
	[targetURL release];
	[bannerImage release];
	[htmlContent release];
	
	[super dealloc];
}

@end
