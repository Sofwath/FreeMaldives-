//
//  BrowserViewController.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "browserHelper.h"

// The names of the images for the 'back' and 'forward' buttons in the toolbar.
#define PNG_BUTTON_FORWARD @"right.png"
#define PNG_BUTTON_BACK @"left.png"

// List of all strings used
#define ACTION_CANCEL           @"Cancel"
#define ACTION_OPEN_IN_SAFARI   @"Open in Safari"

@interface BrowserViewController : UIViewController
<
UIWebViewDelegate,
UIActionSheetDelegate
> {
    // the current URL of the UIWebView
    NSString *url;
    
    // the UIWebView where we render the contents of the URL
    IBOutlet UIWebView *webView;
    
    // the UIToolbar with the "back" "forward" "reload" and "action" buttons
    IBOutlet UIToolbar *toolbar;
    
    // used to indicate that we are downloading content from the web
    UIActivityIndicatorView *activityIndicator;
    
    // pointers to the buttons on the toolbar
    UIBarButtonItem *backButton;
    UIBarButtonItem *forwardButton;
    UIBarButtonItem *stopButton;
    UIBarButtonItem *reloadButton;
    UIBarButtonItem *actionButton;
    UIBarButtonItem *home;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *home;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
//@property(nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *forwardButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *stopButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *reloadButton;

@property(nonatomic, retain) NSString *url;
@property (strong, nonatomic) NSObject *selection;
//@property(nonatomic, retain) UIBarButtonItem *backButton;
//@property(nonatomic, retain) UIBarButtonItem *forwardButton;
//@property(nonatomic, retain) UIBarButtonItem *stopButton;
//@property(nonatomic, retain) UIBarButtonItem *reloadButton;
@property(nonatomic, retain) UIBarButtonItem *actionButton;

// Initializes the BrowserViewController with a specific URL 
- (id)initWithUrls:(NSURL*)u;


@end
