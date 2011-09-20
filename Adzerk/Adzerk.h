//
//  Adzerk.h
//  AdzerkSDK
//
//  Created by Andria Jensen on 1/4/11.
//  Copyright 2011 Appsolute Genius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdzerkAd.h"
#import "ASIHTTPRequest.h"

@protocol AdzerkDelegate;

@interface Adzerk : NSObject <ASIHTTPRequestDelegate> {
	id <AdzerkDelegate> delegate;
}

+ (NSString *) appKey;
+ (void) startSessionWithAppKey:(NSString *)applicationKey;

- (id) initWithDelegate:(id)adzerkDelegate;
- (void) getNextAdForCategory:(NSString *)categoryId;

@property (nonatomic, assign) id <AdzerkDelegate> delegate;

@end


@protocol AdzerkDelegate 

- (void) adzerkDidGetNextAd:(AdzerkAd *)ad forCategory:(NSString *)categoryId;

@end