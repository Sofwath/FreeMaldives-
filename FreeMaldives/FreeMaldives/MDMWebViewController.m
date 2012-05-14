//
//  MDMWebViewController.m
//  FreeMaldives
//
//  Created by Sofwathullah Mohamed on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MDMWebViewController.h"
#import "BrowserViewController.h"

extern NSString *url;

@implementation MDMWebViewController
@synthesize cellOne;
@synthesize cellTwo;
@synthesize cellThree;
@synthesize cellFour;
@synthesize cellFive;
@synthesize cellSix;
@synthesize tableView;
@synthesize imageView;
@synthesize urlstore;
@synthesize url;
@synthesize myGlobalVariable;

@synthesize viewController = _viewController;



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];

}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidUnload];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView.rowHeight = 100;
	tableView.backgroundColor = [UIColor clearColor];
	imageView.image = [UIImage imageNamed:@"gradientBackground.png"];
    
    UIImage *imagetop = [UIImage imageNamed:@"topRow.png"];
    UIImageView *imageViewtop = [[UIImageView alloc] initWithImage:imagetop];
    
    UIImage *image = [UIImage imageNamed:@"middleRow.png"];
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:image];
    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:image];


    UIImage *imagebottom = [UIImage imageNamed:@"bottomRow.png"];
    UIImageView *imageViewbottom = [[UIImageView alloc] initWithImage:imagebottom];
    

        
    // Set the background view of the table view
    self.cellOne.backgroundView = imageViewtop;
    self.cellTwo.backgroundView = imageView1;
    self.cellThree.backgroundView = imageView2;
    self.cellFour.backgroundView = imageView3;
    self.cellFive.backgroundView = imageView4;
    self.cellSix.backgroundView = imageViewbottom;

   
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    int index = indexPath.row;

    NSLog(@"Index of the menu item currently clicked: %d", indexPath.row);

    
            
   // [self performSegueWithIdentifier:@"BrowserViewController" sender:self];
    
    

}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"moonlight"])
	{	
        BrowserViewController *browserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        browserViewController.url = @"http://www.moonlight.com.mv/";       
	} else if ([segue.identifier isEqualToString:@"ndo"])
	{        
        BrowserViewController *browserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        browserViewController.url = @"http://www.newdhivehiobserver.com/";       
	} else if ([segue.identifier isEqualToString:@"uthuru"])
	{
                BrowserViewController *browserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        browserViewController.url = @"http://www.uthuru.com/";       
	} else if ([segue.identifier isEqualToString:@"mdm"])
	{
        BrowserViewController *browserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        browserViewController.url = @"http://www.maldivesdemocracymovement.com/";       
	} else if ([segue.identifier isEqualToString:@"mvd"])
	{
        BrowserViewController *browserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        browserViewController.url = @"http://www.mvdemocracy.com";       
	} else if ([segue.identifier isEqualToString:@"dl"])
	{
        BrowserViewController *browserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        browserViewController.url = @"http://mvdemocracy.com/u/detaineeslist_201203260230.htm";       
	}
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [self setCellOne:nil];
    [self setCellTwo:nil];
    [self setCellThree:nil];
    [self setCellFour:nil];
    [self setCellSix:nil];
    [self setCellFive:nil];
    [self setCellSix:nil];
    [self setTableView:nil];
    [self setImageView:nil];
    [self setUrlstore:nil];
    [super viewDidUnload];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}



@end

