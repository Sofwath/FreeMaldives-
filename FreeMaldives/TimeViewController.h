//
//  TimeViewController.h
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TimeScroller.h"


@interface TimeViewController : UITableViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, TimeScrollerDelegate> {
    
    NSMutableArray *_datasource;
    TimeScroller *_timeScroller;
    NSInteger showTime;

    
}
@property (weak, nonatomic) IBOutlet UITableView *_tableView;
//@property (nonatomic, assign) BOOL showTime;
@end



