//
//  ItemViewController.m
//  Food
//
//  Created by Samuel Goodwin on 10/25/08.
//  Copyright 2008 Goodwinlabs. All rights reserved.
//

#import "ItemViewController.h"
#import "DetailViewController.h"


@implementation ItemViewController
@synthesize listContent;

- (IBAction)goBack:(id)sender
{
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

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [listContent count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//FoodAppDelegate *delegate = (FoodAppDelegate *)[[UIApplication sharedApplication] delegate];
	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}

	// Set up the cell
	//UIImage *displayImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[displayItem icon] ofType:@"png"]];
	//if(!testing){
	//	NSLog(@"Failed to load image.");
	//}
	//cell.image = displayImage;
	//NSLog(@"Index Path requested: %d", [indexPath indexAtPosition:1]);
	//NSLog(@"Categories contains this many: %d", [[delegate categories] count]);
	NSDictionary* item = [listContent objectAtIndex:indexPath.row];
	cell.text = [item objectForKey:@"itemTitle"];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Navigation logic -- create and push a new view controller
	DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
	NSDictionary *detailContent = [listContent objectAtIndex:indexPath.row];
	detailView.item = detailContent;
	
	[[self navigationController] pushViewController:detailView animated:YES];
	[detailView release];
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
	[listContent release];
	[super dealloc];
}


@end
