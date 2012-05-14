//
//  AppDelegate.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BrowserViewController.h"
#import "FBConnect.h"

#import "PushNotificationManager.h"



//FirstViewController

@class FirstViewController;
@class SecondViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, PushNotificationDelegate,FBSessionDelegate> {
    PushNotificationManager *pushManager;
    Facebook *facebook;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet FirstViewController *viewController;
@property (nonatomic, retain) PushNotificationManager *pushManager;

@end


