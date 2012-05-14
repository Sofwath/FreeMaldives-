//
//  MDMWebViewController.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSMiniWebBrowser.h"

@class ViewController;


@interface MDMWebViewController : UITableViewController <TSMiniWebBrowserDelegate> {
    NSString *url;
    
}

+ (NSString *)myGlobalVariable;
+ (void)setMyGlobalVariable:(NSString *)val;

-(IBAction) urlList:(id) sender;

@property (strong, nonatomic) ViewController *viewController;


@property (weak, nonatomic) IBOutlet UITableViewCell *cellOne;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellTwo;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellThree;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellFour;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellFive;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellSix;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *urlstore;

@property(nonatomic, retain) NSString *url;
@property(nonatomic, retain) NSString *myGlobalVariable;

@end
