//
//  BrowserViewController.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

@synthesize rightBarButtonItem;
@synthesize home;
@synthesize webView;
@synthesize toolbar;


@synthesize url;
@synthesize forwardButton;
@synthesize backButton;
@synthesize stopButton;
@synthesize reloadButton;
@synthesize actionButton;
@synthesize selection;




#pragma mark - UIActionSheet Delegate

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/**********************************************************************************************************************/
#pragma mark - View lifecycle


- (void)updateToolbar
{
    // toolbar
    self.forwardButton.enabled = [self.webView canGoForward];
    self.backButton.enabled = [self.webView canGoBack];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];        
    NSMutableArray *toolbarButtons = [[NSMutableArray alloc] initWithObjects:self.backButton, flexibleSpace, self.forwardButton, flexibleSpace, self.reloadButton, flexibleSpace, self.home, nil];
    
    if([activityIndicator isAnimating]) [toolbarButtons replaceObjectAtIndex:4 withObject:self.stopButton];
    
    [self.toolbar setItems:toolbarButtons animated:YES];
  
    
    // page title
    NSString *pageTitle = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if(pageTitle) [[self navigationItem] setTitle:pageTitle];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Y U SO ...... FFFFUUUU");
    
    /*
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];

       
    self.webView.scalesPageToFit = YES;
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator] ;
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator] ;
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator] ;
    //[self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    */
    // lets do the bongo 
    
    
    //
    NSString *title ;
    if (url == @"http://www.maldivesdemocracymovement.com/"){
        title = @"www.maldivesdemocracymovement.com" ;
    } else if (url== @"http://www.mvdemocracy.com/"){
        title = @"www.mvdemocracy.com";
    } else if (url== @"http://www.moonlight.com.mv/"){
        title = @"www.moonlight.com.mv";
    } else if (url== @"http://www.uthuru.com/"){
        title = @"www.uthuru.com";
    } else if (url==@"http://mvdemocracy.com/u/detaineeslist_201203260230.htm"){
        title= @"Political Detainees List";
    } else if (url== @"http://www.newdhivehiobserver.com/"){
        title = @"www.newdhivehiobserver.com";
    } 

    [self OpenURL:url second:title];
    [self updateToolbar];
}


- (void)viewDidUnload
{
    [[self navigationItem] setRightBarButtonItem:nil];
    [self setBackButton:nil];
    [self setForwardButton:nil];
    [self setStopButton:nil];
    [self setReloadButton:nil];
    [self setHome:nil];
    [self setRightBarButtonItem:nil];
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait
            || interfaceOrientation == UIInterfaceOrientationLandscapeRight
            || interfaceOrientation == UIInterfaceOrientationLandscapeLeft
            || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}


/**********************************************************************************************************************/
#pragma mark - User Interaction


- (void)backButtonPressed:(id)sender
{
    if([self.webView canGoBack]) [self.webView goBack];
}


- (void)forwardButtonPressed:(id)sender
{
    if([self.webView canGoForward]) [self.webView goForward];
}


- (void)stopReloadButtonPressed:(id)sender
{
    if([activityIndicator isAnimating])
    {
        [self.webView stopLoading];
        [activityIndicator stopAnimating];
    }
    else
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
        [self.webView loadRequest:request];
    }
    
    [self updateToolbar];
}


- (void)actionButtonPressed:(id)sender
{    
    UIActionSheet *uias = [[UIActionSheet alloc] initWithTitle:nil
                                                      delegate:self 
                                             cancelButtonTitle:ACTION_CANCEL 
                                        destructiveButtonTitle:nil 
                                             otherButtonTitles:ACTION_OPEN_IN_SAFARI, nil];
    
    [uias showInView:self.view];
}


/**********************************************************************************************************************/
#pragma mark - WebView Delegate

/*
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"network started....");
    [activityIndicator startAnimating];
    [[UIApplication sharedApplication]
     setNetworkActivityIndicatorVisible:YES];

    [self updateToolbar];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if(activityIndicator) [activityIndicator stopAnimating];
    [[UIApplication sharedApplication]
     setNetworkActivityIndicatorVisible:NO];
    [self updateToolbar];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{    
    [self updateToolbar];
}
 */

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [[UIApplication sharedApplication]
         setNetworkActivityIndicatorVisible:YES];
        /*
         progressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(140.0f, 120.0f, 40.0f, 40.0f)];
         progressView.hidden = NO ;
         [self.view addSubview:progressView];
         timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
         */
    [self updateToolbar];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication]
         setNetworkActivityIndicatorVisible:NO];
        /*
         [timer invalidate];
         self.progressView.hidden = YES ;
         [self.progressView removeFromSuperview];
         [self.view bringSubviewToFront:webView];
         
         */
        // [SVProgressHUD dismissWithSuccess:@"Page Loaded"];
    
    [self updateToolbar];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError: (NSError *)error {
    [[UIApplication sharedApplication]
         setNetworkActivityIndicatorVisible:NO];
        /*
         [timer invalidate];
         self.progressView.hidden = YES ;
         [self.progressView removeFromSuperview];
         [self.view bringSubviewToFront:webView];
         */
    [self updateToolbar];    
    
}
- (void) OpenURL :(NSString *) urlAddress second:(NSString *)titleBar {
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.scalesPageToFit = YES;
    self.webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    
    //NSString *urlAddress = @"http://maldivesdemocracymovement.com/";
    //self.navigationItem.title = urlAddress;
    //self.navBar.topItem.
    //self.navBar.topItem.title = titleBar;
    //[self.navBar pushNavigationItem:self.navigationItem animated:NO];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
	[label setFont:[UIFont boldSystemFontOfSize:14.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	//[label setText:self.title];
    [label setText:titleBar];
	//[self.navBar.topItem setTitleView:label];
    [self.navigationItem setTitleView:label];
    
    //Create a URL object.
    NSURL *wwurl = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:wwurl];
    
    //Load the request in the UIWebView.
    [webView setDelegate:self];
    
    [webView loadRequest:requestObj];    
}



@end
