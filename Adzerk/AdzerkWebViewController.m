//
//  AGWebViewController.m
//  BhamMag
//
//  Created by Andria Jensen on 6/26/10.
//  Copyright 2010 Appsolute Genius. All rights reserved.
//

#import "AdzerkWebViewController.h"


@implementation AdzerkWebViewController
@synthesize webView, initialURL, sourceHTML;


- (id) initWithURL:(NSURL *)url {
    if ((self = [super initWithNibName:@"AdzerkWebView" bundle:nil])) {
		initialURL = url;
    }
    return self;
}

- (id) initWithHTML:(NSString *)html {
	if (self = [super initWithNibName:@"AdzerkWebView" bundle:nil]) {
		sourceHTML = html;
	}
	
	return self;
}

- (void)viewDidLoad {
	if (sourceHTML) {
		[webView loadHTMLString:sourceHTML baseURL:nil];
	}
	else {
		[webView loadRequest:[NSURLRequest requestWithURL:self.initialURL]];			
	}


	[super viewDidLoad];
}

- (void) viewWillDisappear:(BOOL)animated {
	// we're leaving this page, hide the network indicator and stop loading the site
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	[webView stopLoading];	
}

- (void)viewDidUnload {
    [super viewDidUnload];
    webView = nil;
}

- (void)dealloc {
	[webView release];
	[initialURL release];
	[sourceHTML release];
    [super dealloc];
}

- (void) setIsToolbarHidden:(BOOL)hidden {
	toolbar.hidden = hidden;
}

- (BOOL) isToolbarHidden {
	return toolbar.hidden;
}

- (void) webViewDidStartLoad:(UIWebView *)webView {
	// show the network indicator
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
	// hide the network indicator
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

	// enable back and forward buttons if applicable
	backButton.enabled = [self.webView canGoBack];
	forwardButton.enabled = [self.webView canGoForward];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	//hide the network indicator
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	// ignore the -999 error, this seems to be erroneous
	if ([error code] == -999) return;

	// show any other valid error messages
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert autorelease];
}

- (IBAction) done {
	[self dismissModalViewControllerAnimated:YES];
}

@end
