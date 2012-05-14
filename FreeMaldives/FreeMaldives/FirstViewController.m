//
//  FirstViewController.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//





#import "FirstViewController.h"

#import "FBConnect.h"
#import "Facebook.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "SBTickerView.h"
#import "SBTickView.h"


//#import "NSDate-Utilities.m"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define NUMBER_OF_ITEMS 21 //(IS_IPAD? 19: 12)
#define NUMBER_OF_VISIBLE_ITEMS 25
#define ITEM_SPACING 210.0f
#define INCLUDE_PLACEHOLDERS YES

//@interface FirstViewController () <UIActionSheetDelegate>

@interface FirstViewController ()  <UIActionSheetDelegate>
    @property (nonatomic, assign) BOOL wrap;
    @property (nonatomic, retain) NSMutableArray *items;

@end



@implementation FirstViewController  

@synthesize carousel;
@synthesize easyTweetButton;
@synthesize HiddenLbl;
@synthesize TimerLabel;
@synthesize items;
@synthesize wrap;
@synthesize window ;
@synthesize isConnected;
//@synthesize permissions;
@synthesize message;
@synthesize facebook;

@synthesize clockTickerViewHour1;
@synthesize clockTickerViewHour2;
@synthesize clockTickerViewMinute1;
@synthesize clockTickerViewMinute2;
@synthesize clockTickerViewSecond1;
@synthesize clockTickerViewSecond2;
@synthesize clockTickerViewDay1,clockTickerViewDay2,clockTickerViewDay3;



- (void)setUp
{
    //set up data
	wrap = YES;
	self.items = [NSMutableArray array];
	for (int i = 0; i < NUMBER_OF_ITEMS; i++)
	{
		//[items addObject:[NSNumber numberWithInt:i]];
        [items addObject:[NSString stringWithFormat:@"image_%d.png",i]];

	}    
    // The items to be displayed in the carousel
    NSLog(@"here in setup"); 
    
   
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setUp];
    }
    return self;
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    carousel.delegate = nil;
    carousel.dataSource = nil;

}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
       
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"just_background.png"]]];
    
    UINavigationBar *navBar = [[self navigationController] navigationBar];
    UIImage *backgroundImage = [UIImage imageNamed:@"topbarblknew.png"];
    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], 
      UITextAttributeTextColor, 
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5], 
      UITextAttributeTextShadowColor, 
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], 
      UITextAttributeTextShadowOffset, 
      [UIFont fontWithName:@"Arial-Bold" size:0.0], 
      UITextAttributeFont, 
      nil]];
    
    
    //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeValue) userInfo:nil repeats:YES];
    
    
    
    carousel.type = iCarouselTypeCoverFlow; // for tricks can change so on shake event change type (random) ?
    
    
    
    //tab bar
   // [self addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];
    
    UIImage *tabBackground = [[UIImage imageNamed:@"tabbg.png"]
                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UITabBar appearance] setBackgroundImage:tabBackground];
    //[[UITabBar appearance] setSelectionIndicatorImage:
    // [UIImage imageNamed:@"tab_select_indicator"]];
    
    //the menu for social 
    [self initQuadCurveMenu];
    
    // timer
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(numberTick:) userInfo:nil repeats:YES];
    
    //Init
    _currentClock = @"-*-*-*-*-";
    _clockTickers = [NSArray arrayWithObjects:
                     clockTickerViewDay1,
                     clockTickerViewDay2,
                     clockTickerViewDay3,
                     clockTickerViewHour1,
                     clockTickerViewHour2,
                     clockTickerViewMinute1,
                     clockTickerViewMinute2,
                     clockTickerViewSecond1,
                     clockTickerViewSecond2, nil];
    
    for (SBTickerView *ticker in _clockTickers){
        [ticker setFrontView:[SBTickView tickViewWithTitle:@"-" fontSize:35.]];    
        //TO-DO : implement image with flip ticker ... working on it
        //[ticker setFrontView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clockbg.png"]]];
        //[ticker setBackView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clockbg.png"]]];
    }
    //
    
            

}
/* old timer 
-(void)changeValue{
    
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2012];
    [comps setMonth:2];
    [comps setDay:7];
    [comps setHour:1];
    [comps setMinute:0];
    
    
    
    NSDate *now = [NSDate date];
    NSDate *MyTargetDateObject;
    
    MyTargetDateObject = [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:now options:0];
	//[comps release];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"'Due' EEEE d MMM yyyy, h:mm a"];
    [dateFormatter setDateFormat:@"dd:hh:mm:ss"];
    
    //[TimerLabel setText:[dateFormatter  stringFromDate:MyTargetDateObject]];
    //self.TimerLabel.text = (@"d%",mydate);
    
    // original string
    NSString *str = [NSString stringWithFormat:@"2012-02-7T13:00:00+11:00"];
    
    // convert to date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss'+11:00'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Indian/Maldives"]];
    NSDate *otherDate = [dateFormat dateFromString:str];
    //NSLog(@"Date: %@", otherDate);
    
    NSDate *date=[NSDate date];
    int secondsNow=(int)[date timeIntervalSince1970];
    int secondsTarget=(int)[otherDate timeIntervalSince1970];
    int differenceSeconds=secondsNow-secondsTarget;
    int days=(int)((double)differenceSeconds/(3600.0*24.00));
    int diffDay=differenceSeconds-(days*3600*24);
    int hours=(int)((double)diffDay/3600.00);
    int diffMin=diffDay-(hours*3600);
    int minutes=(int)(diffMin/60.0);
    int seconds=diffMin-(minutes*60);
    
    
    TimerLabel.text=[NSString stringWithFormat:@"%02d  %02d:%02d:%02d",days,hours,minutes,seconds];
    
    HiddenLbl.text = [NSString stringWithFormat:@"%02d days %02d hours %02d minutes %02d seconds",days,hours,minutes,seconds];
   
    
    
}
*/


//- (IBAction)sendEasyTweet:(id)sender {
- (void) sendEasyTweet {
    
    NSLog(@"inside... tweet");
    
    // Set up the built-in twitter composition view controller.
    TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
    
    // Set the initial tweet text. See the framework for additional properties that can be set.
    
    NSString *myString = HiddenLbl.text;;
    NSString *tweet = [myString stringByAppendingString:@" since the coup in Maldives. I call for immediate elections! #mvcoup"];
    
    [tweetViewController setInitialText:tweet];
    
    NSLog(@"%@",tweet);
    
    // Create the completion handler block.
    [tweetViewController setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
        NSString *output;
        
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
                // The cancel button was tapped.
                output = @"Tweet cancelled.";
                break;
            case TWTweetComposeViewControllerResultDone:
                // The tweet was sent.
                output = @"Tweet done.";
                break;
            default:
                break;
        }
        
        [self performSelectorOnMainThread:@selector(displayText:) withObject:output waitUntilDone:NO]; //displayText
        
        // Dismiss the tweet composition view controller.
        [self dismissModalViewControllerAnimated:YES];
    }];
    
    // Present the tweet composition view controller modally.
    [self presentModalViewController:tweetViewController animated:YES];
}

- (void)displayText:(NSString *)text {
	//self.outputTextView.text = text;
    self.HiddenLbl.text = text ;
}


- (void)viewDidUnload
{
    [self setCarousel:nil];
    [self setCarousel:nil];
    [super viewDidUnload];
    self.carousel = nil;
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return YES;
//}




#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return NUMBER_OF_VISIBLE_ITEMS ;
    return [items count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    //this also affects the appearance of circular-type carousels
    return NUMBER_OF_VISIBLE_ITEMS;
    //return [items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
	
	//create new view if no view is available for recycling
	if (view == nil)
	{
        //UIImage *image = [items objectAtIndex:index];
        NSString *imgName = [items objectAtIndex:index];
        view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]] ;
        label = [[UILabel alloc] initWithFrame:view.bounds] ;
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		label.font = [label.font fontWithSize:50];
		[view addSubview:label];
	}
	else
	{
		label = [[view subviews] lastObject];
	}
	
    //set label
	//label.text = [[items objectAtIndex:index] stringValue];
    
    NSLog(@"here in cariusel %d",index);

	
	return view;
   }

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //UIImage *fris5 = [UIImage imageNamed:@"fris05.PNG"];
    //UIImageView *frisView1 = [[UIImageView alloc]initWithImage:fris1];
    
    UILabel *label = nil;
	
	//create new view if no view is available for recycling
	if (view == nil)
	{
        NSString *imgName = [items objectAtIndex:index];        
        view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]] ;
		label = [[UILabel alloc] initWithFrame:view.bounds] ;
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		label.font = [label.font fontWithSize:50.0f];
		[view addSubview:label];
	}
	else
	{
		label = [[view subviews] lastObject];
	}
	
    //set label
	//label.text = (index == 0)? @"[": @"]";
	
	return view;

}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	//note: placeholder views are only displayed on some carousels if wrapping is disabled
	return INCLUDE_PLACEHOLDERS? 2: 0;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    NSLog(@"inside carouselItemWidth");
    return ITEM_SPACING;
}

- (CGFloat)carousel:(iCarousel *)carousel itemAlphaForOffset:(CGFloat)offset
{
	//set opacity based on distance from camera
    NSLog(@"carousel alpha");

    return 1.0f - fminf(fmaxf(offset, 0.0f), 1.0f);
}

- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    NSLog(@"carousel trans");

    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    NSLog(@"wrap");
    return wrap;
}


//tabbar stuff




// Create a view controller and setup it's tab bar item with a title and image
-(UIViewController*) viewControllerWithTabTitle:(NSString*) title image:(UIImage*)image
{
    UIViewController* viewController = [[UIViewController alloc] init] ;
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0] ;
    return viewController;
}

// Create a custom UIButton and add it to the center 
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBarController.tabBar.frame.size.height ;
    if (heightDifference < 0)
        button.center = self.tabBarController.tabBar.center;
    else
    {
        CGPoint center = self.tabBarController.tabBar.center;
        //center.y = center.y - heightDifference/2.0;
        center.y = center.y - self.tabBarController.tabBar.frame.origin.y - heightDifference/2.0;
        button.center = center;
    }
    
    //[self.view addSubview:button];
    [self.tabBarController.tabBar addSubview:button];
}

// path like menu

- (void) initQuadCurveMenu {
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage1 = [UIImage imageNamed:@"facebook.png"];
    UIImage *starImage2 = [UIImage imageNamed:@"twitter.png"];

    
    QuadCurveMenuItem *starMenuItem1 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage2 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem2 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage1 
                                                        highlightedContentImage:nil];
        
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2,  nil];
    
    
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
    //[[QuadCurveMenu alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f - 44.0f) menus:menus];
    //menu.delegate = self;
    /*
	menu.rotateAngle = M_PI/3;
	menu.menuWholeAngle = M_PI;
	menu.timeOffset = 0.2f;
	menu.farRadius = 80.0f;
	menu.endRadius = 40.0f;
	menu.nearRadius = 20.1f;
    */
	menu.delegate = self;
    [self.view addSubview:menu];
    
}

- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    //UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Item Selected" message:[NSString stringWithFormat:@"Index : %d", idx] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    //[alertView show];
    if (idx == 0) {
        //[alertView show];
        [self sendEasyTweet];
        
    } else {
        //fb post


        NSString *myString = HiddenLbl.text;;
        NSString *someText = [myString stringByAppendingString:@" since the coup in Maldives. I call for immediate elections! #mvcoup"];
        
        // init stuff   
        NSLog(@"[ViewController] beginning Facebook login");
        
        //facebook = [[Facebook alloc] initWithAppId:@"401816309847187" andDelegate:self];
        facebook = [[Facebook alloc] initWithAppId:@"401816309847187" andDelegate:(AppDelegate *) [[UIApplication sharedApplication] delegate]];

        //self.facebook = [[Facebook alloc] initWithAppId:@"401816309847187" andDelegate:self];
        //Check for previously saved information
        

        //facebook = [[Facebook alloc] initWithAppId:@"401816309847187" andDelegate:self];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"FBAccess-TokenKey"]  && [defaults objectForKey:@"FBExpiration-DateKey"]) {
            facebook.accessToken = [defaults objectForKey:@"FBAccess-TokenKey"];
            facebook.expirationDate = [defaults objectForKey:@"FBExpiration-DateKey"];
        }
        
        //if session is valid ask for persmisions 
        [SVProgressHUD showWithStatus:@"Posting to Facebook"];
        if (![facebook isSessionValid]) {
            NSArray *permissions = [[NSArray alloc] initWithObjects:
                                    @"user_likes", 
                                    @"read_stream",
                                    @"user_checkins",
                                    @"publish_stream",
                                    
                                    nil];
            [facebook authorize:permissions];
            
            
            NSLog(@"i neddddd permission");
            
        }
        else{
            
            NSLog(@"Already has permission, i guess");
            
        }
        
        
        NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys: someText, @"message",nil];
        
        
      
        [facebook requestWithGraphPath:@"me/feed" andParams:params andHttpMethod:@"POST" andDelegate:nil]; 
        
        [SVProgressHUD dismiss];

        
    }
        
        
}

// This is an FBSessionDelegate protocol method
// that gets called after a successful login
- (void)fbDidLogin 
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self.facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[self.facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"POST_TO_FACEBOOK_WALL" object:nil];
}


-(void)request:(FBRequest *)request didLoad:(id)result
{
    NSArray *allResponses = result;
    for ( int i=0; i < [allResponses count]; i++ ) {
        NSDictionary *response = [allResponses objectAtIndex:i];
        int httpCode = [[response objectForKey:@"code"] intValue];
        NSString *jsonResponse = [response objectForKey:@"body"];
        if ( httpCode != 200 ) {
            NSLog( @"Facebook request error: code: %d  message: %@", httpCode, jsonResponse );
        } else {
            NSLog( @"Facebook response: %@", jsonResponse );
        }
    }
}

//===
#pragma mark -
#pragma mark FBFeedPostDelegate

//Facebook PRE 4.2 support


-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [self.facebook handleOpenURL:url];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [self.facebook handleOpenURL:url];
}

//FBSessionDelegate implementation: Save user's credentials (accces token and corresponding expiration date)

- (void)numberTick:(id)sender {
    
    /* date fix
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
     [formatter setDateFormat:@"HHmmss"];
     NSString *newClock = [formatter stringFromDate:[NSDate date]];
     */
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2012];
    [comps setMonth:2];
    [comps setDay:7];
    [comps setHour:1];
    [comps setMinute:0];
    
    
    
    NSDate *now = [NSDate date];
    NSDate *MyTargetDateObject;
    
    MyTargetDateObject = [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:now options:0];
	//[comps release];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"'Due' EEEE d MMM yyyy, h:mm a"];
    [dateFormatter setDateFormat:@"ddd:hh:mm:ss"];
    
    //[TimerLabel setText:[dateFormatter  stringFromDate:MyTargetDateObject]];
    //self.TimerLabel.text = (@"d%",mydate);
    
    // original string
    NSString *str = [NSString stringWithFormat:@"2012-02-7T13:00:00+11:00"];
    
    // convert to date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss'+11:00'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Indian/Maldives"]];
    NSDate *otherDate = [dateFormat dateFromString:str];
    //NSLog(@"Date: %@", otherDate);
    
    NSDate *date=[NSDate date];
    int secondsNow=(int)[date timeIntervalSince1970];
    int secondsTarget=(int)[otherDate timeIntervalSince1970];
    int differenceSeconds=secondsNow-secondsTarget;
    int days=(int)((double)differenceSeconds/(3600.0*24.00));
    int diffDay=differenceSeconds-(days*3600*24);
    int hours=(int)((double)diffDay/3600.00);
    int diffMin=diffDay-(hours*3600);
    int minutes=(int)(diffMin/60.0);
    int seconds=diffMin-(minutes*60);
    
    NSString *newClock = [NSString stringWithFormat:@"%03d%02d%02d%02d",days,hours,minutes,seconds];
    //
    [_clockTickers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![[_currentClock substringWithRange:NSMakeRange(idx, 1)] isEqualToString:[newClock substringWithRange:NSMakeRange(idx, 1)]]) {
            [obj setBackView:[SBTickView tickViewWithTitle:[newClock substringWithRange:NSMakeRange(idx, 1)] fontSize:35.]];
            [obj tick:SBTickerViewTickDirectionDown animated:YES completion:nil];
        }
    }];
    
    _currentClock = newClock;
    
    HiddenLbl.text = [NSString stringWithFormat:@"%02d days %02d hours %02d minutes %02d seconds",days,hours,minutes,seconds];
    
    //NSLog(@"Clock: %@",_currentClock);
}



@end



