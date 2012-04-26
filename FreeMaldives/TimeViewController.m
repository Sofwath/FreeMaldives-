//
//  TimeViewController.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "TimeViewController.h"

//@interface TimeViewController ()

//@end

@implementation TimeViewController {
    NSInteger baageeTimeShow;
}
/*
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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
@synthesize _tableView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setUp];
    }
    return self;
}

- (void)setUp
{

    //set up data
    _timeScroller = [[TimeScroller alloc] initWithDelegate:self];
    
    //This is just junk data to be displayed.
    _datasource = [NSMutableArray new];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSDate *today = [NSDate date];
    NSDateComponents *todayComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:today];
    
    //fill dates
    
    //[self performSegueWithIdentifier: @"Home" sender: self];

    
    // Need clean up here.. now taking the easy way out 
    
    for (int i = 1; i < 48; i++) {
        
        NSLog(@"i:%d",i);
        
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:@"Title here" forKey:@"title"];
        
        NSInteger year;
        NSInteger month;
        NSInteger day;
        NSInteger hour;
        NSInteger minute;
        
        switch (i) {
            case 1:
                year = 2008;
                month = 11;
                day = 11;
                hour = 10;
                minute = 0;
                break;
            case 2:
                year = 2005;
                month = 7;
                day = 0;
                hour = 0;
                minute = 0;
                break;
            case 3:
                year = 2009;
                month = 1;
                day = 1;
                hour = 0;
                minute = 0;
                break;
            case 4:
                year = 2011;
                month = 11;
                day = 1;
                hour = 0;
                minute = 0;
                break;
            case 5:
                year = 2012;
                month = 1;
                day = 16;
                hour = 0;
                minute = 0;
                break;
            case 6:
                year = 2012;
                month = 1;
                day = 23;
                hour = 0;
                minute = 0;
                break;
            case 7:
                year = 2012;
                month = 1;
                day = 30;
                hour = 1;
                minute = 15;
                break;
            case 8:
                year = 2012;
                month = 2;
                day = 6;
                hour = 20;
                minute = 30;
                break;
            case 9:
                year = 2012;
                month = 2;
                day = 6;
                hour = 23;
                minute = 31;
                break;
            case 10:
                year = 2012;
                month = 2;
                day = 7;
                hour = 00;
                minute = 15;
                break;
            case 11:
                year = 2012;
                month = 2;
                day = 7;
                hour = 01;
                minute = 00;
                break;
            case 12:
                year = 2012;
                month = 2;
                day = 7;
                hour = 02;
                minute = 46;
                break;
            case 13:
                year = 2012;
                month = 2;
                day = 7;
                hour = 05;
                minute = 02;
                break;
            case 14:
                year = 2012;
                month = 2;
                day = 7;
                hour = 06;
                minute = 30;
                break;
            case 15:
                year = 2012;
                month = 2;
                day = 7;
                hour = 9;
                minute = 00;
                break;
            case 16:
                year = 2012;
                month = 2;
                day = 7;
                hour = 9;
                minute = 00;
                break;
            case 17:
                year = 2012;
                month = 2;
                day = 7;
                hour = 9;
                minute = 30;
                break;
            case 18:
                year = 2012;
                month = 2;
                day = 7;
                hour = 9;
                minute = 30;
                break;
            case 19:
                year = 2012;
                month = 2;
                day = 7;
                hour = 11;
                minute = 00;
                break;
            case 20:
                year = 2012;
                month = 2;
                day = 7;
                hour = 11;
                minute = 00;
                break;
            case 21:
                year = 2012;
                month = 2;
                day = 7;
                hour = 11;
                minute = 00;
                break;
            case 22:
                year = 2012;
                month = 2;
                day = 7;
                hour = 11;
                minute = 00;
                break;
            case 23:
                year = 2012;
                month = 2;
                day = 7;
                hour = 12;
                minute = 00;
                break;
            case 24:
                year = 2012;
                month = 2;
                day = 7;
                hour = 13;
                minute = 00;
                break;
            case 25:
                year = 2012;
                month = 2;
                day = 7;
                hour = 15;
                minute = 45;
                break;
            case 26:
                year = 2012;
                month = 2;
                day = 8;
                hour = 14;
                minute = 00;
                break;
            case 27:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 28:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 29:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 30:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 31:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 32:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 33:
                year = 2012;
                month = 2;
                day = 8;
                hour = 16;
                minute = 00;
                break;
            case 38:
                year = 2012;
                month = 2;
                day = 15;
                hour = 12;
                minute = 00;
                break;
            case 39:
                year = 2012;
                month = 2;
                day = 17;
                hour = 16;
                minute = 00;
                break;
            case 40:
                year = 2012;
                month = 2;
                day = 21;
                hour = 12;
                minute = 00;
                break;
            case 41:
                year = 2012;
                month = 2;
                day = 22;
                hour = 12;
                minute = 00;
                break;
            case 42:
                year = 2012;
                month = 2;
                day = 24;
                hour = 16;
                minute = 00;
                break;
            case 43:
                year = 2012;
                month = 2;
                day = 27;
                hour = 1;
                minute = 00;
                break;
            case 44:
                year = 2012;
                month = 3;
                day = 1;
                hour = 9;
                minute = 00;
                break;
            case 45:
                year = 2012;
                month = 3;
                day = 6;
                hour = 15;
                minute = 00;
                break;
            case 46:
                year = 2012;
                month = 3;
                day = 7;
                hour = 12;
                minute = 00;
                break;
            default:
                year = todayComponents.year;
                month = todayComponents.month;
                day = i;
                hour = 0;
                minute = 0;
                break;
        }
        
        components.year = year;
        components.month = month;
        components.day = day;
        components.hour = hour; //arc4random() % 23;
        components.minute = minute; //arc4random() % 59;
        
        NSDate *date = [calendar dateFromComponents:components];
        [dictionary setObject:date forKey:@"date"];
        
        [_datasource addObject:dictionary];
    }
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    NSLog(@"loaded stuff... ");
    
}

- (void)viewDidLoad
{
    [self setUp];
    [super viewDidUnload];
}



- (void)dealloc {
    
    //[super dealloc];        
}



#pragma mark TimeScrollerDelegate Methods

//You should return your UITableView here
- (UITableView *)tableViewForTimeScroller:(TimeScroller *)timeScroller {
    
    return _tableView;
    
}

//You should return an NSDate related to the UITableViewCell given. This will be
//the date displayed when the TimeScroller is above that cell.
- (NSDate *)dateForCell:(UITableViewCell *)cell {
    
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    NSDictionary *dictionary = [_datasource objectAtIndex:indexPath.row];
    //34,35,36,37,47
    if (indexPath.row ==34 || indexPath.row == 35 || indexPath.row == 36 || indexPath.row ==37 || indexPath.row ==46  ){
        NSString *dateString = @"";
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZ"];
        
        NSDate *date = [dateFormatter dateFromString:dateString];
        return date;
        baageeTimeShow  = 0;
    }
    NSDate *date = [dictionary objectForKey:@"date"];
    return date;
    baageeTimeShow = 1;
    
}

#pragma mark UIScrollViewDelegateMethods


//The TimeScroller needs to know what's happening with the UITableView (UIScrollView)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [_timeScroller scrollViewDidScroll];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
        
    [_timeScroller scrollViewDidEndDecelerating];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [_timeScroller scrollViewWillBeginDragging];
    

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (!decelerate) {
        [_timeScroller scrollViewDidEndDecelerating];
        
    }
    
}

#pragma mark UITableViewDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_datasource count];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static  NSString *identifier = @"TableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] ;
        
    }
    
    NSDictionary *dictionary = [_datasource objectAtIndex:indexPath.row];
    NSString *title = [dictionary objectForKey:@"title"];
    cell.textLabel.text = title;
    
    NSDate *date = [dictionary objectForKey:@"date"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:date];
    
    
    return cell;
}
 */



@end
