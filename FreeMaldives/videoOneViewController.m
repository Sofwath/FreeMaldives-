//
//  videoOneViewController.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "videoOneViewController.h"

@interface videoOneViewController ()

@end

@implementation videoOneViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bkios5.png"]]];

    
        
    NSString *videoUrl = @"http://www.youtube.com/watch?v=FAwiIlrUbZY";
    NSString *htmlString = [NSString stringWithFormat:@"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 212\"/></head><body style=\"background:#F00;margin-top:0px;margin-left:0px\"><div><object width=\"320\" height=\"480\"><param name=\"movie\" value=\"%@\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"%@\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"320\" height=\"480\"></embed></object></div></body></html>",videoUrl,videoUrl]    ;
    
    
    [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.youtube.com"]];
    
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
