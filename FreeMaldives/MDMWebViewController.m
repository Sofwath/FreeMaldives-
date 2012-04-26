//
//  MDMWebViewController.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MDMWebViewController.h"
#import "SVProgressHUD.h"


@interface MDMWebViewController ()

@end

@implementation MDMWebViewController
@synthesize webView;
@synthesize progressView;
@synthesize options = _options;
@synthesize navBar;
@synthesize urlList;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    [self showMenu];
	// Do any additional setup after loading the view.
    
     
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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
	[label setFont:[UIFont boldSystemFontOfSize:14.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	//[label setText:self.title];
    [label setText:titleBar];
	[self.navBar.topItem setTitleView:label];


    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView setDelegate:self];
    
    [webView loadRequest:requestObj];    
}

- (void)progressChange
{
    progressView.progress += 0.01;
    
    if (progressView.progress > 1.0f)
    {
        progressView.progress = 0.0f;
    }
}


- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setNavBar:nil];
    [self setUrlList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)webViewDidStartLoad:(UIWebView *)webView {

    if (!mvd) {
        [[UIApplication sharedApplication]
         setNetworkActivityIndicatorVisible:YES];
    /*
    progressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(140.0f, 120.0f, 40.0f, 40.0f)];
    progressView.hidden = NO ;
    [self.view addSubview:progressView];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
    */
        [SVProgressHUD showWithStatus:@"Loading Page"];
    }
 
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (!mvd) {

        [[UIApplication sharedApplication]
         setNetworkActivityIndicatorVisible:NO];
    /*
    [timer invalidate];
    self.progressView.hidden = YES ;
    [self.progressView removeFromSuperview];
    [self.view bringSubviewToFront:webView];

    */
       // [SVProgressHUD dismissWithSuccess:@"Page Loaded"];
        [SVProgressHUD dismiss];
    }

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:
(NSError *)error {
    if (!mvd ) {
        [[UIApplication sharedApplication]
         setNetworkActivityIndicatorVisible:NO];
    /*
    [timer invalidate];
    self.progressView.hidden = YES ;
    [self.progressView removeFromSuperview];
    [self.view bringSubviewToFront:webView];
     */
        [SVProgressHUD dismissWithError:@"Failed with Error"];
    }

}
- (void) showMenu 
{
    _options = [NSArray arrayWithObjects:
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"wvdemomaldives.png"],@"img",@"maldivesdemocracymovement.com",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"wvmvd.png"],@"img",@"mvdemocracy.com",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"wvmoon.png"],@"img",@"moonlight.com.mv",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"wvuthuru.png"],@"img",@"uthuru.com",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"wvdetainee.png"],@"img",@"political detainees so far",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"NEWDO.png"],@"img",@"newdhivehiobserver.com",@"text", nil],
                nil] ;
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"Select Website..." options:_options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake && event.subtype == UIEventSubtypeMotionShake)
    {
        NSLog(@"shake phone");
        
        
        mvd = NO;
        [self OpenURL:@"http://waheed-interrupted.tumblr.com/" second:@"waheed-interrupted.tumblr.com"];
       
    }
}

#pragma mark - LeveyPopListView delegates
         
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex
{
    //_infoLabel.text = [NSString stringWithFormat:@"You have selected %@",[[_options objectAtIndex:anIndex] objectForKey:@"text"]];
    if (anIndex==0){
        mvd = NO;
        [self OpenURL:@"http://www.maldivesdemocracymovement.com/" second:@"maldivesdemocracymovement.com"];
    } 
    if (anIndex==1){
        mvd = YES;
        [self OpenURL:@"http://www.mvdemocracy.com/" second:@"mvdemocracy.com"];
    } 
    if (anIndex==2){
        mvd = NO;
        [self OpenURL:@"http://www.moonlight.com.mv/" second:@"moonlight.com.mv"];
    } 
    if (anIndex==3){
        mvd = NO;
        [self OpenURL:@"http://www.uthuru.com/" second:@"uthuru.com"];
    } 
    if (anIndex==4){
        mvd = NO;
        [self OpenURL:@"http://mvdemocracy.com/u/detaineeslist_201203260230.htm" second:@"Detainees list"];
    } 
    if (anIndex==5){
        mvd = NO;
        [self OpenURL:@"http://www.newdhivehiobserver.com/" second:@"New Dhivehi Observer"];
    } 
    if (anIndex==6){
        mvd = NO;
        [self OpenURL:@"http://waheed-interrupted.tumblr.com/" second:@"waheed-interrupted.tumblr.com"];

    } 
}
- (void)leveyPopListViewDidCancel
{
    //_infoLabel.text = @"You have cancelled";
}

- (IBAction)urlList:(id)sender {
    [self showMenu];
}
@end
