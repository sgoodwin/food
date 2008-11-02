//
//  DetailViewController.m
//  Food
//
//  Created by Samuel Goodwin on 10/25/08.
//  Copyright 2008 Goodwinlabs. All rights reserved.
//

#import "DetailViewController.h"
#import "FoodAppDelegate.h"
#import "FoodViewController.h"

@implementation DetailViewController
@synthesize item, nutrition, imageView, thetitle;


- (IBAction)addItem:(id)sender{
	//Tell the delegate/foodviewcontroller we added an item and the item to the foodview and go back to that view.
	FoodAppDelegate *delegate = (FoodAppDelegate *)[[UIApplication sharedApplication] delegate];
	[[delegate viewController] addToBasket:[self item]];
	//It puts the item in the basket.
	[[self navigationController] popToRootViewControllerAnimated:YES];
}

- (IBAction)goBack:(id)sender{
	//return to foodview.
	[[self navigationController] popToRootViewControllerAnimated:YES];
}

/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Custom initialization
	}
	return self;
}
*/


// Implement loadView to create a view hierarchy programmatically.
// - (void)loadView {
// 	//Set the display image for the item being displayed.
// 
// 	[super loadView];
// }


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
	imageView.image = [UIImage imageNamed:[item objectForKey:@"image"]];
	thetitle.text = [item objectForKey:@"itemTitle"];
	nutrition.text = [[item objectForKey:@"info"] stringByReplacingOccurrencesOfString:@"NEW" withString:@"\n"];
	nutrition.editable = NO;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
