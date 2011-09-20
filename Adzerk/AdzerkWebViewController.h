//
//  AGWebViewController.h
//  BhamMag
//
//  Created by Andria Jensen on 6/26/10.
//  Copyright 2010 Appsolute Genius. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AdzerkWebViewController : UIViewController <UIWebViewDelegate> {
	IBOutlet UIWebView *webView;
	IBOutlet UIToolbar *toolbar;
	IBOutlet UIBarButtonItem *backButton;
	IBOutlet UIBarButtonItem *forwardButton;
	NSURL *initialURL;
	NSString *sourceHTML;
}

@property (nonatomic, retain, readonly) UIWebView *webView;
@property (nonatomic, retain, readonly) NSURL *initialURL;
@property (nonatomic, retain, readonly) NSString *sourceHTML;
@property BOOL isToolbarHidden;

- (id) initWithURL:(NSURL *)url;
- (id) initWithHTML:(NSString *)html;
- (IBAction) done;

@end
