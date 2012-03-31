//
//  ViewController.m
//  ScrollTitle
//
//  Created by Leon on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize scrollLabelView = _scrollLabelView;
@synthesize label = _label;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.scrollLabelView.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor whiteColor];
    [self scrollLabel:nil finished:nil context:nil];
    self.navigationItem.titleView = self.scrollLabelView;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:9.0/255 green:22.0/255 blue:43.0/255 alpha:1];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil] autorelease];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil] autorelease];
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setScrollLabelView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

- (void)scrollLabel:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    CGRect labelFrame = self.label.frame;
    CGRect superFrame = self.label.superview.frame;
    self.label.frame = CGRectMake(superFrame.size.width-labelFrame.size.width, labelFrame.origin.y, labelFrame.size.width, labelFrame.size.height);
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(scrollLabel:finished:context:)];
    CGRect labelFrame = self.label.frame;
    self.label.frame = CGRectMake(0, labelFrame.origin.y, labelFrame.size.width, labelFrame.size.height);
    [UIView commitAnimations];
}

- (void)dealloc {
    [_label release];
    [_scrollLabelView release];
    [super dealloc];
}

@end
