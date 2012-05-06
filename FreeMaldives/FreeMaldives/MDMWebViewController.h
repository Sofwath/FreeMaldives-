//
//  MDMWebViewController.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DACircularProgressView.h"
#import "LeveyPopListView.h"


@interface MDMWebViewController : UIViewController <UIWebViewDelegate,LeveyPopListViewDelegate> {
    IBOutlet UIWebView *webView;
    NSTimer *timer;
    BOOL *mvd; 
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) DACircularProgressView *progressView;
@property (strong, nonatomic) NSArray *options;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *urlList;

- (void) OpenURL :(NSString *) urlAddress second:(NSString *) titleBar;
-(IBAction) urlList:(id) sender;

@end
