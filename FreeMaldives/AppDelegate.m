//
//  AppDelegate.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"


#import "FlurryAnalytics.h"
#import "FBConnect.h"


//#import "UAirship.h"

@implementation AppDelegate

@synthesize window;
@synthesize viewController;
@synthesize pushManager;

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    [pushManager handlePushRegistration:devToken];
    
    //you might want to send it to your backend if you use remote integration
    NSString *token = [pushManager getPushToken];
    NSLog(@"Push token: %@", token);
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Error registering for push notifications. Error: %@", err);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [pushManager handlePushReceived:userInfo];
    for (id key in userInfo){
        NSLog(@"key: %@,value: %@", key, [userInfo objectForKey:key]);
    }
    NSLog(@"Parameter is %@",[userInfo objectForKey:@"acme"]);
    
 //   param = [userInfo objectForKey:@"acme"]; 
    
    
    if (application.applicationState != UIApplicationStateActive) 
    {
        // Nothing to do if applicationState is Inactive, the iOS already displayed an alert view.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"FreeMaldivies Notification"
                                                            message:[NSString stringWithFormat:@"%@",
                                                                     [[userInfo objectForKey:@"aps"] objectForKey:@"alert"]]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
 //   [self loadUI]; 
}

- (void) onPushAccepted:(PushNotificationManager *)manager {
    //Handle Push Notification here
    NSLog(@"%@",pushManager.description);
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[window addSubview:viewController.view];
    //[window makeKeyAndVisible];
    [FlurryAnalytics startSession:@"5Y7HPTVW8K7V5T9FKXKV"];
    
    //DefaultSHKConfigurator *configurator = [[DefaultSHKConfigurator alloc] init];
    //[SHKConfiguration sharedInstanceWithConfigurator:configurator];
    
        //Enter your app code here
        //ask to register for remote notifications
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        
        //initialize push manager instance
        pushManager = [[PushNotificationManager alloc] initWithApplicationCode:@"4f850b30d55a87.11698892" appName:@"FreeMaldives" ];
        pushManager.delegate = self;
        [pushManager handlePushReceived:launchOptions];
       
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
    //SecondViewController *svc = [[SecondViewController alloc] init];
    
    application.applicationSupportsShakeToEdit = YES;
    
    //fb 
        
    facebook = [[Facebook alloc] initWithAppId:@"401816309847187" andDelegate:self];
   
    return YES;
}



							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
    
    //FirstViewController *fvc = [[FirstViewController alloc] init];
    



}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    NSLog(@"gone to bk");
    //tabController
    //[tabController pushViewController:controller animated:NO];
    self.viewController.tabBarController.selectedIndex=0;

    viewController.tabBarController.selectedIndex=0;
    
    // timeline view has a bug when showing the scrolltime lines after going to gb to fix that below hack is used
    
    [viewController performSegueWithIdentifier: @"Home" sender: nil];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
   
    //UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"timeline"];

    UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:@"tabController"];
    
    
    [self.window setRootViewController:initViewController];
    //[vc performSegueWithIdentifier:@"Home" sender:self];

    
    //[viewController release];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


// Pre 4.2 support
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [facebook handleOpenURL:url]; 
}

// For 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [facebook handleOpenURL:url]; 
}
- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccess-TokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpiration-DateKey"];
    [defaults synchronize];
    NSLog(@"HERE I AM");
    
}




@end
