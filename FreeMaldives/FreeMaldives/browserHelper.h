//
//  browserHelper.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface browserHelper : UIApplication

-(BOOL)openURL:(NSURL *)url;

-(BOOL)openURL:(NSURL *)url forceOpenInSafari:(BOOL)forceOpenInSafari;



@end
