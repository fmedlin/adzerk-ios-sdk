//
//  Adzerk.m
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import "Adzerk.h"

@implementation Adzerk
@synthesize delegate;

static NSString *_appKey;

+ (NSString *) appKey {
	return _appKey;
}

+ (void) startSessionWithAppKey:(NSString *)applicationKey {
	_appKey = applicationKey;	
}

- (id) initWithDelegate:(id)adzerkDelegate {
	if (self = [super init]) {
		self.delegate = adzerkDelegate;
	}
	
	return self;
}

- (void) getNextAdForCategory:(NSString *)categoryId {
	NSString *urlString = [NSString stringWithFormat:@"http://engine.adzerk.net/m?appId=%@&adTypeId=%@&zoneId=%@&userKey=%@",
						   _appKey, @"22", categoryId, @"0"];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
	request.delegate = self;
	[request startAsynchronous];
}

- (void) dealloc {
	[super dealloc];
}

- (void) requestFinished:(ASIHTTPRequest *)request {
	AdzerkAd *ad = [[[AdzerkAd alloc] initWithJSON:[request responseString]] autorelease];
	[delegate adzerkDidGetNextAd:ad forCategory:ad.categoryId];
}

@end
