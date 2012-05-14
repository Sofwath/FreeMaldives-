//
//  FirstViewController.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>
#import "iCarousel.h"
#import "BaseViewController.h"
#import "QuadCurveMenu.h"
#import "FBConnect.h"
//#import "Facebook.h"
#import "FBFeedPost.h"



// original start
//@interface FirstViewController: UIViewController <iCarouselDataSource, iCarouselDelegate>

@class SBTickerView;

@interface FirstViewController : UIViewController <UIApplicationDelegate, iCarouselDataSource, iCarouselDelegate, QuadCurveMenuDelegate,FBSessionDelegate>

{
    BOOL isConnected;    
    //NSArray *permissions; 
    NSString *message;
    
    Facebook *facebook;
    
    NSString *_currentClock;
    NSArray *_clockTickers;
       
    
}
   

@property (weak, nonatomic) IBOutlet UILabel *TimerLabel;
@property (weak, nonatomic) IBOutlet UIButton *easyTweetButton;
@property (weak, nonatomic) IBOutlet UILabel *HiddenLbl;
@property (strong, nonatomic) UIWindow *window;
//@property (retain, nonatomic) NSArray *permissions;
@property (nonatomic, retain) NSString *message;

@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (nonatomic) BOOL isConnected;
@property (nonatomic, strong) Facebook *facebook;

//ticker

@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewDay1;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewDay2;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewDay3;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewHour1;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewHour2;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewMinute1;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewMinute2;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewSecond1;
@property (nonatomic, strong) IBOutlet SBTickerView *clockTickerViewSecond2;

@property (nonatomic, strong) IBOutlet UIView *frontView;
@property (nonatomic, strong) IBOutlet UIView *backView;


- (IBAction)sendEasyTweet:(id)sender;
- (void)displayText:(NSString *)text;





@end 

//end original



